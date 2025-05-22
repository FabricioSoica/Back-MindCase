-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.42 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para blog_db
CREATE DATABASE IF NOT EXISTS `blog_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog_db`;

-- Copiando estrutura para tabela blog_db.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featuredImage` varchar(255) DEFAULT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela blog_db.articles: ~3 rows (aproximadamente)
INSERT INTO `articles` (`id`, `title`, `content`, `featuredImage`, `userId`, `createdAt`, `updatedAt`) VALUES
	(1, 'Brasil conquista o heptacampeonato na Copa do Mundo de Futebol de Areia 2025', 'O Brasil reafirmou sua supremacia no futebol de areia ao conquistar o título da Copa do Mundo FIFA de Futebol de Areia de 2025, realizada entre 1º e 11 de maio nas paradisíacas ilhas Seicheles. Na final emocionante, a seleção brasileira venceu a Bielorrússia por 4 a 3, garantindo seu sétimo título sob a organização da FIFA e o 16º no total, considerando as edições anteriores à gestão da entidade máxima do futebol .\r\nEsta edição marcou a primeira vez que o torneio foi sediado na África, ampliando o alcance global do esporte. A vitória brasileira não apenas destaca a excelência da equipe, mas também reforça a tradição e o domínio do país no cenário internacional do futebol de areia.', 'd57468dd75b805c8047b-rodrigo_selecao_bras_beach_soccer_mundial-2025.jpg', 4, '2025-05-22 02:35:37', '2025-05-22 02:35:37'),
	(2, 'Escalada de Tensão: Conflito entre Índia e Paquistão Atinge Níveis Críticos', 'Em maio de 2025, as relações entre Índia e Paquistão deterioraram-se drasticamente após uma série de eventos violentos na região da Caxemira. O estopim foi um ataque terrorista em Pahalgam, na Caxemira administrada pela Índia, que resultou na morte de 26 civis, em sua maioria turistas hindus. A Índia atribuiu o ataque à Frente de Resistência, um grupo dissidente do Lashkar-e-Taiba, e acusou o Paquistão de apoiar os perpetradores, embora sem apresentar provas concretas.\r\nEm resposta, em 7 de maio, a Índia lançou a "Operação Sindoor", uma série de ataques com mísseis contra o território paquistanês, visando supostas infraestruturas terroristas. O Paquistão retaliou com a "Operação Bunyan al-Marsus" em 10 de maio, realizando ataques aéreos e com drones em diversas cidades indianas. Este conflito marcou a primeira guerra de drones entre duas nações com armas nucleares, resultando em dezenas de mortes e destruição significativa de equipamentos militares.\r\nApesar de um cessar-fogo ter sido anunciado em 12 de maio, relatos indicam que as hostilidades continuaram, especialmente por parte das forças paquistanesas. Ambos os países declararam vitória, mas analistas independentes sugerem que nenhum dos lados obteve vantagem clara. A comunidade internacional permanece apreensiva quanto à estabilidade na região e à possibilidade de uma escalada nuclear', '5511ae74ae8e5fe88745-Design-sem-nome-30.jpg', 4, '2025-05-22 02:37:24', '2025-05-22 02:37:24'),
	(3, 'Tony Hawk\'s Pro Skater 3 + 4 Remake Chega em Julho com Novidades e Crossplay', 'A Activision anunciou oficialmente o lançamento de Tony Hawk\'s Pro Skater 3 + 4, um remake dos clássicos jogos de skate, para 11 de julho de 2025. Desenvolvido pela Iron Galaxy, o título estará disponível para PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, Nintendo Switch, Nintendo Switch\r\nO jogo traz gráficos aprimorados em 4K, animações mais suaves e efeitos de iluminação melhorados. Além disso, contará com patinadores clássicos como Tony Hawk, Bucky Lasek e Rodney Mullen, e introduzirá novos atletas, incluindo Rayssa Leal e Yuto Horigome. A trilha sonora combinará músicas dos jogos originais com novas faixas. O modo multijogador online suportará crossplay para até oito jogadores, e os modos "Create-A-Skater" e "Create-A-Park" oferecerão opções de personalização expandidas. ', '173b76f89a6e7b1f2142-281471.jpeg', 5, '2025-05-22 02:40:49', '2025-05-22 02:40:49'),
	(4, 'Summer Game Fest 2025 Promete Grandes Revelações em Junho', 'O Summer Game Fest 2025 está marcado para sexta-feira, 6 de junho, às 23h (horário de Brasília). Com duração estimada de duas horas, o evento será transmitido ao vivo pelos canais oficiais do The Game Awards no YouTube e Twitch.\r\nEste ano, o festival coincide com o lançamento do Nintendo Switch 2, previsto para 5 de junho, aumentando as expectativas por anúncios de novos títulos para a plataforma. Entre os jogos aguardados estão Hollow Knight: Silksong, Final Fantasy IX Remake e Death Stranding 2. Além disso, o "Day of the Devs" ocorrerá em 7 de junho, e o Xbox Games Showcase está programado para 8 de junho. ', '92c0f3e4a66bc5e2f8f5-the-preview-of-summer-game-fest-2025-is-fake-v0-abm14poa56we1.jpg', 5, '2025-05-22 02:41:57', '2025-05-22 02:41:57'),
	(5, 'TypeScript 7.0: Compilador Reescrito em Go Promete Performance 10x Superior', 'Em março de 2025, Anders Hejlsberg, criador do TypeScript, anunciou uma revolução na linguagem: o compilador está sendo reescrito em Go, visando melhorias significativas de desempenho. Nos primeiros testes, projetos como o Visual Studio Code e o TypeORM apresentaram reduções no tempo de compilação de até 13 vezes, além de menor consumo de memória e inicialização mais rápida do editor .\r\nEssa nova versão, prevista para ser lançada como TypeScript 7.0, manterá compatibilidade com versões anteriores, facilitando a transição para equipes de desenvolvimento. Além disso, espera-se que a integração com ferramentas de IA e assistentes de código seja aprimorada, tornando o desenvolvimento ainda mais eficiente .', '476591048eebd6351899-images (1).png', 6, '2025-05-22 02:44:28', '2025-05-22 02:44:28'),
	(6, 'React 19: Novas Funcionalidades para Melhorar a Experiência do Desenvolvedor', 'O React 19, lançado em dezembro de 2024, introduziu diversas melhorias para facilitar o desenvolvimento de aplicações web. Dentre as novidades, destacam-se:\r\nActions: Simplificam o gerenciamento de estados assíncronos em formulários, permitindo que o React gerencie automaticamente estados pendentes, erros e atualizações otimistas.\r\ntautorn.com.br\r\nNovos Hooks: Incluem useActionState, useFormStatus e useOptimistic, que auxiliam no controle de estados de formulários e atualizações otimistas, melhorando a responsividade da interface .\r\nReact Compiler: Em desenvolvimento, este novo compilador visa automatizar a otimização de re-renderizações, eliminando a necessidade de hooks como useMemo e useCallback, e garantindo que apenas componentes necessários sejam atualizados.\r\nEssas atualizações visam tornar o desenvolvimento com React mais intuitivo, eficiente e menos propenso a erros, especialmente em aplicações complexas.', 'd773da481a18e4df5738-images.jpeg', 6, '2025-05-22 02:45:14', '2025-05-22 02:45:14');

-- Copiando estrutura para tabela blog_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `executedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela blog_db.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `name`, `executedAt`) VALUES
	(1, '20240220_create_tables', '2025-05-21 01:40:28');

-- Copiando estrutura para tabela blog_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela blog_db.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`, `Avatar`, `profileImage`) VALUES
	(4, 'mind', 'mind@mind.com', '$2b$10$jsl00Xr..u9RWl0R7dhUku/YjEf4muXdxh8YSwT23bFr8NiG3ABuW', '2025-05-22 02:32:24', '2025-05-22 02:33:11', '0e6af78fe72405d0854d-LOGOTIPO-Mind-Group-2.png', NULL),
	(5, 'Fabrício Soica', 'fabriciorosasoica@gmail.com', '$2b$10$rcalHzM23PeXMyyrK2oaT.7TbUDIU8DvEdfOS0c5GlGPTm7DG6pOG', '2025-05-22 02:39:11', '2025-05-22 19:57:22', '18de1a7e232825361dec-unnamed.jpg', NULL),
	(6, 'dev', 'dev@dev.com', '$2b$10$QfNH9W8k8SsuZ.sN8ZeHgOr9sKZ8dcdIvAtURoamvyJS5EtZIuGVy', '2025-05-22 02:42:54', '2025-05-22 02:45:32', 'b1abe445ee0497f0ad5e-images.jpeg', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
