CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE pizzas (
    pizza_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20),  -- Exemplo: "Pequena", "Média", "Grande"
    categoria VARCHAR(50)  -- Exemplo: "Tradicional", "Gourmet", "Vegana"
);
CREATE TABLE ingredientes (
    ingrediente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);
CREATE TABLE pizza_ingredientes (
    pizza_id INT REFERENCES pizzas(pizza_id) ON DELETE CASCADE,
    ingrediente_id INT REFERENCES ingredientes(ingrediente_id) ON DELETE CASCADE,
    PRIMARY KEY (pizza_id, ingrediente_id)
);
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,  -- Exemplo: "Em preparo", "Enviado", "Entregue"
    endereco_entrega VARCHAR(255),
    total DECIMAL(10, 2) NOT NULL
);
CREATE TABLE pedido_pizza (
    pedido_id INT REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    pizza_id INT REFERENCES pizzas(pizza_id) ON DELETE CASCADE,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (pedido_id, pizza_id)
);
CREATE TABLE pagamento (
    pagamento_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    metodo_pagamento VARCHAR(50) NOT NULL,  -- Exemplo: "Cartão de Crédito", "Dinheiro", "PIX"
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
