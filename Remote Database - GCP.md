## Abra o terminal

### Editando o arquivo de configuração MySQL
`$ nano /etc/mysql/mysql.conf.d/mysqld.cnf`

````
bind-address = 0.0.0.0
````

````
$ service mysql restart
$mysql -u root -p
````

```
mysql> USE database;
mysql> SET GLOBAL validate_password_policy=LOW;
mysql> CREATE user 'usuario'@'%' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON *.* to 'nazca_oktus'@'%' WITH GRANT OPTION;
```

### Liberando porta 3306
Vá à sua instância, mais opções e vá em Ver Detalhes da Rede.
Selecione Firewall na coluna da esquerda e Criar regra de firewall na janela que abriu.
Preencha da seguinte maneira:

````
Nome: mysql-3306-open
Registros: desativado
Rede: default
Prioridade: 1000
Direção do tráfego: Entrada
Ação se houver correspondência: Permitir
Destinos: Tags de destino especificadas
Tags de destino: mysql-3306-open
Filtro de origem: Intervalos de IP
Intervalor de IP de origem: 0.0.0.0/0
Segundo filtro de origem: Nenhum
Protocolos e portas: Portas e protocolos especificados
TCP: 3306
````

Selecione a instância novamente e edite ela, adicionando a nova regra de firewall em Tags de rede.

## Confira se a porta está aberta no site: 
https://www.yougetsignal.com/tools/open-ports/
