#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui toda ocorrencia da string $1 pela
# string $2 encontrada na string definida em $3.
#
# @param string $1
# String antiga (que será substituída).
#
# @param string $2
# String nova (que será adicionada no local da antiga).
#
# @param string $3
# String original. Onde ocorrerá a substituição
#
# @example
#   result=$(mse_str_replace "22" "20" "2022-12-22")
#   printf $result # "2020-12-20"
mse_str_replace() {
  local mseOLD
  local mseNEW
  local mseOriginal
  local mseR=""


  if [ $# -lt 3 ]; then
    mse_mod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else
    mseOLD=$1
    mseNEW=$2
    mseOriginal=$3

    #
    # Apenas se a string original não estiver vazia...
    if [ "$3" != "" ]; then
      local mseREG

      #
      # Trata caracteres que podem ocasionar falhas no uso do 'sed'
      # ao usar o replace
      #
      # Adiciona uma contrabarra em toda barra encontrada.
      mseREG='s/\//\\\//g'
      mseOLD="$(printf "$mseOLD" | sed -e "${mseREG}")"
      mseNEW="$(printf "$mseNEW" | sed -e "${mseREG}")"

      #
      # Efetua a substituição pedida
      mseREG='s/'$mseOLD'/'$mseNEW'/g'
      mseR="$(printf "$mseOriginal" | sed -e "${mseREG}")"
    fi
  fi

  printf "${mseR}"
}
