-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 02. 12:49
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kekszshop`
--
CREATE DATABASE IF NOT EXISTS `kekszshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `kekszshop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `Id` int(10) NOT NULL,
  `Nev` varchar(100) NOT NULL,
  `Jelszo` varchar(15) NOT NULL,
  `Telefonszam` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Tuzesseg` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `Id` int(10) NOT NULL,
  `Nev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`Id`, `Nev`) VALUES
(1, 'Bűnös Csokik és Pralinék'),
(2, 'Ragadós Gumicukrok és Zselék'),
(3, 'Nyalogatnivalók és Szopogatós Élvezetek'),
(4, 'Tapadós Karamellák és Rágós Kísértések'),
(5, 'Tiltott és Különleges Finomságok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `Id` int(10) NOT NULL,
  `Termek_nev` varchar(100) NOT NULL,
  `Ar` int(14) NOT NULL,
  `Leiras` varchar(300) NOT NULL,
  `Tuzesseg` int(2) NOT NULL DEFAULT 1,
  `Kat_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`Id`, `Termek_nev`, `Ar`, `Leiras`, `Tuzesseg`, `Kat_Id`) VALUES
(1, 'Bűnös Csokoládéfalat', 1290, 'Lágy csokoládé, amitől elpirulsz.', 1, 1),
(2, 'Ártatlan Praliné', 1390, 'Kicsit ártatlan, kicsit pajkos.', 2, 1),
(3, 'Csábító Trüffel', 1590, 'Finom praliné titkos töltelékkel.', 3, 1),
(4, 'Perverz Étcsoki', 1790, 'Sötét csoki, ami lassan olvad a szájban.', 4, 1),
(5, 'Tüzes Bonbon', 1990, 'Erősen izgató bonbon, csak bátraknak.', 5, 1),
(6, 'Pikáns Csokirúd', 2090, 'Csoki, ami egy kis csavarral fokozza a vágyat.', 6, 1),
(7, 'Extrém Praliné', 2290, 'Merész élvezet, 18+ falat.', 7, 1),
(8, 'Lángoló Csokikülönlegesség', 2490, 'Tökéletesen izgató, egy falatnyi bűn.', 8, 1),
(9, 'Pokoli Csokoládé', 2690, 'Minden falat tüzeli a fantáziát.', 9, 1),
(10, 'Tiltott Élvezet Bonbon', 2890, '10/10 pajzánság, csak felnőtteknek.', 10, 1),
(11, 'Ragadós Epergumicukor', 990, 'Puha, édes és csábító.', 1, 2),
(12, 'Bűnös Zselés Szívek', 1090, 'Kis falatok, nagy öröm.', 2, 2),
(13, 'Nyalánk Bogyók', 1190, 'Szépen lassan olvad a szájban.', 3, 2),
(14, 'Pikáns Gumicukor Mix', 1290, 'Kicsit édes, kicsit csábító.', 4, 2),
(15, 'Élvezetes Zselés Kígyók', 1390, 'Falatnyi élvezet, nagy hatással.', 5, 2),
(16, 'Csábító Gyümölcsös Gumicukor', 1490, 'Izgató ízek keveréke.', 6, 2),
(17, 'Ragadós Pajkos Mix', 1590, 'Puha és finoman provokatív.', 7, 2),
(18, 'Extrém Ínyenc Zselék', 1690, '18+ falatok, lassan élvezve.', 8, 2),
(19, 'Tűzforró Gumicukor', 1790, 'Minden falat fokozza a vágyat.', 9, 2),
(20, 'Tiltott Bogyós Élvezet', 1890, '10/10 pajzánság, élvezd lassan.', 10, 2),
(21, 'Nyalóka Csábítás', 890, 'Ártatlan kívül, pajkos belül.', 1, 3),
(22, 'Lassú Élvezet Nyalóka', 990, 'Szopogatva fokozódik a vágy.', 2, 3),
(23, 'Édes Kísértés', 1090, 'Nyalókában rejtett bűn.', 3, 3),
(24, 'Pikáns Csók Nyalóka', 1190, 'Édesen csábító, kicsit merész.', 4, 3),
(25, 'Ragadós Szopogatós', 1290, 'Izgató élvezet, lassan élvezve.', 5, 3),
(26, 'Perverz Nyalánkság', 1390, 'Falatnyi élvezet, nagy hatással.', 6, 3),
(27, 'Lángoló Nyalóka', 1490, 'Minden falat fokozza a vágyat.', 7, 3),
(28, 'Extrém Pajkos Szopogatós', 1590, '18+ falatok, csak bátraknak.', 8, 3),
(29, 'Pokoli Élvezet Nyalóka', 1690, 'Tízből tíz a pajzánságban.', 9, 3),
(30, 'Tiltott Csók Nyalóka', 1790, 'Maximálisan izgató, 10/10.', 10, 3),
(31, 'Karamella Csábítás', 990, 'Ártatlan kívül, ragadós belül.', 1, 4),
(32, 'Édes Rágcsálnivaló', 1090, 'Puha karamella, lassan élvezve.', 2, 4),
(33, 'Bűnös Toffee', 1190, 'Falatnyi élvezet, nagy hatással.', 3, 4),
(34, 'Ragadós Karamell Mix', 1290, 'Édesen csábító, kicsit merész.', 4, 4),
(35, 'Pajkos Rágós Élvezet', 1390, 'Izgató falatok, lassan élvezve.', 5, 4),
(36, 'Lángoló Karamella', 1490, 'Minden falat fokozza a vágyat.', 6, 4),
(37, 'Perverz Rágós Kígyó', 1590, '18+ falatok, csak bátraknak.', 7, 4),
(38, 'Extrém Karamell Kísértés', 1690, 'Tízből tíz a pajzánságban.', 8, 4),
(39, 'Pokoli Ragacs', 1790, 'Maximálisan izgató, 9/10.', 9, 4),
(40, 'Tiltott Rágós Élvezet', 1890, '10/10 pajzánság, csak felnőtteknek.', 10, 4),
(41, 'Tiltott Csoki Szerelem', 1990, 'Luxus csokoládé erotikus töltelékkel.', 1, 5),
(42, 'Bűnös Gumimix', 1090, 'Kis falatok, nagy öröm.', 2, 5),
(43, 'Perverz Nyalánkság Válogatás', 1590, 'Falatnyi élvezet, lassan élvezve.', 3, 5),
(44, 'Ragadós Élvezet Különlegesség', 1690, 'Puha és provokatív.', 4, 5),
(45, 'Csábító Bonbon Válogatás', 1890, 'Izgató falatok, minden falat új élmény.', 5, 5),
(46, 'Lángoló Pralinék', 1990, '18+ falatok, merész élvezet.', 6, 5),
(47, 'Extrém Pajkos Mix', 2190, 'Minden falat fokozza a vágyat.', 7, 5),
(48, 'Pokoli Különlegességek', 2390, 'Tízből tíz a pajzánságban.', 8, 5),
(49, 'Tiltott Bűnös Mix', 2590, 'Maximálisan izgató, 9/10.', 9, 5),
(50, '10/10 Élvezet Különlegesség', 2790, 'Teljesen merész, csak bátraknak.', 10, 5),
(51, 'Csábító Csokinyalóka', 1290, 'Selymes csoki, lassan olvadó élvezet.', 1, 1),
(52, 'Forró Ajkak Gumicukor', 990, 'Eperízű, enyhén pajkos.', 2, 2),
(53, 'Bűnös Banán', 1490, 'Banánízű édesség, nem nyilvános élvezet.', 3, 3),
(54, 'Domináns Csoki', 1990, 'Étcsoki finom fűszerekkel.', 4, 1),
(55, 'Kötözős Karamella', 1590, 'Ragadós, lassan enged el.', 5, 4),
(56, 'Édes Fenyítés Bonbon', 1790, 'Kívül ártatlan, belül pajkos.', 6, 1),
(57, 'Perzselő Vágy Praliné', 2190, 'Luxus praliné fűszerekkel.', 7, 1),
(58, 'Ártatlan Álcázás', 890, 'Ártatlannak tűnik, de nem az.', 8, 2),
(59, 'Tiltott Gyümölcs Nyalánkság', 1890, 'Fűszeres-almás falat.', 9, 4),
(60, 'Pokoli Élvezet', 2490, 'Extrán izgató csoki, 18+ falatok.', 10, 1),
(61, 'Kéjes Kókuszgolyó', 1090, 'Puha kókuszos falat.', 1, 4),
(62, 'Csípős Csábítás Rúd', 1690, 'Merész íz, fokozza a vágyat.', 2, 1),
(63, 'Suttogó Szamóca', 1190, 'Szamócás, kicsit pikáns.', 3, 2),
(64, 'Vágyfokozó Vanília', 1390, 'Krémes, finom erotikus ízzel.', 4, 1),
(65, 'Tiltott Csók Bonbon', 1890, 'Lágy bonbon pikáns töltelékkel.', 5, 1),
(66, 'Perverz Paprikás Praliné', 2290, 'Merész, pajkos falat.', 6, 1),
(67, 'Édes Kínzás Karamella', 1490, 'Ragadós, izgató élmény.', 7, 4),
(68, 'Bűnbeesés Bogyós Mix', 1590, 'Vegyes bogyós édesség pajzán fűszerezéssel.', 8, 2),
(69, 'Lassú Gyönyör Gumicukor', 990, 'Hosszan tartó élvezet.', 9, 2),
(70, 'Tűz és Méz', 2090, 'Mézes édesség fűszeres csavarral.', 10, 4),
(71, 'Pikáns Praliné Válogatás', 1590, 'Falatnyi élvezet, nagy hatással.', 1, 1),
(72, 'Bűnös Csoki Mix', 1690, 'Kellemesen csábító falatok.', 2, 1),
(73, 'Édes Szopogatós', 990, 'Ártatlan kívül, pajkos belül.', 3, 3),
(74, 'Ragadós Karamella Mix', 1290, 'Édesen csábító, lassan élvezve.', 4, 4),
(75, 'Csábító Nyalóka Válogatás', 1090, 'Puha és finom erotikus élvezet.', 5, 3),
(76, 'Extrém Csokirúd', 2190, 'Merész falatok, minden falat új élmény.', 6, 1),
(77, 'Pokoli Gumicukor', 1790, 'Izgató, lassan olvad a szájban.', 7, 2),
(78, 'Tiltott Bonbon Válogatás', 1890, 'Luxus bonbon erotikus töltelékkel.', 8, 1),
(79, 'Perverz Nyalóka Mix', 1490, '18+ falatok, csak bátraknak.', 9, 3),
(80, 'Tízből Tíz Élvezet', 2790, 'Maximálisan izgató, 10/10.', 10, 5),
(81, 'Ártatlan Csábítás Karamella', 1090, 'Puha, lassan olvadó élvezet.', 1, 4),
(82, 'Bűnös Csoki Kocka', 1290, 'Lágy csokoládé pajkos töltelékkel.', 2, 1),
(83, 'Csábító Gumicukor', 990, 'Édesen pikáns, könnyen élvezhető.', 3, 2),
(84, 'Pajkos Praliné', 1490, 'Falatnyi bűn, lassan olvad a szájban.', 4, 1),
(85, 'Ragadós Karamella', 1590, 'Puha és élvezetes falatok.', 5, 4),
(86, 'Lángoló Csokirúd', 1990, 'Merész élvezet minden falattal.', 6, 1),
(87, 'Perverz Nyalánkság', 1790, '18+ falatok, lassan élvezve.', 7, 2),
(88, 'Tiltott Bogyós Mix', 1890, 'Izgató, merész vegyes édesség.', 8, 2),
(89, 'Extrém Csokoládé', 2190, 'Maximálisan izgató élvezet.', 9, 1),
(90, 'Pokoli Élvezet Válogatás', 2490, 'Tízből tíz pajzánság, csak felnőtteknek.', 10, 5),
(91, 'Ártatlan Nyalóka', 890, 'Lágy, ártatlan élvezet.', 1, 3),
(92, 'Bűnös Csokicsepp', 1290, 'Pikáns csoki titkos töltelékkel.', 2, 1),
(93, 'Csábító Gumimix', 1090, 'Édes és izgató falatok.', 3, 2),
(94, 'Pajkos Praliné Válogatás', 1590, 'Falatnyi bűn minden falatban.', 4, 1),
(95, 'Ragadós Karamella Élvezet', 1490, 'Lassú, fokozatos élvezet.', 5, 4),
(96, 'Lángoló Csoki', 1990, 'Merész, pikáns falatok.', 6, 1),
(97, 'Perverz Nyalánkság Mix', 1790, '18+ falatok, csak bátraknak.', 7, 2),
(98, 'Tiltott Csokoládé', 1890, 'Izgató élvezet, lassan olvad a szájban.', 8, 1),
(99, 'Extrém Bűnös Praliné', 2190, 'Maximálisan erotikus falatok.', 9, 1),
(100, 'Pokoli Különlegesség', 2490, 'Tízből tíz pajzánság, 18+ élvezet.', 10, 5);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Telefonszam` (`Telefonszam`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Kat_Id` (`Kat_Id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `termekek`
--
ALTER TABLE `termekek`
  ADD CONSTRAINT `termekek_ibfk_1` FOREIGN KEY (`Kat_Id`) REFERENCES `kategoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
