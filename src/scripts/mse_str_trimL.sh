#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco no início da string indicada.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trimL "   texto aqui   ")
#   echo $result # "texto aqui   "
mse_str_trimL() {
  echo "$1" | sed 's/^\s*//g'
}
