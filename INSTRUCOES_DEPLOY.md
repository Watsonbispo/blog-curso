# 🚀 Instruções de Deploy - Blog PHP

## 📋 Resumo do que foi configurado

✅ **Projeto analisado e mantido exatamente como estava**
✅ **Configuração Docker para desenvolvimento local**
✅ **Configuração para deploy na Railway**
✅ **Script SQL para criação do banco de dados**
✅ **Branches Git configuradas: `main` (produção) e `develop` (desenvolvimento)**
✅ **Scripts de automação criados**

## 🏠 Como rodar localmente

### Opção 1: Script automatizado
```bash
./scripts/setup-local.sh
```

### Opção 2: Manual
```bash
# 1. Subir os containers
docker-compose up -d

# 2. Aguardar MySQL estar pronto (30 segundos)
sleep 30

# 3. Executar script SQL
docker exec -i blog_mysql mysql -u root -proot123 < database.sql

# 4. Acessar o projeto
# http://localhost:8000
```

## 🚂 Deploy na Railway

### 1. Preparação
```bash
# Instalar Railway CLI
npm install -g @railway/cli

# Fazer login
railway login
```

### 2. Deploy automático
```bash
./scripts/deploy-railway.sh
```

### 3. Deploy manual
```bash
# 1. Inicializar projeto
railway init

# 2. Adicionar MySQL
railway add mysql

# 3. Fazer deploy
railway up
```

### 4. Configurar banco na Railway
1. Acesse o painel da Railway
2. Vá em "MySQL" > "Query"
3. Execute o conteúdo do arquivo `database.sql`

## 🌿 Estrutura das Branches

- **`main`**: Branch de produção (deploy automático na Railway)
- **`develop`**: Branch de desenvolvimento (trabalho diário)

### Fluxo de trabalho
```bash
# Trabalhar na develop
git checkout develop
# ... fazer alterações ...
git add .
git commit -m "feat: nova funcionalidade"
git push origin develop

# Quando pronto para produção
git checkout main
git merge develop
git push origin main
```

## 📊 Estrutura do Banco de Dados

O script `database.sql` cria:

### Tabela `categorias`
- `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `titulo` (VARCHAR(255))
- `texto` (TEXT)
- `status` (TINYINT(1), DEFAULT 1)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### Tabela `posts`
- `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `categoria_id` (INT, FOREIGN KEY)
- `titulo` (VARCHAR(255))
- `texto` (TEXT)
- `status` (TINYINT(1), DEFAULT 1)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

## 🔧 Variáveis de Ambiente (Railway)

Configure estas variáveis no painel da Railway:
- `MYSQL_HOST`
- `MYSQL_PORT`
- `MYSQL_DATABASE`
- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `RAILWAY_PUBLIC_DOMAIN`

## 📁 Arquivos Criados

- `docker-compose.yml` - Configuração Docker local
- `Dockerfile.railway` - Dockerfile para Railway
- `railway.json` - Configuração Railway
- `database.sql` - Script de criação do banco
- `configuracao-railway.php` - Config para Railway
- `.htaccess` - Configurações Apache
- `scripts/setup-local.sh` - Script setup local
- `scripts/deploy-railway.sh` - Script deploy Railway
- `README.md` - Documentação completa

## ✅ Próximos Passos

1. **Testar localmente**: Execute `./scripts/setup-local.sh`
2. **Criar repositório GitHub**: Conecte com Railway
3. **Fazer primeiro deploy**: Execute `./scripts/deploy-railway.sh`
4. **Configurar banco**: Execute `database.sql` na Railway
5. **Começar desenvolvimento**: Trabalhe na branch `develop`

## 🆘 Suporte

Se encontrar problemas:
1. Verifique os logs: `docker-compose logs`
2. Verifique se o MySQL está rodando: `docker ps`
3. Teste a conexão: `docker exec -it blog_mysql mysql -u root -p`
