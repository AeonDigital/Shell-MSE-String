#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o argumento passado para maiúsculas.
#
# @param string $1
# String que será convertida.
#
# @example
#   result=$(mse_str_toUpperCase "text")
mse_str_toUpperCase() {
  echo "$1" | awk '{print toupper($0)}'
}
