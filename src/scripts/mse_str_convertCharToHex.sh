#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte/decompõe o valor Char informado para o respectivo Hexadecimal.
#
# Caracteres multibyte retornarão mais de um hexadecimal, cada qual representando um
# de seus bytes.
#
# @param int $1
# Valor que será convertido.
#
# @param bool $2
# Se omitido, ou se '0' irá retornar o valor convertido e adicionará uma linha
# em branco após a impressão.
# Se '1' retornará apenas o caracter.
#
# @example
#   mse_str_convertCharToHex "í"    # converte para -> "C3 AD"
#   result=$(mse_str_convertCharToHex "í" 1)
mse_str_convertCharToHex() {
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=C

  if [ $# != 1 ] && [ $# != 2 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_generic_lostArguments}"
  else
    local i
    local c
    local mseStr=$1


    #
    # Desmembra strings multibytes em seus bytes componentes e após
    # converte o valor de cada um.
    for (( i=0; i<${#mseStr}; i++ )); do
      c="${mseStr:$i:1}"

      if [ "$i" != "0" ]; then
        printf ' '
      fi
      printf '%X' "'$c"
    done


    #
    # Adiciona o caracter de 'nova linha' caso necessário
    if [ $# == 1 ]; then
      printf "\n"
    else
      if [ $# == 2 ] && [ $2 == 0 ]; then
        printf "\n"
      fi
    fi

  fi

  LC_CTYPE="${oLC_CTYPE}"
}
