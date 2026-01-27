CREATE TABLE `fotos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome_foto` varchar(45) DEFAULT NULL,
  `caminho` varchar(45) DEFAULT NULL,
  `quarto` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT * FROM hotel.tipo_quarto;



INSERT INTO foto_quarto (nome_foto, caminho ) VALUES
('QUARTO 101', 'uploads/quartos/176947196586.webp', 1 ),
('QUARTO 102', 'uploads/quartos/176947202272.webp', 2 ),
('201', 'uploads/quartos/1769472076615.webp', 3 ),
('202', 'uploads/quartos/176947209325.jpg', 4 ),
('301', 'uploads/quartos/1769472109446.webp', 5 ),
('302', 'uploads/quartos/1769472125748.webp', 6 ),
('401', 'uploads/quartos/1769472153269.webp', 7 ),
('402', 'uploads/quartos/176947217079.webp', 8 ),
('501', 'uploads/quartos/1769472186659.jpg', 10 ),
('502', 'uploads/quartos/1769472533649.webp', 11 );



CREATE TABLE `perfil` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO perfil (perfil, status) VALUES
('HOSPEDE', 'ATIVO'),
('ADMINISTRADOR', 'ATIVO'),
('RECEPCIONISTA', 'ATIVO'),
('MANOBRISTA', 'ATIVO'),
('CAMAREIRA', 'ATIVO'),
('COZINHEIRO', 'ATIVO'),
('AUX.MANUTENÇÃO', 'ATIVO');



CREATE TABLE `quartos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `numero` int DEFAULT NULL,
  `andar` int DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO quarto (numero, andar, tipo, status) VALUES
(101, 1, 1, 'LIVRE'),
(102, 1, 1, 'LIVRE'),
(201, 2, 3, 'LIVRE'),
(202, 2, 3, 'LIVRE'),
(301, 3, 5, 'LIVRE'),
(302, 3, 5, 'LIVRE'),
(401, 4, 6, 'LIVRE'),
(402, 4, 6, 'LIVRE'),
(501, 5, 2, 'LIVRE'),
(502, 5, 2, 'LIVRE');



CREATE TABLE `tipo_quarto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `valor_diaria` decimal(10,2) DEFAULT NULL,
  `capacidade` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO tipo_quarto (descricao, valor_diaria, capacidade) VALUES
('Standard', 250.00, 2),
('Superior', 350.00, 2),
('Deluxe', 600.00, 2),
('Suíte', 900.00, 4),
('Suíte Master', 1500.00, 5),
('Suíte Presidencial', 10000.00, 7);


