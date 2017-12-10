#
#
#  Author       : dmike
#  Date         : 9 December 2017
#  Description  : Component generator script
#
# ============================================================================ #

function generator_component() {
    logging__info "Generating component ${1}"
    local module
    ## Check module name
    if [[ $# -lt 3 ]]; then
      module="src/app"
    else
      module="src/${2}"
    fi
    ## Check project initialized
    if [[ -d "./src" ]]; then
      if [[ -d "${module}" ]]; then
        __generator__create_component "${1}" "${module}" || return $?
        logging__info "Add the component ${1} to the module ${module##*/}"
      else
        logging__error "Project not initialized"
        return 1
      fi
    else
      logging__error "Project not initialized"
      return 1
    fi
}

function __generator__create_component() {
  local conteiner
  container="${2}/${1}"
  ## Create folder component
  mkdir "${container}" || return $?
  ## Create html template
  touch "${container}/${1}.component.html" || return $?
  ## Create stylesheet
  touch "${container}/${1}.component.scss" || return $?
  ## Create ts controller
  local ts_class
  ts_class=$(printf ${1:0:1} | tr "[[:lower:]]" "[[:upper:]]")${1:1}
  cat > "${container}/${1}.component.ts"<<CONTROLLER
import { Component } from '@angular/core';

@Component({
  selector: '${2##*/}-${1}',
  templateUrl: './${1}.component.html',
  styleUrls: ['./${1}.component.scss']
})
export class ${ts_class} {
  constructor(){}
}
CONTROLLER
}
