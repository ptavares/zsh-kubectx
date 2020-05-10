#!/usr/bin/env zsh

#####################
# COMMONS
#####################
autoload colors is-at-least

#########################
# CONSTANT
#########################
BOLD="bold"
NONE="NONE"

#########################
# PLUGIN MAIN
#########################

[[ -z "$KUBECTX_HOME" ]] && export KUBECTX_HOME="$HOME/.kubectx/"

ZSH_KUBECTX_VERSION_FILE=${KUBECTX_HOME}/version.txt

#########################
# Functions
#########################

_zsh_kubectx_log() {
  local font=$1
  local color=$2
  local msg=$3

  if [ $font = $BOLD ]
  then
    echo $fg_bold[$color] "[zsh-kubectx-plugin] $msg" $reset_color
  else
    echo $fg[$color] "[zsh-kubectx-plugin] $msg" $reset_color
  fi
}

_zsh_kubectx_last_version() {
  echo $(curl -s https://api.github.com/repos/ahmetb/kubectx/releases | grep tag_name | head -n 1 | cut -d '"' -f 4)
}

_zsh_kubectx_download_install() {
    local version=$1
    _zsh_kubectx_log $NONE "blue" "  -> download and install kubectx ${version}"
    wget -qc https://github.com/ahmetb/kubectx/releases/download/${version}/kubectx_${version}_${OSTYPE%-*}_x86_64.tar.gz -O - | tar xz -C ${KUBECTX_HOME}
    _zsh_kubectx_log $NONE "blue" "  -> download and install kubens ${version}"
    wget -qc https://github.com/ahmetb/kubectx/releases/download/${version}/kubens_${version}_${OSTYPE%-*}_x86_64.tar.gz  -O - | tar xz -C ${KUBECTX_HOME}
    echo ${version} > ${ZSH_KUBECTX_VERSION_FILE}
}

_zsh_kubectx_install() {
  _zsh_kubectx_log $NONE "blue" "#############################################"
  _zsh_kubectx_log $BOLD "blue" "Installing kubectx..." 
  _zsh_kubectx_log $NONE "blue" "-> creating kubectx home dir : ${KUBECTX_HOME}"  
  mkdir -p ${KUBECTX_HOME} || _zsh_kubectx_log $NONE "green" "dir already exist"
  local last_version=$(_zsh_kubectx_last_version)
  _zsh_kubectx_log $NONE "blue" "-> retrieve last version of kubectx..."
  _zsh_kubectx_download_install ${last_version}
  _zsh_kubectx_log $BOLD "green" "Install OK"
  _zsh_kubectx_log $NONE "blue" "#############################################"
}

update_zsh_kubectx() {
  _zsh_kubectx_log $NONE "blue" "#############################################"
  _zsh_kubectx_log $BOLD "blue" "Checking new version of kubectx..."
  
  local current_version=$(cat ${ZSH_KUBECTX_VERSION_FILE})
  local last_version=$(_zsh_kubectx_last_version)

  if is-at-least ${last_version#v*} ${current_version#v*}
  then
    _zsh_kubectx_log $BOLD "green" "Already up to date, current version : ${current_version}"
  else
    _zsh_kubectx_log $NONE "blue" "-> Updating kubectx..." 
    _zsh_kubectx_download_install ${last_version}
    _zsh_kubectx_log $BOLD "green" "Update OK"
  fi
  _zsh_kubectx_log $NONE "blue" "#############################################"
}

_zsh_kubectx_load() {
    # export PATH
    export PATH=${PATH}:${KUBECTX_HOME}
}

# install kubectx if it isnt already installed
[[ ! -f "${ZSH_KUBECTX_VERSION_FILE}" ]] && _zsh_kubectx_install

# load kubectx if it is installed
if [[ -f "${ZSH_KUBECTX_VERSION_FILE}" ]]; then
    _zsh_kubectx_load
fi

unset -f _zsh_kubectx_install _zsh_kubectx_load