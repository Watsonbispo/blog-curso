#!/bin/bash

# Script para deploy na Railway
echo "🚂 Preparando deploy na Railway..."

# Verificar se Railway CLI está instalado
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI não está instalado."
    echo "📥 Instale com: npm install -g @railway/cli"
    exit 1
fi

# Fazer login na Railway
echo "🔐 Fazendo login na Railway..."
railway login

# Criar projeto na Railway
echo "🏗️  Criando projeto na Railway..."
railway init

# Adicionar serviço MySQL
echo "🗄️  Adicionando serviço MySQL..."
railway add mysql

# Fazer deploy
echo "🚀 Fazendo deploy..."
railway up

echo "✅ Deploy concluído!"
echo "🌐 URL do projeto: $(railway domain)"
echo "📊 Execute o script database.sql no banco MySQL da Railway"
