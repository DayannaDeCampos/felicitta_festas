-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para db_aula
CREATE DATABASE IF NOT EXISTS `db_aula` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_aula`;

-- Copiando estrutura para tabela db_aula.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.categoria: ~2 rows (aproximadamente)
INSERT INTO `categoria` (`id`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'funcionário', NULL, NULL),
	(2, 'cliente', NULL, NULL),
	(3, 'gerente', NULL, NULL);

-- Copiando estrutura para tabela db_aula.categoriafilme
CREATE TABLE IF NOT EXISTS `categoriafilme` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.categoriafilme: ~6 rows (aproximadamente)
INSERT INTO `categoriafilme` (`id`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'ação', NULL, NULL),
	(2, 'comédia', NULL, NULL),
	(3, 'drama', NULL, NULL),
	(4, 'romance', NULL, NULL),
	(5, 'terror', NULL, NULL),
	(6, 'aventura', NULL, NULL),
	(7, 'Ficção científica', NULL, NULL);

-- Copiando estrutura para tabela db_aula.categoriafuncionario
CREATE TABLE IF NOT EXISTS `categoriafuncionario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.categoriafuncionario: ~4 rows (aproximadamente)
INSERT INTO `categoriafuncionario` (`id`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'atendente', NULL, NULL),
	(2, 'cinegrafista', NULL, NULL),
	(3, 'vendedor', NULL, NULL),
	(4, 'cozinheiro', NULL, NULL),
	(5, 'gerente', NULL, NULL);

-- Copiando estrutura para tabela db_aula.categoriaproduto
CREATE TABLE IF NOT EXISTS `categoriaproduto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.categoriaproduto: ~4 rows (aproximadamente)
INSERT INTO `categoriaproduto` (`id`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'doces', NULL, NULL),
	(2, 'bomboniere', NULL, NULL),
	(3, 'bebidas', NULL, NULL),
	(4, 'balde de pipoca', NULL, NULL);

-- Copiando estrutura para tabela db_aula.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.failed_jobs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela db_aula.filme
CREATE TABLE IF NOT EXISTS `filme` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sinopse` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagemfilme` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoriafilme_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filme_categoriafilme_id_foreign` (`categoriafilme_id`),
  CONSTRAINT `filme_categoriafilme_id_foreign` FOREIGN KEY (`categoriafilme_id`) REFERENCES `categoriafilme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.filme: ~6 rows (aproximadamente)
INSERT INTO `filme` (`id`, `nome`, `horario`, `sinopse`, `imagemfilme`, `created_at`, `updated_at`, `categoriafilme_id`) VALUES
	(16, 'Super Mario Bross - O filme', '14:20', 'Mario e Luigi são encanadores em Nova York. Os dois acabam viajando por labirinto subterrâneo e vão parar em um universo paralelo. Enquanto Luigi se vê preso pelo violento Bowser, Mario terá que ajudar uma princesa a salvar seu reino e libertar seu irmão!', 'imagem/20230526165416.jpg', '2023-05-24 21:51:39', '2023-05-26 19:54:16', 6),
	(18, 'Guardiões das Galáxias', '18:30', 'O aventureiro do espaço Peter Quill torna-se presa de caçadores de recompensas depois que rouba a esfera de um vilão traiçoeiro, Ronan. Para escapar do perigo, ele faz uma aliança com um grupo de quatro extraterrestres. Quando Quill descobre que a esfera roubada possui um poder capaz de mudar os rumos do universo, ele e seu grupo deverão proteger o objeto para salvar o futuro da galáxia.', 'imagem/20230531171711.jpg', '2023-05-24 22:05:07', '2023-05-31 20:17:11', 6),
	(19, 'John Wick 4', '21:10', 'Com o preço por sua cabeça cada vez maior, o lendário assassino de aluguel John Wick leva sua luta contra o High Table global enquanto procura os jogadores mais poderosos do submundo, de Nova York a Paris, do Japão a Berlim.', 'imagem/20230524190546.jpg', '2023-05-24 22:05:46', '2023-05-24 22:05:46', 1),
	(20, 'Velozes e Furiosos 10', '20:00', 'Dom Toretto e sua família precisam lidar com o adversário mais letal que já enfrentaram. Alimentada pela vingança, uma ameaça terrível emerge das sombras do passado para destruir o mundo de Dom e todos que ele ama.', 'imagem/20230531170746.jpg', '2023-05-24 22:07:03', '2023-05-31 20:07:46', 1),
	(21, 'Bela Sonoriza - Donnie Darko', '21:10', 'Donnie é um jovem excêntrico que despreza a grande maioria de seus colegas de escola. Ele tem visões, em especial de Frank, um coelho gigante que só ele consegue ver e que o encoraja a fazer brincadeiras humilhantes com quem o cerca. Um dia, uma de suas visões o atrai para fora de casa e lhe diz que o mundo acabará dentro de um mês. Donnie inicialmente não acredita, mas, momentos depois, a turbina de um avião cai em sua casa e ele começa a se perguntar qual é o fundo de verdade dessa previsão.', 'imagem/20230531170847.jpg', '2023-05-24 22:08:07', '2023-05-31 20:08:47', 5),
	(23, 'Os Cavaleiros do Zodíaco - Saint Seiya: O começo', '18:30', 'Seiya, um obstinado adolescente de rua, passa seu tempo lutando por dinheiro enquanto procura por sua irmã sequestrada. Quando uma de suas lutas inadvertidamente desperta poderes místicos que ele nunca soube que tinha, Seiya se vê lançado em um mundo de santos guerreiros, treinamento mágico antigo e uma deusa reencarnada que precisa de sua proteção. Se ele quiser sobreviver, precisará abraçar seu destino e sacrificar tudo para ocupar seu lugar de direito entre os Cavaleiros do Zodíaco.', 'imagem/20230524191152.jpg', '2023-05-24 22:11:52', '2023-05-24 22:11:52', 6);

-- Copiando estrutura para tabela db_aula.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagemfuncionario` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoriafuncionario_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_categoriafuncionario_id_foreign` (`categoriafuncionario_id`),
  CONSTRAINT `funcionario_categoriafuncionario_id_foreign` FOREIGN KEY (`categoriafuncionario_id`) REFERENCES `categoriafuncionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.funcionario: ~4 rows (aproximadamente)
