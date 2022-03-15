#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trim() {
  testResult=$(mse_str_trim "   texto   aqui   ")
  testExpected="texto   aqui"

  mse_utest_assertEqual
}
