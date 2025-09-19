-- Script SQL para criar o banco de dados do blog
-- Execute este script na Railway ou em seu banco MySQL local

-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS blog CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar o banco de dados
USE blog;

-- Tabela de categorias
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    texto TEXT,
    status TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de posts
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT,
    titulo VARCHAR(255) NOT NULL,
    texto TEXT,
    status TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserir dados de exemplo para categorias
INSERT INTO categorias (titulo, texto, status) VALUES
('Tecnologia', 'Artigos sobre tecnologia e programação', 1),
('PHP', 'Conteúdo específico sobre PHP', 1),
('Desenvolvimento Web', 'Dicas e tutoriais de desenvolvimento web', 1),
('Banco de Dados', 'Artigos sobre MySQL e outros bancos de dados', 1);

-- Inserir dados de exemplo para posts
INSERT INTO posts (categoria_id, titulo, texto, status) VALUES
(1, 'Bem-vindo ao Blog', 'Este é o primeiro post do nosso blog. Aqui você encontrará conteúdo sobre tecnologia, programação e muito mais!', 1),
(2, 'Introdução ao PHP 8', 'PHP 8 trouxe muitas melhorias e novas funcionalidades. Vamos explorar as principais novidades desta versão.', 1),
(3, 'Responsive Design com CSS', 'Aprenda como criar layouts responsivos que funcionam perfeitamente em todos os dispositivos.', 1),
(4, 'Otimização de Consultas MySQL', 'Dicas práticas para melhorar a performance das suas consultas no MySQL.', 1),
(1, 'Futuro da Programação', 'Reflexões sobre as tendências e o futuro da programação de software.', 1);

-- Criar índices para melhorar performance
CREATE INDEX idx_posts_status ON posts(status);
CREATE INDEX idx_posts_categoria_id ON posts(categoria_id);
CREATE INDEX idx_categorias_status ON categorias(status);
CREATE INDEX idx_posts_titulo ON posts(titulo);