INSERT INTO `funcionario` (`id`, `nome`, `salario`, `funcao`, `imagemfuncionario`, `created_at`, `updated_at`, `categoriafuncionario_id`) VALUES
	(30, 'Maria Eduarda Camargo', 'R$5.000', 'Gerente', 'imagem/20230524190042.jpg', '2023-05-24 22:00:42', '2023-05-24 22:00:42', 4),
	(31, 'Letícia Badin Dall Igna', 'R$5.000', 'gerente', 'imagem/20230524190138.png', '2023-05-24 22:01:38', '2023-05-24 22:01:38', 2),
	(32, 'Dayanna de Campos Henrique', 'R$3.000', 'atendente', 'imagem/20230524190333.png', '2023-05-24 22:03:33', '2023-05-24 22:03:33', 3),
	(34, 'Julia Vertuoso Pereira', 'R$3.000', 'atendente', 'imagem/20230531172028.jpg', '2023-05-31 20:20:16', '2023-05-31 20:20:28', 1);

-- Copiando estrutura para tabela db_aula.leitura
CREATE TABLE IF NOT EXISTS `leitura` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nomemac` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataleitura` date NOT NULL,
  `horaleitura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valorsensor` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.leitura: ~6 rows (aproximadamente)
INSERT INTO `leitura` (`id`, `nomemac`, `dataleitura`, `horaleitura`, `valorsensor`, `created_at`, `updated_at`) VALUES
	(3, 'CC:50:E3:05:19:BA', '2023-05-23', '14:51', 8.00, '2023-05-27 00:18:21', '2023-05-27 00:18:21'),
	(4, '08:3A:F2:50:BD:1C', '2022-04-18', '12:35', 15.00, '2023-05-27 00:19:28', '2023-05-27 00:19:28'),
	(5, '38:2B:78:03:A6:32', '2023-05-22', '15:20', 7.00, '2023-05-27 00:19:56', '2023-05-27 00:19:56'),
	(6, '38:2B:78:03:A8:38', '2023-04-15', '16:24', 8.00, '2023-05-27 00:20:23', '2023-05-27 00:20:23'),
	(7, '48:3F:DA:0D:C6:B6', '2023-05-27', '15:26', 16.00, '2023-05-27 00:20:58', '2023-05-27 00:20:58'),
	(9, '08:3A:F2:50:BD:1C', '2023-05-31', '14:32', 9.00, '2023-05-31 20:21:22', '2023-05-31 20:21:37');

-- Copiando estrutura para tabela db_aula.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.migrations: ~15 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_04_14_00008_create_funcionario', 1),
	(6, '2023_04_14_165128_create_filme', 1),
	(7, '2023_04_14_165129_create_usuario', 1),
	(8, '2023_04_28_175141_create_categoriafilme_table', 1),
	(9, '2023_04_28_175149_create_categorias_table', 1),
	(10, '2023_05_12_170844_mac', 1),
	(11, '2023_05_12_170845_sensor', 1),
	(13, '2023_05_15_000259_create_categoriafuncionario', 1),
	(14, '2023_05_18_000047_create_produto', 2),
	(15, '2023_05_18_000058_create_categoriaproduto', 3),
	(17, '2023_05_12_170856_leitura', 4);

-- Copiando estrutura para tabela db_aula.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.password_resets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela db_aula.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.personal_access_tokens: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela db_aula.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagemproduto` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoriaproduto_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_categoriaproduto_id_foreign` (`categoriaproduto_id`),
  CONSTRAINT `produto_categoriaproduto_id_foreign` FOREIGN KEY (`categoriaproduto_id`) REFERENCES `categoriaproduto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.produto: ~3 rows (aproximadamente)
INSERT INTO `produto` (`id`, `nome`, `valor`, `tamanho`, `imagemproduto`, `created_at`, `updated_at`, `categoriaproduto_id`) VALUES
	(11, 'Pipoca doce', '12,00', 'pequena', 'imagem/20230531171905.png', '2023-05-24 21:17:18', '2023-05-31 20:19:05', 2),
	(13, 'Balde de pipoca doce', '50,00', 'Gigante', 'imagem/20230524185541.png', '2023-05-24 21:55:41', '2023-05-24 21:55:41', 4),
	(14, 'Balde de pipoca salgada com manteiga', '50,00', 'Gigante', 'imagem/20230524185600.png', '2023-05-24 21:56:00', '2023-05-24 21:56:00', 4);

-- Copiando estrutura para tabela db_aula.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(8, 'admin', 'admin@admin.com', NULL, '$2y$10$kj9h7HqO1TRcEU6wp2Xpc.NjhGOPe.L.iCnHu7adUB.aDJzzdzgfu', NULL, '2023-06-02 19:54:25', '2023-06-02 19:54:25');

-- Copiando estrutura para tabela db_aula.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoria_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `usuario_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_aula.usuario: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
