#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco existente imediatamente
# APÓS do delimitador indicado.
#
# @param string $1
# Delimitador.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trimDR "," "Keep calm   ,   and...")
#   echo $result # "Keep calm   ,and..."
mse_str_trimDR() {
  sed 's/'"$1"'\s*/'"$1"'/g' <<< "$2"
}
