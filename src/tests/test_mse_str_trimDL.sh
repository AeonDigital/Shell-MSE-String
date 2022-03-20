#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimDL() {
  testResult=$(mse_str_trimDL "," "  Keep  calm   ,   and   ... ,   think  ")
  testExpected="  Keep  calm,   and   ...,   think  "

  mse_utest_assertEqual
}
