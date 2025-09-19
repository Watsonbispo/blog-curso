<?php

//Arquivo de configuração do sistema para Railway
//define o fuso horario
date_default_timezone_set('America/Sao_Paulo');

//dados de acesso ao banco de dados - Railway
define('DB_HOST', $_ENV['MYSQL_HOST'] ?? 'localhost');
define('DB_PORTA', $_ENV['MYSQL_PORT'] ?? '3306');
define('DB_NOME', $_ENV['MYSQL_DATABASE'] ?? 'blog');
define('DB_USUARIO', $_ENV['MYSQL_USER'] ?? 'root');
define('DB_SENHA', $_ENV['MYSQL_PASSWORD'] ?? '');

//informações do sistema
define('SITE_NOME', 'UnSet');
define('SITE_DESCRICAO', 'UnSet - Tecnologia em Sistemas');

//urls do sistema
define('URL_PRODUCAO', $_ENV['RAILWAY_PUBLIC_DOMAIN'] ?? 'https://unset.com.br');
define('URL_DESENVOLVIMENTO', 'http://localhost/blog');

define('URL_SITE', '');
