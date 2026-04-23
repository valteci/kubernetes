# PROPÓSITO DESSA PASTA SEPARADA
O propósito é fazer deploy de uma pod postgres usando alguns conceitos vistos do kubernets.

Esse teste inclui um client Postgres apenas para testar se a conexão está funcionando.


# PROPÓSITO DE CADA ARQUIVO .yml
* `configMap.yml:` guardar variáveis de ambiente não sensíveis relacionadas ao banco postgres.
* `secret.yml:` guardar variáveis de ambiente sensíveis relacionadas ao banco postgres.
* 