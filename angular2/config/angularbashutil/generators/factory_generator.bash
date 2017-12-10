#
#
#  Author       : dmike
#  Date         : 9 December 2017
#  Description  : Generatory script factory for angular2:
#  -module
#  -component
#  -provider
#  -directive
#  -pipe
#
# ============================================================================ #

# ============================================================================ #
# Generate angular pice of code
# Globals:
# loggin function imported in the main script
# Arguments:
#   stuff to generate
# Returns:
#   cat exit code
# ============================================================================ #

source angularbashutil/generators/module_generator.bash
source angularbashutil/generators/component_generator.bash
source angularbashutil/generators/directive_generator.bash
source angularbashutil/generators/provider_generator.bash
source angularbashutil/generators/pipe_generator.bash

function generator__factory() {
  logging__info "Generating code for ${1}"
  local r_code
  local module

  case "$1" in
    "module" )
      generator_module "$2"
      r_code=$?
      ;;
    "component")
      generator_component "$2" "$3"
      r_code=$?
      ;;
    "provider")
      generator_provider "$2" "$3"
      r_code=$?
      ;;
    "directive")
      generator_directive "$2" "$3" "$4"
      r_code=$?
      ;;
    "pipe")
      generator_pipe "$2" "$3"
      r_code=$?
      ;;
    *)
      r_code=127
      ;;
  esac

  return ${r_code}
}
