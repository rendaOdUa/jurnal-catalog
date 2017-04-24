-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 22 2017 г., 17:53
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `netpeaktest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `autors`
--

CREATE TABLE `autors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `autors`
--

INSERT INTO `autors` (`id`, `name`, `surname`) VALUES
(5, 'Дэвид', 'Смарт'),
(4, 'Мария', 'Жадан'),
(6, 'А. Ф.', 'Иоффе'),
(7, 'Е. Л.', 'Юхинец'),
(8, 'Team', 'Rock'),
(10, 'А. В.', 'Долговый'),
(11, 'Джеймс', 'Маркус'),
(12, 'И. Д.', 'Родионов'),
(13, 'Ян', 'Уэнер');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1492859670),
('m130524_201442_init', 1492859673);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `autor` varchar(255) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `imageUrl`, `autor`, `autor_id`, `date`) VALUES
(12, 'Esquire', 'ежемесячный журнал, основанный в 1933 году в США. Основные темы: культура и искусство, мода и стиль, бизнес и политика, технологии и автомобили, еда и здоровье,персонажи и интервью.', '/uploads//esquire/e.jpg', '5', NULL, '2011-11-11'),
(13, 'Журнал технической физики', 'один из старейших физических журналов России. Он был основан А. Ф. Иоффе на основе издававшегося с 1924 года «Журнала прикладной физики» в 1931 году.', '/uploads//zhurnal-tehnicheskoy-fiziki/jtf920140001.jpg', '6', NULL, '2011-11-11'),
(14, 'Познайко', 'украинский детский познавательный журнал. Основан в 1996 году. Символом журнала стал барсучок Познайка.', '/uploads//poznayko/01.800x600w.jpg', '7', NULL, '2011-11-11'),
(15, 'Classic Rock', 'британский журнал, посвящённый классическому року. Основная тематика — материалы о ключевых рок-группах, основанных с 1960-х до начала 1990-х.', '/uploads//classic-rock/357713.jpg', '8', NULL, '2011-12-13'),
(16, 'Metal Rock', 'ежемесячный музыкальный журнал, основной тематикой которого является хэви-метал музыка. Журнал впервые появился в Германии в 1984 году.', '/uploads//metal-rock/091150.jpg', '8', NULL, '2011-12-13'),
(17, 'Empire', 'месячный журнал о популярном кинематографе, издаваемый в Великобритании с 1989 года.', '/uploads//empire/1446146865_oblozhka-zhurnala-empire-dzhoker-.jpg', '4', NULL, '2011-11-11'),
(18, 'Fuzz', 'ежемесячный журнал о музыке, выходящий с 1991 года. Тематикой журнала является как русский рок, так и зарубежная рок-музыка.', '/uploads//fuzz/8346.970x0.jpg', '10', NULL, '2011-12-13'),
(19, 'Harper\'s Magazine', 'американский ежемесячный журнал о литературе, политике, культуре, экономике и искусстве. ', '/uploads//harper-s-magazine/November_2004_Cover_of_Harper\'s_Magazine.jpg', '11', NULL, '2011-12-13'),
(20, 'Moulin Rough', 'первый политический глянец России. Единственный в мире ежемесячный журнал формата. Закрыт в январе 2008 года.', '/uploads//moulin-rough/Moulin_Rouge_cover_2.jpg', '12', NULL, '2011-12-13'),
(21, 'Rolling Stone', 'посвящённый музыке и поп-культуре. Был основан в Сан-Францисков 1967 году Янном Уэннером и музыкальным критиком Ральфом Глисоном.', '/uploads//rolling-stone/roling_stone.jpg', '13', NULL, '2011-11-11'),
(25, 'MyPost', 'Просто решил добавить запись с другой датой, что бы виднее была сортировка)', '/uploads//mypost/User 07.jpg', '4', NULL, '2010-10-19');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'vLyTe7W_kdaOwcuc-ukbUzIZ18PXV9Sg', '$2y$13$nQQKZWXjJMa72zfMJTk.DOIqjzrO7MiDQz803y4/5iSW.5gIVvXW.', NULL, 'artem.rendak@mail.ru', 10, 1492860002, 1492860002);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `autors`
--
ALTER TABLE `autors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `autors`
--
ALTER TABLE `autors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
