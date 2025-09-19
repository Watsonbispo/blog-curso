#!/bin/bash

# Script para configurar o ambiente local
echo "🚀 Configurando ambiente local do Blog PHP..."

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado. Por favor, instale o Docker primeiro."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose não está instalado. Por favor, instale o Docker Compose primeiro."
    exit 1
fi

# Parar containers existentes
echo "🛑 Parando containers existentes..."
docker-compose down

# Construir e iniciar containers
echo "🔨 Construindo e iniciando containers..."
docker-compose up -d --build

# Aguardar MySQL estar pronto
echo "⏳ Aguardando MySQL estar pronto..."
sleep 30

# Executar script SQL
echo "📊 Configurando banco de dados..."
docker exec -i blog_mysql mysql -u root -proot123 < database.sql

echo "✅ Ambiente local configurado com sucesso!"
echo "🌐 Acesse: http://localhost:8000"
echo "🗄️  MySQL: localhost:3306 (usuário: root, senha: root123)"
