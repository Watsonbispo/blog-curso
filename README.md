# Blog PHP - UnSet

Sistema de blog desenvolvido em PHP 8 com Twig e Simple Router.

## 🚀 Configuração Local

### Pré-requisitos
- Docker
- Docker Compose

### Instalação

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd blog
```

2. Execute o projeto com Docker:
```bash
docker-compose up -d
```

3. Acesse o projeto:
- Frontend: http://localhost:8000
- MySQL: localhost:3306

### Configuração do Banco Local

1. Acesse o MySQL:
```bash
docker exec -it blog_mysql mysql -u root -p
# Senha: root123
```

2. Execute o script SQL:
```sql
source /var/www/html/database.sql
```

## 🚂 Deploy na Railway

### Configuração

1. Crie um projeto na Railway
2. Conecte o repositório GitHub
3. Adicione as variáveis de ambiente:
   - `MYSQL_HOST`
   - `MYSQL_PORT`
   - `MYSQL_DATABASE`
   - `MYSQL_USER`
   - `MYSQL_PASSWORD`
   - `RAILWAY_PUBLIC_DOMAIN`

4. Execute o script `database.sql` no banco MySQL da Railway

### Estrutura do Banco

O banco possui duas tabelas principais:
- `categorias`: Armazena as categorias dos posts
- `posts`: Armazena os posts do blog

## 📁 Estrutura do Projeto

```
blog/
├── sistema/
│   ├── Controlador/     # Controladores MVC
│   ├── Modelo/          # Modelos de dados
│   ├── Nucleo/          # Classes base do sistema
│   └── Suporte/         # Classes de suporte
├── templates/           # Templates Twig
├── dockerfiles/         # Dockerfiles para PHP e MySQL
├── database.sql         # Script de criação do banco
└── docker-compose.yml   # Configuração Docker local
```

## 🔧 Tecnologias

- PHP 8.0+
- MySQL 8.0
- Twig (Template Engine)
- Simple Router
- Docker

## 📝 Rotas

- `/` - Página inicial
- `/sobre-nos` - Página sobre
- `/post/{id}` - Visualizar post
- `/categoria/{id}` - Posts por categoria
- `/buscar` - Buscar posts (POST)
- `/404` - Página de erro

## 🌿 Branches

- `main` - Branch principal (produção)
- `develop` - Branch de desenvolvimento
- `feature/*` - Branches de funcionalidades
