#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco no final da string indicada.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trimR "   texto aqui   ")
#   echo $result # "   texto aqui"
mse_str_trimR() {
  echo "$1" | sed 's/\s*$//g'
}
