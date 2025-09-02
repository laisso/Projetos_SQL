CREATE SCHEMA SAT;
SET search_path TO SAT;

CREATE TABLE Cidade (
Cod_cid INT PRIMARY KEY,
Nome_cid VARCHAR(50),
Estado CHAR(2) NOT NULL,
Populacao INT
);

CREATE TABLE Hotel (
Cod_hotel INT PRIMARY KEY,
Cod_cid INT NOT NULL,
Nome_hotel VARCHAR(50) NOT NULL,
Categoria INT CHECK (Categoria BETWEEN 1 AND 5),
Endereco_hotel VARCHAR(100) NOT NULL,
FOREIGN KEY (Cod_cid) REFERENCES Cidade(Cod_cid)
);

CREATE TABLE Quarto (
Num_quarto INT,
Cod_hotel INT NOT NULL,
tipo_quarto VARCHAR(50) NOT NULL,
Valor_diaria DECIMAL(10,2) NOT NULL,
FOREIGN KEY (Cod_hotel) REFERENCES Hotel(Cod_hotel),
PRIMARY KEY (Num_quarto, Cod_hotel)
);

CREATE TABLE Ponto_turistico (
Cod_ponto INT PRIMARY KEY,
Cod_cid INT NOT NULL,
Descricao TEXT,
Endereco_ponto VARCHAR(200) NOT NULL,
tipo VARCHAR(20) CHECK (tipo IN ('igreja', 'Museu', 'Casa de Show')),
FOREIGN KEY (Cod_cid) REFERENCES Cidade(Cod_cid)
);

CREATE TABLE Igreja (
Cod_ponto INT PRIMARY KEY,
Estilo_construcao VARCHAR(50),
Data_construcao DATE,
FOREIGN KEY (Cod_ponto) REFERENCES Ponto_turistico(Cod_ponto)
);

CREATE TABLE Casa_de_show (
Cod_ponto INT PRIMARY KEY,
Horario_show TIME,
Fechamento VARCHAR(20),
FOREIGN KEY (Cod_ponto) REFERENCES Ponto_turistico(Cod_ponto)
);

CREATE TABLE Museu (
Cod_ponto INT PRIMARY KEY,
Data_fundacao DATE,
Num_sala INT,
FOREIGN KEY (Cod_ponto) REFERENCES Ponto_turistico(Cod_ponto)
);

CREATE TABLE Restaurante (
Cod_rest INT PRIMARY KEY,
Preco_medio DECIMAL(10,2),
Nome_rest VARCHAR(100),
Categoria_rest VARCHAR(50),
Endereco_rest VARCHAR(100),
Especialidade VARCHAR(50),
Cod_hotel INT,
Cod_ponto INT,
FOREIGN KEY (Cod_ponto) REFERENCES Casa_de_show(Cod_ponto),
FOREIGN KEY (Cod_hotel) REFERENCES Hotel(Cod_hotel),
CONSTRAINT exclusividade CHECK (
(Cod_hotel IS NULL AND Cod_ponto IS NOT NULL) OR
(Cod_hotel IS NOT NULL AND Cod_ponto IS NULL)
)
);

CREATE TABLE Fundador (
Nome_fun VARCHAR(50) NOT NULL,
Cod_fun INT PRIMARY KEY,
Nacionalidade VARCHAR(50),
Data_nascimento DATE,
Falecimento DATE,
Profissao VARCHAR(100)
);

CREATE TABLE Fundou (
Cod_fun INT,
Cod_Ponto INT,
FOREIGN KEY (Cod_fun) REFERENCES Fundador(Cod_fun),
FOREIGN KEY (Cod_ponto) REFERENCES Museu(Cod_ponto),
PRIMARY KEY (Cod_fun, Cod_ponto)
);

COMMIT;
