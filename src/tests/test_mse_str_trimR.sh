#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimR() {
  testResult=$(mse_str_trimR "   texto aqui   ")
  testExpected="   texto aqui"

  mse_utest_assertEqual
}
