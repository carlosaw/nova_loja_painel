-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Fev-2022 às 21:25
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nova_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'LG'),
(2, 'Samsung'),
(3, 'AOC'),
(4, 'Apple');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `sub` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `sub`, `name`) VALUES
(6, NULL, 'Monitor'),
(7, NULL, 'Som'),
(8, 7, 'Headphones'),
(9, 7, 'Microfones'),
(10, 8, 'Com fio'),
(11, 8, 'Sem fio'),
(12, 9, 'Com fio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `coupon_type` int(11) NOT NULL,
  `coupon_value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `options`
--

CREATE TABLE `options` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `options`
--

INSERT INTO `options` (`id`, `name`) VALUES
(1, 'Cor'),
(2, 'Tamanho'),
(3, 'Memória RAM'),
(4, 'Polegadas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`id`, `title`, `body`) VALUES
(2, 'Política de Privacidade', '<p>Qualquer texto que eu quiser...</p>'),
(3, 'Termos de Uso', '<p>Qualquer texto que eu quiser...</p>'),
(4, 'Política de Devolução', '<p><strong>Qualquer</strong> <span style=\"background-color: #f1c40f;\">texto</span> que eu <strong>quiser</strong>...</p>\r\n<p><img src=\"../../../nova_loja/media/pages/c777ccc883f7b5acfe49dfd9cd5fbc71.jpg\" alt=\"\" width=\"378\" height=\"206\" /></p>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`) VALUES
(1, 'Super Administrador'),
(2, 'Administrador'),
(3, 'Gerente'),
(5, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_items`
--

CREATE TABLE `permission_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_items`
--

INSERT INTO `permission_items` (`id`, `name`, `slug`) VALUES
(1, 'Criar Cupom de Oferta', 'cupom_create'),
(2, 'Ver Permissões', 'permissions_view'),
(4, 'Ver Categorias', 'categories_view'),
(5, 'Ver Marcas', 'brands_view'),
(7, 'Ver Páginas', 'pages_view'),
(8, 'Ver Produtos', 'products_view');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_links`
--

CREATE TABLE `permission_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_permission_group` int(11) NOT NULL DEFAULT 0,
  `id_permission_item` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_links`
--

INSERT INTO `permission_links` (`id`, `id_permission_group`, `id_permission_item`) VALUES
(16, 3, 1),
(17, 3, 2),
(21, 2, 1),
(22, 2, 2),
(40, 5, 1),
(41, 5, 2),
(42, 5, 4),
(43, 1, 1),
(44, 1, 2),
(45, 1, 4),
(46, 1, 5),
(47, 1, 7),
(48, 1, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text DEFAULT '',
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_from` float NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `options` varchar(200) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `diameter` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`, `weight`, `width`, `height`, `length`, `diameter`) VALUES
(1, 6, 1, 'Monitor 21 polegadas', 'Alguma descrição do produto.', 10, 499, 599, 0, 1, 1, 1, 0, '1,2,4', 0.9, 20, 15, 20, 15),
(2, 6, 2, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, 399, 999, 2, 1, 1, 1, 0, '1,2', 0.8, 20, 15, 20, 15),
(3, 6, 2, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, 3779, 4399, 0, 1, 0, 0, 1, '1,2', 0.7, 20, 15, 20, 15),
(4, 6, 3, 'Monitor 17 polegadas', 'Alguma outra descrição', 10, 779, 900, 2, 1, 1, 0, 0, '1,4', 0.6, 20, 15, 20, 15),
(5, 6, 1, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, 299, 499, 0, 1, 0, 0, 1, '1', 0.5, 20, 15, 20, 15),
(6, 6, 3, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, 699, 0, 5, 1, 0, 0, 0, '1,2,4', 0.4, 20, 15, 20, 15),
(7, 6, 3, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, 889, 999, 0, 1, 0, 0, 0, '2,4', 0.3, 20, 15, 20, 15),
(8, 6, 1, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, 599, 699, 0, 1, 0, 0, 0, '4', 0.2, 20, 15, 20, 15),
(22, 9, 4, 'Microfone Apple', '<p>Muito interessante</p>', 3, 650, 799, 0, 1, 0, 0, 1, '1,3', 0.2, 2, 3, 4, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_images`
--

INSERT INTO `products_images` (`id`, `id_product`, `url`) VALUES
(1, 1, '1.jpg'),
(2, 2, '2.jpg'),
(3, 3, '3.jpg'),
(4, 4, '4.jpg'),
(5, 5, '1.jpg'),
(6, 6, '3.jpg'),
(7, 7, '7.jpg'),
(8, 8, '7.jpg'),
(9, 2, '3.jpg'),
(10, 2, '4.jpg'),
(11, 2, '7.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_options`
--

CREATE TABLE `products_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `p_value` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_options`
--

INSERT INTO `products_options` (`id`, `id_product`, `id_option`, `p_value`) VALUES
(1, 1, 1, 'Azul'),
(2, 1, 2, '23cm'),
(3, 1, 4, '31'),
(4, 2, 1, 'Azul'),
(5, 2, 2, '19cm'),
(6, 3, 1, 'Branco'),
(7, 3, 2, '20cm'),
(8, 4, 1, 'Preto'),
(9, 4, 4, '17'),
(10, 5, 1, 'Vermelho'),
(11, 6, 1, 'Cinza'),
(12, 6, 2, '18cm'),
(13, 6, 4, '20'),
(14, 7, 2, '18cm'),
(15, 7, 4, '19'),
(16, 8, 4, '18'),
(34, 22, 1, 'Branco'),
(35, 22, 3, '4GB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_coupon` int(11) DEFAULT NULL,
  `total_amount` float NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `billet_link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases`
--

INSERT INTO `purchases` (`id`, `id_user`, `id_coupon`, `total_amount`, `payment_type`, `payment_status`, `billet_link`) VALUES
(1, 2, NULL, 429.06, 'psckttransparente', 1, ''),
(2, 2, NULL, 429.06, 'psckttransparente', 1, ''),
(3, 3, NULL, 3809.06, 'psckttransparente', 1, ''),
(4, 4, NULL, 3809.06, 'psckttransparente', 1, ''),
(5, 2, NULL, 529.06, 'psckttransparente', 1, ''),
(6, 2, NULL, 529.06, 'psckttransparente', 1, ''),
(7, 2, NULL, 529.06, 'psckttransparente', 1, ''),
(8, 2, NULL, 529.06, 'psckttransparente', 1, ''),
(9, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(10, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(11, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(12, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(13, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(14, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(15, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(16, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(17, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(18, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(19, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(20, 2, NULL, 0, 'psckttransparente', 1, ''),
(21, 2, NULL, 0, 'psckttransparente', 1, ''),
(22, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(23, 2, NULL, 531.06, 'psckttransparente', 1, ''),
(24, 2, NULL, 327.06, 'psckttransparente', 1, ''),
(25, 5, NULL, 429.06, 'mp', 1, ''),
(26, 5, NULL, 429.06, 'mp', 1, ''),
(27, 6, NULL, 429.06, 'mp', 1, ''),
(28, 7, NULL, 429.06, 'mp', 1, ''),
(29, 7, NULL, 429.06, 'paypal', 1, ''),
(30, 7, NULL, 429.06, 'paypal', 1, 'https://visualizacaosandbox.gerencianet.com.br/emissao/238125_8_XIENA1/A4XB-238125-3-XIDO8'),
(31, 7, NULL, 529.06, 'paypal', 1, ''),
(32, 7, NULL, 529.06, 'paypal', 1, 'https://visualizacaosandbox.gerencianet.com.br/emissao/238125_9_LUACA9/A4XB-238125-4-LAENA5'),
(33, 7, NULL, 629.06, 'mp', 1, ''),
(34, 7, NULL, 629.06, 'mp', 1, ''),
(35, 7, NULL, 629.06, 'mp', 1, ''),
(36, 7, NULL, 631.56, 'mp', 1, ''),
(37, 7, NULL, 631.56, 'mp', 1, ''),
(38, 7, NULL, 631.56, 'mp', 1, ''),
(39, 7, NULL, 631.56, 'mp', 1, ''),
(40, 7, NULL, 631.56, 'mp', 1, ''),
(41, 7, NULL, 631.56, 'paypal', 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases_products`
--

CREATE TABLE `purchases_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases_products`
--

INSERT INTO `purchases_products` (`id`, `id_purchase`, `id_product`, `quantity`, `product_price`) VALUES
(1, 2, 2, 1, 399),
(2, 3, 3, 1, 3779),
(3, 4, 3, 1, 3779),
(4, 5, 1, 1, 499),
(5, 6, 1, 1, 499),
(6, 7, 1, 1, 499),
(7, 8, 1, 1, 499),
(8, 9, 1, 1, 499),
(9, 10, 1, 1, 499),
(10, 11, 1, 1, 499),
(11, 12, 1, 1, 499),
(12, 13, 1, 1, 499),
(13, 14, 1, 1, 499),
(14, 15, 1, 1, 499),
(15, 16, 1, 1, 499),
(16, 17, 1, 1, 499),
(17, 18, 1, 1, 499),
(18, 19, 1, 1, 499),
(19, 22, 1, 1, 499),
(20, 23, 1, 1, 499),
(21, 24, 5, 1, 299),
(22, 25, 2, 1, 399),
(23, 26, 2, 1, 399),
(24, 27, 2, 1, 399),
(25, 28, 2, 1, 399),
(26, 29, 2, 1, 399),
(27, 30, 2, 1, 399),
(28, 31, 1, 1, 499),
(29, 32, 1, 1, 499),
(30, 33, 8, 1, 599),
(31, 34, 8, 1, 599),
(32, 35, 8, 1, 599),
(33, 36, 8, 1, 599),
(34, 37, 8, 1, 599),
(35, 38, 8, 1, 599),
(36, 39, 8, 1, 599),
(37, 40, 8, 1, 599),
(38, 41, 8, 1, 599);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_transactions`
--

CREATE TABLE `purchase_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transaction_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rates`
--

CREATE TABLE `rates` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_rated` datetime NOT NULL,
  `points` int(11) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `rates`
--

INSERT INTO `rates` (`id`, `id_product`, `id_user`, `date_rated`, `points`, `comment`) VALUES
(1, 2, 1, '2022-01-11 21:13:20', 2, 'Produto muito legal'),
(2, 2, 1, '2022-01-11 21:14:16', 2, 'Produto não muito legal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_permission` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `id_permission`, `email`, `password`, `name`, `admin`, `token`) VALUES
(1, 1, 'carlosfreevg@gmail.com', '698dc19d489c4e4db73e28a713eab07b', 'Carlos Alberto', 1, '48ef6ee187a90bcdace480f3b372bd69'),
(2, 0, 'c53506150352904262381@sandbox.pagseguro.com.br', 'xRj8143TGtGy3200', NULL, 0, NULL),
(3, 0, 'cc53506150352904262381@sandbox.pagseguro.com.br /><br/><br/><strong>Senha:</strong><br/><input type=', '', NULL, 0, NULL),
(4, 0, 'c53506150352904262381@sandbox.pagseguro.com.br /><br/><br/><strong>Senha:</strong><br/><input type=', '', NULL, 0, NULL),
(7, 5, 'teste@hotmail.com', '698dc19d489c4e4db73e28a713eab07b', NULL, 0, NULL),
(8, 2, 'carlos@gmail.com', '698dc19d489c4e4db73e28a713eab07b', NULL, 0, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_items`
--
ALTER TABLE `permission_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_links`
--
ALTER TABLE `permission_links`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchases_products`
--
ALTER TABLE `purchases_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `permission_items`
--
ALTER TABLE `permission_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `permission_links`
--
ALTER TABLE `permission_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `products_options`
--
ALTER TABLE `products_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `purchases_products`
--
ALTER TABLE `purchases_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
