#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Hexadecimal informado para o respectivo Decimal.
#
# Use múltiplos valores separados por espaços se quiser converter mais de
# um ao mesmo tempo.
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
#   mse_str_convertHexToDecimal "A1"      # converte para -> 161
#   mse_str_convertHexToDecimal "C3 AD"   # converte para -> "195 173"
#   result=$(mse_str_convertHexToDecimal "161" 1)
mse_str_convertHexToDecimal() {
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=C

  if [ $# != 1 ] && [ $# != 2 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_generic_lostArguments}"
  else
    local i
    local mseIsValid=1
    local mseArrParam=(${1// / })
    local mseRawOutput
    local mseTmp


    #
    # verifica cada um dos valores apresentados identificando se
    # são válidos
    local mseREG='^[0-9A-Fa-f]{1,}$'
    for (( i=0; i<${#mseArrParam[@]}; i++ )); do
      if [ $mseIsValid == 1 ]; then
        if ! [[ ${mseArrParam[$i]} =~ $mseREG ]]; then
          mseIsValid=0
          mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_convert_originalValueIsNotValidHexadecimal}"
        fi
      fi
    done


    if [ $mseIsValid == 1 ]; then

      #
      # Converte cada um dos valores apresentados
      for (( i=0; i<${#mseArrParam[@]}; i++ )); do
        if [ "$i" != "0" ]; then
          mseRawOutput+='-'
        fi

        # Converte cada hex em um decimal
        mseTmp=$(printf $((16#${mseArrParam[$i]})))
        mseRawOutput+="${mseTmp}"
      done

      printf $mseRawOutput | sed 's/-/ /g'

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
  fi

  LC_CTYPE="${oLC_CTYPE}"
}
