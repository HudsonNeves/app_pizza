INSERT INTO clientes (nome, email, telefone, endereco)
VALUES ('João Silva', 'joao@email.com', '1234-5678', 'Rua A, 123, São Paulo');

INSERT INTO pizzas (nome, descricao, preco, tamanho, categoria)
VALUES ('Pizza de Calabresa', 'Pizza com calabresa, queijo e cebola', 29.90, 'Média', 'Tradicional');

INSERT INTO ingredientes (nome, descricao)
VALUES ('Calabresa', 'Calabresa fatiada e temperada'),
       ('Queijo', 'Queijo muçarela'),
       ('Cebola', 'Cebola fatiada');

INSERT INTO pizza_ingredientes (pizza_id, ingrediente_id)
VALUES (1, 1),  -- Pizza 1 com Calabresa
       (1, 2),  -- Pizza 1 com Queijo
       (1, 3);  -- Pizza 1 com Cebola

INSERT INTO pedidos (cliente_id, status, endereco_entrega, total)
VALUES (1, 'Em preparo', 'Rua A, 123, São Paulo', 29.90);

INSERT INTO pedido_pizza (pedido_id, pizza_id, quantidade)
VALUES (1, 1, 2);  -- Pedido 1 com 2 pizzas de Calabresa

INSERT INTO pagamento (pedido_id, metodo_pagamento, valor)
VALUES (1, 'Cartão de Crédito', 29.90);
