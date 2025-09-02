SET search_path TO SAT;

INSERT INTO Cidade (Cod_cid, Nome_cid, Estado, Populacao) VALUES
(1, 'São Paulo', 'SP', 12300000),
(2, 'Rio de Janeiro', 'RJ', 6700000),
(3, 'Salvador', 'BA', 2900000),
(4, 'Belo Horizonte', 'MG', 2500000),
(5, 'Fortaleza', 'CE', 2700000);

INSERT INTO Hotel (Cod_hotel, Cod_cid, Nome_hotel, Categoria, Endereco_hotel) VALUES
(1, 1, 'Hotel Paulista', 5, 'Av. Paulista, 1000'),
(2, 2, 'Hotel Copacabana', 4, 'Av. Atlântica, 2000'),
(3, 3, 'Hotel Bahia', 3, 'Rua Pelourinho, 50'),
(4, 4, 'Hotel Minas', 5, 'Av. Afonso Pena, 300'),
(5, 5, 'Hotel Praia', 4, 'Av. Beira Mar, 500');

INSERT INTO Quarto (Num_quarto, Cod_hotel, tipo_quarto, Valor_diaria) VALUES
(101, 1, 'Luxo', 500.00),
(102, 1, 'Standard', 300.00),
(201, 2, 'Suite', 600.00),
(301, 3, 'Standard', 250.00),
(401, 4, 'Luxo', 550.00),
(501, 5, 'Suite', 450.00);

INSERT INTO Ponto_turistico (Cod_ponto, Cod_cid, Descricao, Endereco_ponto, tipo) VALUES
(1, 1, 'Igreja histórica de São Paulo', 'Praça da Sé, 10', 'igreja'),
(2, 2, 'Museu de Arte Moderna', 'Parque do Flamengo, s/n', 'Museu'),
(3, 3, 'Casa de show Axé Bahia', 'Rua da Música, 22', 'Casa de Show'),
(4, 4, 'Museu das Minas e do Metal', 'Praça da Liberdade, 1', 'Museu'),
(5, 5, 'Igreja do Ceará', 'Centro Histórico, Fortaleza', 'igreja');

INSERT INTO Igreja (Cod_ponto, Estilo_construcao, Data_construcao) VALUES
(1, 'Gótico', '1754-06-01'),
(5, 'Barroco', '1780-08-15');

INSERT INTO Casa_de_show (Cod_ponto, Horario_show, Fechamento) VALUES
(3, '22:00', '2:00'),
(4, '20:00', '1:00'),
(5, '18:00', '23:00');

INSERT INTO Museu (Cod_ponto, Data_fundacao, Num_sala) VALUES
(2, '1948-03-15', 12),
(4, '1990-07-22', 8);

INSERT INTO Restaurante (Cod_rest, Preco_medio, Nome_rest, Categoria_rest, Endereco_rest, Especialidade, Cod_hotel, Cod_ponto) VALUES
(1, 80.00, 'Restô Paulista', 'Gourmet', 'Av. Paulista, 1020', 'Brasileira', 1, NULL),
(2, 90.00, 'Mar Azul', 'Peixes e Frutos do Mar', 'Av. Atlântica, 2010', 'Frutos do Mar', 2, NULL),
(3, 70.00, 'Bahia Sabor', 'Regional', 'Pelourinho, 55', 'Baiana', NULL, 3),
(4, 85.00, 'Liberdade Gourmet', 'Alta Gastronomia', 'Praça Liberdade, 2', NULL, NULL, 4),
(5, 60.00, 'Sabores do Ceará', 'Nordestina', 'Centro Histórico, Fortaleza', 'Nordestina', NULL, 5);

INSERT INTO Fundador (Nome_fun, Cod_fun, Nacionalidade, Data_nascimento, Falecimento, Profissao) VALUES
('José da Silva', 1, 'Brasileiro', '1920-01-01', '1990-05-10', 'Historiador'),
('Maria Souza', 2, 'Brasileira', '1935-03-20', NULL, 'Arquiteta'),
('Carlos Pereira', 3, 'Brasileiro', '1950-07-15', NULL, 'Artista Plástico'),
('Ana Lima', 4, 'Brasileira', '1945-11-30', NULL, 'Arqueóloga'),
('João Oliveira', 5, 'Português', '1910-05-22', '1980-09-14', 'Empresário');

INSERT INTO Fundou (Cod_fun, Cod_ponto) VALUES
(1, 2),
(2, 2),
(3, 4),
(4, 4),
(5, 2);

COMMIT;
