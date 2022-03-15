#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimD() {
  testResult=$(mse_str_trimD ":" "  Keep  calm   :   and   ... :   think  ")
  testExpected="  Keep  calm:and   ...:think  "

  mse_utest_assertEqual
}
