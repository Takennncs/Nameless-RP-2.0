-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 23 oct. 2020 à 20:57
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fxserver`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('organisation_Arkan', 'Arkan', 1),
('organisation_ballas', 'ballas', 1),
('organisation_families', 'families', 1),
('organisation_lost', 'Lost', 1),
('organisation_Madrazo', 'Madrazo', 1),
('organisation_Marabunta', 'Marabunta', 1),
('organisation_sacra', 'sacra', 1),
('organisation_SinaLoa', 'SinaLoa', 1),
('organisation_vagos', 'vagos', 1),
('property_black_money', 'Argent Sale Propriété', 0),
('society_abatteur', 'Abatteur', 1),
('society_abatteur_black', 'Abatteur Argent Sale', 1),
('society_altruiste', 'Altruiste', 1),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Armenien', 1),
('society_atrax', 'Atrax', 1),
('society_atrax_black', 'Atrax Argent Sale', 1),
('society_avocat', 'Avocat', 1),
('society_avocat_black', 'Avocat Argent Sale', 1),
('society_aztecas', 'aztecas', 1),
('society_bacars', 'Bacars', 1),
('society_bacars_black', 'Bacars Argent Sale', 1),
('society_ballas', 'Ballas', 1),
('society_ballas_black', 'Ballas Argent Sale', 1),
('society_baron', 'baron', 1),
('society_beekers', 'Beekers', 1),
('society_bikedealer', 'Concessionnaire Moto', 1),
('society_bkc', 'Bkc', 1),
('society_bkc_black', 'Bkc Argent Sale', 1),
('society_bloodz', 'bloodz', 1),
('society_bucheron', 'Bucheron', 1),
('society_bucheron_black', 'Bucheron Argent Sale', 1),
('society_burgershot', 'BurgerShot', 1),
('society_burgershot_black', 'Burgershot Argent Sale', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_cartel', 'cartel', 1),
('society_cripz', 'cripz', 1),
('society_daymson', 'Daymson', 1),
('society_daymson_black', 'Daymson Argent Sale', 1),
('society_duggan', 'Famille Duggan', 1),
('society_families', 'White', 1),
('society_families_black', 'Families Argent Sale', 1),
('society_famillies', 'famillies', 1),
('society_farm', 'Fermier', 1),
('society_favelas', 'Favelas', 1),
('society_fishing', 'poissonerie', 1),
('society_flash', 'Flash', 1),
('society_flash_black', 'Flash Argent Sale', 1),
('society_fueler', 'Raffineur', 1),
('society_garbage', 'Éboueur', 1),
('society_gardien', 'gardien', 1),
('society_gouv', 'Gouvernement', 1),
('society_guerini', 'guerini', 1),
('society_hippies', 'Hippies', 1),
('society_journalist', 'FlashNews', 1),
('society_journalist_black', 'FlashNews Argent Sale', 1),
('society_lopez', 'lopez', 1),
('society_lost', 'lost', 1),
('society_lostmc', 'LostMc', 1),
('society_lscustoms', 'Ls Customs', 1),
('society_ltd', 'ltd', 1),
('society_madrazo', 'Madrazo', 1),
('society_mafia', 'Mafia', 1),
('society_mafia_black', 'Mafia Argent Sale', 1),
('society_marabunta', 'marabunta', 1),
('society_mechanic', 'Mécano', 1),
('society_medeline', 'medeline', 1),
('society_mesa', 'mesa', 1),
('society_militaire', 'Militaire', 1),
('society_nudistes', 'nudistes', 1),
('society_oneil', 'oneil', 1),
('society_palace', 'Palace', 1),
('society_palace_black', 'Palace Argent Sale', 1),
('society_peaky', 'peaky', 1),
('society_peaky_black', 'peaky Argent Sale', 1),
('society_pecheur', 'Pecheur', 1),
('society_pecheur_black', 'Pecheur Argent Sale', 1),
('society_police', 'Police', 1),
('society_police_black', 'Police Argent Sale', 1),
('society_police_black_money', 'Police Black Money', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rednecks', 'Rednecks', 1),
('society_security', 'Gruppe6', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'Soa', 1),
('society_tabac', 'Tabac', 1),
('society_tabac_black', 'Tabac Argent Sale', 1),
('society_taxi', 'Taxi', 1),
('society_taxi_black', 'Taxi Argent Sale', 1),
('society_Test', 'Test', 1),
('society_triades', 'Triades', 1),
('society_unicorn', 'Unicorn', 1),
('society_unicorn_black', 'Unicorn Argent Sale', 1),
('society_vagos', 'Vagos', 1),
('society_vagos_black', 'Vagos Argent Sale', 1),
('society_vigneron', 'Vigneron', 1),
('society_vigneron_black', 'Vigneron Argent Sale', 1),
('society_weapondealer', 'Trafiquant d\'armes', 1),
('society_weapondealer_black', 'Trafiquant d\'armes Argent Sale', 1),
('society_weed', 'weed', 1),
('vault_black_money', 'Money Vault', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `addon_account_data`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('organisation_Arkan', 'Arkan', 1),
('organisation_ballas', 'ballas', 1),
('organisation_families', 'Families', 1),
('organisation_lost', 'Lost', 1),
('organisation_Madrazo', 'Madrazo', 1),
('organisation_Marabunta', 'Marabunta', 1),
('organisation_sacra', 'sacra', 1),
('organisation_SinaLoa', 'SinaLoa', 1),
('organisation_vagos', 'vagos', 1),
('property', 'Propriété', 0),
('society_abatteur', 'Abatteur', 1),
('society_altruiste', 'Altruiste', 1),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Armenien', 1),
('society_atrax', 'Atrax', 1),
('society_avocat', 'Avocat', 1),
('society_aztecas', 'aztecas', 1),
('society_bacars', 'Bacars', 1),
('society_ballas', 'Ballas', 1),
('society_baron', 'baron', 1),
('society_beekers', 'Beekers', 1),
('society_bikedealer', 'Concesionnaire Moto', 1),
('society_bkc', 'Bkc', 1),
('society_bloods', 'Bloods', 1),
('society_bloodz', 'bloodz', 1),
('society_bucheron', 'Bucheron', 1),
('society_burgershot', 'BurgerShot', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_cartel', 'cartel', 1),
('society_cripz', 'cripz', 1),
('society_daymson', 'Daymson', 1),
('society_duggan', 'Famille Duggan', 1),
('society_families', 'Families', 1),
('society_famillies', 'famillies', 1),
('society_farm', 'Fermier', 1),
('society_favelas', 'Favelas', 1),
('society_fishing', 'Poissonnerie', 1),
('society_flash', 'Flash', 1),
('society_fueler', 'Raffineur', 1),
('society_gardien', 'gardien', 1),
('society_gouv', 'Gouvernement', 1),
('society_guerini', 'guerini', 1),
('society_hippies', 'Hippies', 1),
('society_journalist', 'FlashNews', 1),
('society_lopez', 'lopez', 1),
('society_lost', 'lost', 1),
('society_lostmc', 'LostMc', 1),
('society_lscustoms', 'Ls Customs', 1),
('society_ltd', 'ltd', 1),
('society_madrazo', 'Madrazo', 1),
('society_mafia', 'Mafia', 1),
('society_marabunta', 'marabunta', 1),
('society_mechanic', 'Mécano', 1),
('society_medeline', 'medeline', 1),
('society_mesa', 'mesa', 1),
('society_militaire', 'Militaire', 1),
('society_nudistes', 'nudistes', 1),
('society_oneil', 'oneil', 1),
('society_palace', 'Palace', 1),
('society_peaky', 'peaky', 1),
('society_pecheur', 'Pecheur', 1),
('society_police', 'Police', 1),
('society_rednecks', 'Rednecks', 1),
('society_security', 'Gruppe6', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'Soa', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_Test', 'Test', 1),
('society_triades', 'Triades', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigneron', 'Vigneron', 1),
('society_weed', 'weed', 1),
('vault', 'Vault', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `addon_inventory_items`
--

-- --------------------------------------------------------

--
-- Structure de la table `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `bikedealer_vehicles`
--

CREATE TABLE `bikedealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `bikes`
--

CREATE TABLE `bikes` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `bikes`
--

INSERT INTO `bikes` (`name`, `model`, `price`, `category`) VALUES
('Akuma', 'akuma', 24800, 'sports'),
('Avarus', 'avarus', 8470, 'choppers'),
('Bagger', 'bagger', 6050, 'routes'),
('Bati 801', 'bati', 26441, 'sports'),
('Bati 801RR', 'bati2', 27600, 'sports'),
('BF 400', 'bf400', 15000, 'tt'),
('Blazer', 'blazer', 2620, 'choppers'),
('Blazer 3', 'blazer3', 3030, 'choppers'),
('Blazer Street', 'blazer4', 3650, 'choppers'),
('Carbon RS', 'carbonrs', 18730, 'sports'),
('Chimera', 'chimera', 14260, 'choppers'),
('Cliffhanger', 'cliffhanger', 16520, 'tt'),
('Daemon', 'daemon', 7260, 'choppers'),
('Daemon 2', 'daemon2', 8140, 'choppers'),
('Defiler', 'defiler', 20380, 'sports'),
('Double T', 'double', 22600, 'sports'),
('Enduro', 'enduro', 15420, 'tt'),
('Esskey', 'esskey', 12120, 'routes'),
('Faggio Sport 2', 'faggio', 1220, 'choppers'),
('Faggio Sport', 'faggio2', 970, 'choppers'),
('Faggio', 'faggio3', 770, 'choppers'),
('FCR 1000', 'fcr', 15420, 'sports'),
('FCR 1000 Custom', 'fcr2', 19830, 'sports'),
('Hakuchou', 'hakuchou', 34750, 'sports'),
('Hakuchou Drag', 'hakuchou2', 39500, 'sports'),
('Hexer', 'hexer', 7910, 'choppers'),
('Innovation', 'innovation', 7680, 'choppers'),
('kcc_kingz_horse', 'kcc_kingz_horse', 50000, 'addon'),
('Lectro', 'lectro', 12120, 'sports'),
('Manchez', 'manchez', 6480, 'tt'),
('Nemesis', 'nemesis', 17080, 'sports'),
('Nightblade', 'nightblade', 16520, 'choppers'),
('PCJ 600', 'pcj', 15420, 'sports'),
('RatBike', 'ratbike', 2420, 'choppers'),
('Ruffian', 'ruffian', 13240, 'sports'),
('Sanchez', 'sanchez', 4000, 'tt'),
('Sanchez Livery', 'sanchez2', 8140, 'tt'),
('Sanctus', 'sanctus', 19830, 'choppers'),
('Thrust', 'thrust', 8140, 'routes'),
('Vader', 'vader', 16520, 'sports'),
('Vortex', 'vortex', 17620, 'sports'),
('Wolfsbane', 'wolfsbane', 7260, 'choppers'),
('Zombie Bobber', 'zombiea', 8140, 'choppers'),
('Zombie Chopper', 'zombieb', 8470, 'choppers');

-- --------------------------------------------------------

--
-- Structure de la table `bike_categories`
--

CREATE TABLE `bike_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `bike_categories`
--

INSERT INTO `bike_categories` (`name`, `label`) VALUES
('addon', 'addon'),
('choppers', 'Choppers'),
('routes', 'Routes'),
('sports', 'Sports'),
('tt', 'Tout-terrain');

-- --------------------------------------------------------

--
-- Structure de la table `bike_sold`
--

CREATE TABLE `bike_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `boatdealer_boats`
--

CREATE TABLE `boatdealer_boats` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `boats`
--

CREATE TABLE `boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `boats`
--

INSERT INTO `boats` (`name`, `model`, `price`, `category`) VALUES
('Jetmax', 'jetmax', 170000, 'boats'),
('Seashark', 'seashark', 45000, 'jetski'),
('Seashark 2', 'seashark3', 50000, 'jetski'),
('Speeder', 'speeder', 280000, 'boats'),
('Squalo', 'squalo', 220000, 'boats'),
('Suntrap', 'suntrap', 150000, 'boats'),
('Tropic', 'tropic2', 190000, 'boats');

-- --------------------------------------------------------

--
-- Structure de la table `boat_categories`
--

CREATE TABLE `boat_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boats', 'Boats'),
('jetski', 'Jetski');

-- --------------------------------------------------------

--
-- Structure de la table `bwh_bans`
--

CREATE TABLE `bwh_bans` (
  `id` int(11) NOT NULL,
  `receiver` text NOT NULL,
  `sender` varchar(60) NOT NULL,
  `length` datetime DEFAULT NULL,
  `reason` text NOT NULL,
  `unbanned` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bwh_identifiers`
--

CREATE TABLE `bwh_identifiers` (
  `steam` varchar(60) NOT NULL,
  `license` varchar(60) NOT NULL,
  `ip` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `xbl` varchar(60) DEFAULT NULL,
  `live` varchar(60) DEFAULT NULL,
  `discord` varchar(60) DEFAULT NULL,
  `fivem` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bwh_identifiers`
--

-- --------------------------------------------------------

--
-- Structure de la table `bwh_warnings`
--

CREATE TABLE `bwh_warnings` (
  `id` int(11) NOT NULL,
  `receiver` text NOT NULL,
  `sender` varchar(60) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bwh_warnings`
--

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
(503, 'bmx', 160);

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
(5, 'steam:110000113f169df', 'Matt', 'Nelson', '02/12/1988', 'm', '180'),
(6, 'steam:1100001090136bc', 'Jean Michel', 'Pietra', '05/01/1973', 'm', '180'),
(7, 'steam:11000013f2189db', 'Tom', 'Larson', '20/05/1999', 'h', '200');

-- --------------------------------------------------------

--
-- Structure de la table `crafting`
--

CREATE TABLE `crafting` (
  `identifier` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `bandages` int(11) NOT NULL DEFAULT 0,
  `cleanwater` int(11) NOT NULL DEFAULT 0,
  `cookedmeat` int(11) NOT NULL DEFAULT 0,
  `dirtywater` int(11) NOT NULL DEFAULT 0,
  `drinkitems` int(11) NOT NULL DEFAULT 0,
  `ducktape` int(11) NOT NULL DEFAULT 0,
  `emptybottles` int(11) NOT NULL DEFAULT 0,
  `enginekit` int(11) NOT NULL DEFAULT 0,
  `fooditems` int(11) NOT NULL DEFAULT 0,
  `gunpowder` int(11) NOT NULL DEFAULT 0,
  `rawmeat` int(11) NOT NULL DEFAULT 0,
  `scrapcloth` int(11) NOT NULL DEFAULT 0,
  `scrapmetal` int(11) NOT NULL DEFAULT 0,
  `woodlogs` int(11) NOT NULL DEFAULT 0,
  `woodmaterials` int(11) NOT NULL DEFAULT 0,
  `zblood` int(11) NOT NULL DEFAULT 0,
  `zcredits` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `craftingtables`
--

CREATE TABLE `craftingtables` (
  `location` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `crew_phone_bank`
--

CREATE TABLE `crew_phone_bank` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `crew_phone_news`
--

CREATE TABLE `crew_phone_news` (
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('organisation_Arkan', 'Arkan', 1),
('organisation_ballas', 'ballas', 1),
('organisation_families', 'families', 1),
('organisation_lost', 'Lost', 1),
('organisation_Madrazo', 'Madrazo', 1),
('organisation_Marabunta', 'Marabunta', 1),
('organisation_sacra', 'sacra', 1),
('organisation_SinaLoa', 'SinaLoa', 1),
('organisation_vagos', 'vagos', 1),
('property', 'Propriété', 0),
('society_abatteur', 'Abatteur', 1),
('society_altruiste', 'Altruiste', 1),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Armenien', 1),
('society_atrax', 'Atrax', 1),
('society_avocat', 'Avocat', 1),
('society_aztecas', 'aztecas', 1),
('society_bacars', 'Bacars', 1),
('society_ballas', 'Ballas', 1),
('society_baron', 'baron', 1),
('society_bkc', 'Bkc', 1),
('society_bloodz', 'bloodz', 1),
('society_bucheron', 'Bucheron', 1),
('society_burgershot', 'BurgerShot', 1),
('society_cartel', 'cartel', 1),
('society_cripz', 'cripz', 1),
('society_daymson', 'Daymson', 1),
('society_duggan', 'Famille Duggan', 1),
('society_families', 'Families', 1),
('society_famillies', 'famillies', 1),
('society_farm', 'Fermier', 1),
('society_favelas', 'Favelas', 1),
('society_fishing', 'Poissonnerie', 1),
('society_flash', 'Flash', 1),
('society_fueler', 'Raffineur', 1),
('society_gardien', 'gardien', 1),
('society_gouv', 'Gouvernement', 1),
('society_guerini', 'guerini', 1),
('society_hippies', 'Hippies', 1),
('society_journalist', 'FlashNews', 1),
('society_lopez', 'lopez', 1),
('society_lost', 'lost', 1),
('society_lostmc', 'LostMc', 1),
('society_ltd', 'ltd', 1),
('society_madrazo', 'Madrazo', 1),
('society_mafia', 'Mafia', 1),
('society_marabunta', 'marabunta', 1),
('society_medeline', 'medeline', 1),
('society_mesa', 'mesa', 1),
('society_militaire', 'Militaire', 1),
('society_nudistes', 'nudistes', 1),
('society_oneil', 'oneil', 1),
('society_palace', 'Palace', 1),
('society_peaky', 'peaky', 1),
('society_pecheur', 'Pecheur', 1),
('society_police', 'Police', 1),
('society_rednecks', 'Rednecks', 1),
('society_security', 'Gruppe6', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'Soa', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_Test', 'Test', 1),
('society_triades', 'Triades', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigneron', 'Vigneron', 1),
('society_weapondealer', 'trafiquant d\'armes', 1),
('society_weapons_atrax', 'Weapons Atrax', 1),
('society_weapons_aztecas', 'Weapons aztecas', 1),
('society_weapons_ballas', 'Weapons Ballas', 1),
('society_weapons_baron', 'Weapons baron', 1),
('society_weapons_bkc', 'Weapons BKC', 1),
('society_weapons_bloodz', 'Weapons bloodz', 1),
('society_weapons_cartel', 'Weapons cartel', 1),
('society_weapons_cripz', 'Weapons cripz', 1),
('society_weapons_families', 'Weapons Families', 1),
('society_weapons_flash', 'Weapons Flash', 1),
('society_weapons_guerini', 'Weapons guerini', 1),
('society_weapons_lopez', 'Weapons lopez', 1),
('society_weapons_lost', 'Weapons lost', 1),
('society_weapons_mafia', 'Weapons Mafia', 1),
('society_weapons_marabunta', 'Weapons marabunta', 1),
('society_weapons_medeline', 'Weapons medeline', 1),
('society_weapons_mesa', 'Weapons mesa', 1),
('society_weapons_nudistes', 'Weapons nudistes', 1),
('society_weapons_oneil', 'Weapons oneil', 1),
('society_weapons_peaky', 'Weapons peaky', 1),
('society_weapons_vagos', 'Weapons Vagos', 1),
('society_weapons_weapondealer', 'Weapons trafiquant d\'armes', 1),
('society_weapons_weed', 'Weapons weed', 1),
('society_weed', 'weed', 1),
('society_white', 'White', 1),
('user_ears', 'Ears', 0),
('user_garages', 'Garage', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0),
('vault', 'Vault', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `datastore_data`
--

-- --------------------------------------------------------

--
-- Structure de la table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) NOT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dpkeybinds`
--

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('GADGET_HAZMAT1', 'Combinaison hermétique', 10, 0, 1),
('LittlePricks', 'Tenue Little Pricks', -1, 0, 1),
('LsCustoms', 'Tenue LsCustoms', -1, 0, 1),
('Masque1', 'Masque1', 1, 0, 1),
('Masque10', 'Masque10', 1, 0, 1),
('Masque10_1', 'Masque10_1', 1, 0, 1),
('Masque10_2', 'Masque10_2', 1, 0, 1),
('Masque11', 'Masque11', 1, 0, 1),
('Masque11_1', 'Masque11_1', 1, 0, 1),
('Masque11_2', 'Masque11_2', 1, 0, 1),
('Masque12', 'Masque12', 1, 0, 1),
('Masque12_1', 'Masque12_1', 1, 0, 1),
('Masque12_2', 'Masque12_2', 1, 0, 1),
('Masque13', 'Masque13', 1, 0, 1),
('Masque13_1', 'Masque13_1', 1, 0, 1),
('Masque13_2', 'Masque13_2', 1, 0, 1),
('Masque14', 'Masque14', 1, 0, 1),
('Masque14_1', 'Masque14_1', 1, 0, 1),
('Masque14_2', 'Masque14_2', 1, 0, 1),
('Masque15', 'Masque15', 1, 0, 1),
('Masque15_1', 'Masque15_1', 1, 0, 1),
('Masque15_2', 'Masque15_2', 1, 0, 1),
('Masque16', 'Masque16', 1, 0, 1),
('Masque16_1', 'Masque16_1', 1, 0, 1),
('Masque16_2', 'Masque16_2', 1, 0, 1),
('Masque17', 'Masque17', 1, 0, 1),
('Masque17_1', 'Masque17_1', 1, 0, 1),
('Masque17_2', 'Masque17_2', 1, 0, 1),
('Masque18', 'Masque18', 1, 0, 1),
('Masque18_1', 'Masque18_1', 1, 0, 1),
('Masque18_2', 'Masque18_2', 1, 0, 1),
('Masque19', 'Masque19', 1, 0, 1),
('Masque19_1', 'Masque19_1', 1, 0, 1),
('Masque19_2', 'Masque19_2', 1, 0, 1),
('Masque1_2', 'Masque1_2', 1, 0, 1),
('Masque1_3', 'Masque1_3', 1, 0, 1),
('Masque2', 'Masque2', 1, 0, 1),
('Masque20', 'Masque20', 1, 0, 1),
('Masque20_1', 'Masque20_1', 1, 0, 1),
('Masque20_2', 'Masque20_2', 1, 0, 1),
('Masque21', 'Masque21', 1, 0, 1),
('Masque21_1', 'Masque21_1', 1, 0, 1),
('Masque21_2', 'Masque21_2', 1, 0, 1),
('Masque22', 'Masque22', 1, 0, 1),
('Masque22_1', 'Masque22_1', 1, 0, 1),
('Masque22_2', 'Masque22_2', 1, 0, 1),
('Masque23', 'Masque23', 1, 0, 1),
('Masque23_1', 'Masque23_1', 1, 0, 1),
('Masque23_2', 'Masque23_2', 1, 0, 1),
('Masque24', 'Masque24', 1, 0, 1),
('Masque24_1', 'Masque24_1', 1, 0, 1),
('Masque24_2', 'Masque24_2', 1, 0, 1),
('Masque25', 'Masque25', 1, 0, 1),
('Masque25_1', 'Masque25_1', 1, 0, 1),
('Masque25_2', 'Masque25_2', 1, 0, 1),
('Masque26', 'Masque26', 1, 0, 1),
('Masque26_1', 'Masque26_1', 1, 0, 1),
('Masque26_2', 'Masque26_2', 1, 0, 1),
('Masque27', 'Masque27', 1, 0, 1),
('Masque27_1', 'Masque27_1', 1, 0, 1),
('Masque27_2', 'Masque27_2', 1, 0, 1),
('Masque28', 'Masque28', 1, 0, 1),
('Masque28_1', 'Masque28_1', 1, 0, 1),
('Masque28_2', 'Masque28_2', 1, 0, 1),
('Masque29', 'Masque29', 1, 0, 1),
('Masque29_1', 'Masque29_1', 1, 0, 1),
('Masque29_2', 'Masque29_2', 1, 0, 1),
('Masque2_1', 'Masque2_1', 1, 0, 1),
('Masque2_2', 'Masque2_2', 1, 0, 1),
('Masque3', 'Masque3', 1, 0, 1),
('Masque30', 'Masque30', 1, 0, 1),
('Masque30_1', 'Masque30_1', 1, 0, 1),
('Masque30_2', 'Masque30_2', 1, 0, 1),
('Masque31', 'Masque31', 1, 0, 1),
('Masque31_1', 'Masque31_1', 1, 0, 1),
('Masque31_2', 'Masque31_2', 1, 0, 1),
('Masque32', 'Masque32', 1, 0, 1),
('Masque32_1', 'Masque32_1', 1, 0, 1),
('Masque32_2', 'Masque32_2', 1, 0, 1),
('Masque33', 'Masque33', 1, 0, 1),
('Masque33_1', 'Masque33_1', 1, 0, 1),
('Masque33_2', 'Masque33_2', 1, 0, 1),
('Masque34', 'Masque34', 1, 0, 1),
('Masque34_1', 'Masque34_1', 1, 0, 1),
('Masque34_2', 'Masque34_2', 1, 0, 1),
('Masque35', 'Masque35', 1, 0, 1),
('Masque35_1', 'Masque35_1', 1, 0, 1),
('Masque35_2', 'Masque35_2', 1, 0, 1),
('Masque36', 'Masque36', 1, 0, 1),
('Masque36_1', 'Masque36_1', 1, 0, 1),
('Masque36_2', 'Masque36_2', 1, 0, 1),
('Masque37', 'Masque37', 1, 0, 1),
('Masque37_1', 'Masque37_1', 1, 0, 1),
('Masque37_2', 'Masque37_2', 1, 0, 1),
('Masque38', 'Masque38', 1, 0, 1),
('Masque38_1', 'Masque38_1', 1, 0, 1),
('Masque38_2', 'Masque38_2', 1, 0, 1),
('Masque39', 'Masque39', 1, 0, 1),
('Masque39_1', 'Masque39_1', 1, 0, 1),
('Masque39_2', 'Masque39_2', 1, 0, 1),
('Masque4', 'Masque4', 1, 0, 1),
('Masque40', 'Masque40', 1, 0, 1),
('Masque40_1', 'Masque40_1', 1, 0, 1),
('Masque40_2', 'Masque40_2', 1, 0, 1),
('Masque41', 'Masque41', 1, 0, 1),
('Masque41_1', 'Masque41_1', 1, 0, 1),
('Masque41_2', 'Masque41_2', 1, 0, 1),
('Masque42', 'Masque42', 1, 0, 1),
('Masque42_1', 'Masque42_1', 1, 0, 1),
('Masque42_2', 'Masque42_2', 1, 0, 1),
('Masque43', 'Masque43', 1, 0, 1),
('Masque43_1', 'Masque43_1', 1, 0, 1),
('Masque43_2', 'Masque43_2', 1, 0, 1),
('Masque44', 'Masque44', 1, 0, 1),
('Masque44_1', 'Masque44_1', 1, 0, 1),
('Masque44_2', 'Masque44_2', 1, 0, 1),
('Masque45', 'Masque45', 1, 0, 1),
('Masque45_1', 'Masque45_1', 1, 0, 1),
('Masque45_2', 'Masque45_2', 1, 0, 1),
('Masque46', 'Masque46', 1, 0, 1),
('Masque46_1', 'Masque46_1', 1, 0, 1),
('Masque46_2', 'Masque46_2', 1, 0, 1),
('Masque47', 'Masque47', 1, 0, 1),
('Masque47_1', 'Masque47_1', 1, 0, 1),
('Masque47_2', 'Masque47_2', 1, 0, 1),
('Masque48', 'Masque48', 1, 0, 1),
('Masque48_1', 'Masque48_1', 1, 0, 1),
('Masque48_2', 'Masque48_2', 1, 0, 1),
('Masque49', 'Masque49', 1, 0, 1),
('Masque49_1', 'Masque49_1', 1, 0, 1),
('Masque49_2', 'Masque49_2', 1, 0, 1),
('Masque4_1', 'Masque4_1', 1, 0, 1),
('Masque4_2', 'Masque4_2', 1, 0, 1),
('Masque5', 'Masque5', 1, 0, 1),
('Masque50', 'Masque50', 1, 0, 1),
('Masque50_1', 'Masque50_1', 1, 0, 1),
('Masque50_2', 'Masque50_2', 1, 0, 1),
('Masque50_3', 'Masque50_3', 1, 0, 1),
('Masque50_4', 'Masque50_4', 1, 0, 1),
('Masque50_5', 'Masque50_5', 1, 0, 1),
('Masque50_6', 'Masque50_6', 1, 0, 1),
('Masque50_7', 'Masque50_7', 1, 0, 1),
('Masque50_8', 'Masque50_8', 1, 0, 1),
('Masque50_9', 'Masque50_9', 1, 0, 1),
('Masque51', 'Masque1', 1, 0, 1),
('Masque51_1', 'Masque51_1', 1, 0, 1),
('Masque51_2', 'Masque51_2', 1, 0, 1),
('Masque51_3', 'Masque51_3', 1, 0, 1),
('Masque51_4', 'Masque51_4', 1, 0, 1),
('Masque51_5', 'Masque51_5', 1, 0, 1),
('Masque51_6', 'Masque51_6', 1, 0, 1),
('Masque51_7', 'Masque51_7', 1, 0, 1),
('Masque51_8', 'Masque51_8', 1, 0, 1),
('Masque51_9', 'Masque51_9', 1, 0, 1),
('Masque52', 'Masque52', 1, 0, 1),
('Masque52_1', 'Masque52_1', 1, 0, 1),
('Masque52_2', 'Masque52_2', 1, 0, 1),
('Masque52_3', 'Masque52_3', 1, 0, 1),
('Masque52_4', 'Masque52_4', 1, 0, 1),
('Masque52_5', 'Masque52_5', 1, 0, 1),
('Masque52_6', 'Masque52_6', 1, 0, 1),
('Masque52_7', 'Masque52_7', 1, 0, 1),
('Masque52_8', 'Masque52_8', 1, 0, 1),
('Masque52_9', 'Masque52_9', 1, 0, 1),
('Masque53', 'Masque53', 1, 0, 1),
('Masque53_1', 'Masque53_1', 1, 0, 1),
('Masque53_2', 'Masque53_2', 1, 0, 1),
('Masque54', 'Masque54', 1, 0, 1),
('Masque54_1', 'Masque54_1', 1, 0, 1),
('Masque54_2', 'Masque54_2', 1, 0, 1),
('Masque54_3', 'Masque54_3', 1, 0, 1),
('Masque54_4', 'Masque54_4', 1, 0, 1),
('Masque54_5', 'Masque54_5', 1, 0, 1),
('Masque54_6', 'Masque54_6', 1, 0, 1),
('Masque54_7', 'Masque54_7', 1, 0, 1),
('Masque54_8', 'Masque54_8', 1, 0, 1),
('Masque54_9', 'Masque54_9', 1, 0, 1),
('Masque55', 'Masque55', 1, 0, 1),
('Masque55_1', 'Masque55_1', 1, 0, 1),
('Masque55_2', 'Masque55_2', 1, 0, 1),
('Masque56', 'Masque56', 1, 0, 1),
('Masque56_1', 'Masque56_1', 1, 0, 1),
('Masque56_2', 'Masque56_2', 1, 0, 1),
('Masque57', 'Masque57', 1, 0, 1),
('Masque57_1', 'Masque57_1', 1, 0, 1),
('Masque57_2', 'Masque57_2', 1, 0, 1),
('Masque58', 'Masque58', 1, 0, 1),
('Masque58_1', 'Masque58_1', 1, 0, 1),
('Masque58_2', 'Masque58_2', 1, 0, 1),
('Masque59', 'Masque59', 1, 0, 1),
('Masque59_1', 'Masque59_1', 1, 0, 1),
('Masque59_2', 'Masque59_2', 1, 0, 1),
('Masque5_1', 'Masque5_1', 1, 0, 1),
('Masque5_2', 'Masque5_2', 1, 0, 1),
('Masque6', 'Masque6', 1, 0, 1),
('Masque60', 'Masque60', 1, 0, 1),
('Masque60_1', 'Masque60_1', 1, 0, 1),
('Masque60_2', 'Masque60_2', 1, 0, 1),
('Masque6_1', 'Masque6_1', 1, 0, 1),
('Masque6_2', 'Masque6_2', 1, 0, 1),
('Masque7', 'Masque7', 1, 0, 1),
('Masque7_1', 'Masque7_1', 1, 0, 1),
('Masque7_2', 'Masque7_2', 1, 0, 1),
('Masque8', 'Masque8', 1, 0, 1),
('Masque8_1', 'Masque8_1', 1, 0, 1),
('Masque8_2', 'Masque8_2', 1, 0, 1),
('Masque9', 'Masque9', 1, 0, 1),
('Masque9_1', 'Masque9_1', 1, 0, 1),
('Masque9_2', 'Masque9_2', 1, 0, 1),
('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 5000, 0, 1),
('WEAPON_APPISTOL', 'Pistolet Automatique', 5000, 0, 1),
('WEAPON_ASSAULTRIFLE', 'AK-47', 5000, 0, 1),
('WEAPON_ASSAULTSHOTGUN', 'Fusil a Pompe d\'Assaut', 5000, 0, 1),
('WEAPON_ASSAULTSMG', 'P90', 5000, 0, 1),
('WEAPON_AUTOSHOTGUN', 'Fusil a Pompe Automatique', 5000, 0, 1),
('WEAPON_BALL', 'Balle', 5000, 0, 1),
('WEAPON_BAT', 'Batte de Baseball', 5000, 0, 1),
('WEAPON_BATTLEAXE', 'Hache de Combat', 5000, 0, 1),
('WEAPON_BOTTLE', 'Bouteille', 5000, 0, 1),
('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 5000, 0, 1),
('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 5000, 0, 1),
('WEAPON_BZGAS', 'Gaz Lacrymogène', 5000, 0, 1),
('WEAPON_CARBINERIFLE', 'M4A1', 5000, 0, 1),
('WEAPON_COMBATMG', 'Combat MG', 5000, 0, 1),
('WEAPON_COMBATPDW', 'Combat PDW', 5000, 0, 1),
('WEAPON_COMBATPISTOL', 'Glock-17', 5000, 0, 1),
('WEAPON_COMPACTLAUNCHER', 'Lance Grenade', 5000, 0, 1),
('WEAPON_COMPACTRIFLE', 'AK-U', 5000, 0, 1),
('WEAPON_CROWBAR', 'Pied de Biche', 5000, 0, 1),
('WEAPON_DAGGER', 'Couteau de Cuisine', 5000, 0, 1),
('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 5000, 0, 1),
('WEAPON_DIGISCANNER', 'Radar', 5000, 0, 1),
('WEAPON_DOUBLEACTION', 'Double Action Revolver', 5000, 0, 1),
('WEAPON_FIREEXTINGUISHER', 'Extincteur', 5000, 0, 1),
('WEAPON_FIREWORK', 'Feu d\'Artifice', 5000, 0, 1),
('WEAPON_FLARE', 'Fumigène', 5000, 0, 1),
('WEAPON_FLAREGUN', 'Pistolet de Detresse', 5000, 0, 1),
('WEAPON_FLASHLIGHT', 'Lampe Torche', 5000, 0, 1),
('WEAPON_GARBAGEBAG', 'Garbage Bag', 5000, 0, 1),
('WEAPON_GOLFCLUB', 'Club de Golf', 5000, 0, 1),
('WEAPON_GRENADE', 'Grenade', 5000, 0, 1),
('WEAPON_GRENADELAUNCHER', 'Lance grenade', 5000, 0, 1),
('WEAPON_GUSENBERG', 'Gusenberg', 5000, 0, 1),
('WEAPON_HAMMER', 'Marteau de Bricolage', 5000, 0, 1),
('WEAPON_HANDCUFFS', 'Menottes', 5000, 0, 1),
('WEAPON_HATCHET', 'Hachette', 5000, 0, 1),
('WEAPON_HEAVYPISTOL', 'Colt-911', 5000, 0, 1),
('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 5000, 0, 1),
('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 5000, 0, 1),
('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 5000, 0, 1),
('WEAPON_KNIFE', 'Couteau', 5000, 0, 1),
('WEAPON_KNUCKLE', 'Poind Américain', 5000, 0, 1),
('WEAPON_MACHETE', 'Machete', 5000, 0, 1),
('WEAPON_MACHINEPISTOL', 'Tec-9', 5000, 0, 1),
('WEAPON_MARKSMANPISTOL', 'Marksman', 5000, 0, 1),
('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 5000, 0, 1),
('WEAPON_MG', 'MG', 5000, 0, 1),
('WEAPON_MICROSMG', 'UZI', 5000, 0, 1),
('WEAPON_MINIGUN', 'Minigun', 5000, 0, 1),
('WEAPON_MINISMG', 'Scorpion VZ61', 5000, 0, 1),
('WEAPON_MOLOTOV', 'Molotov', 5000, 0, 1),
('WEAPON_MUSKET', 'Musquet', 5000, 0, 1),
('WEAPON_NIGHTSTICK', 'Matraque', 5000, 0, 1),
('WEAPON_PETROLCAN', 'Jerican d\'Essence', 5000, 0, 1),
('WEAPON_PIPEBOMB', 'Bombe(s) Rectangle', 5000, 0, 1),
('WEAPON_PISTOL', 'Berreta 92', 5000, 0, 1),
('WEAPON_PISTOL50', 'Desert Eagle', 5000, 0, 1),
('WEAPON_POOLCUE', 'Queue de Billard', 5000, 0, 1),
('WEAPON_PROXMINE', 'Proximity Mine', 5000, 0, 1),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 5000, 0, 1),
('WEAPON_RAILGUN', 'Rail Gun', 5000, 0, 1),
('WEAPON_REVOLVER', 'Revolver', 5000, 0, 1),
('WEAPON_RPG', 'Lance Rocket', 5000, 0, 1),
('WEAPON_SAWNOFFSHOTGUN', 'ST87 Saw', 5000, 0, 1),
('WEAPON_SMG', 'UMG SMG', 5000, 0, 1),
('WEAPON_SMOKEGRENADE', 'Fumigène(s) Piquante', 5000, 0, 1),
('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 5000, 0, 1),
('WEAPON_SNOWBALL', 'Boule(s) de Neige', 5000, 0, 1),
('WEAPON_SNSPISTOL', 'Colt-25', 5000, 0, 1),
('WEAPON_SPECIALCARBINE', 'M4A1 Sécial', 5000, 0, 1),
('WEAPON_STICKYBOMB', 'Bombe(s) Collante(s)', 5000, 0, 1),
('WEAPON_STINGER', 'Stinger', 5000, 0, 1),
('WEAPON_STUNGUN', 'Tazer', 5000, 0, 1),
('WEAPON_SWITCHBLADE', 'Couteau a Cran d\'Arret', 5000, 0, 1),
('WEAPON_VINTAGEPISTOL', 'Pistolet Ancien', 5000, 0, 1),
('WEAPON_WRENCH', 'Clé Anglaise', 5000, 0, 1),
('access_key', 'Access Key', 1, 0, 1),
('acetone', 'Acetone', -1, 0, 1),
('acid', 'AcidTripe', 10, 0, 1),
('acidesulfurique', 'Acide sulfurique', 200, 0, 1),
('advancedlockpick', 'Outil de serrure', 10, 0, 1),
('antifreeze', 'Antifreeze', -1, 0, 1),
('antigel', 'Antigel', 200, 0, 1),
('apple_cleaver', '??????????????????', 5000, 0, 1),
('apple_p', '????????', 5000, 0, 1),
('apple_pack', '???????????', 5000, 0, 1),
('armbrace', 'Arm Brace', 5, 0, 1),
('badgelspd', 'Badge LSPD', 10, 0, 1),
('bag', 'Sac à dos', 10, 0, 1),
('bagofdope', 'Bullet Casing', -1, 0, 1),
('bait', 'Appât', 100, 0, 1),
('ball', 'Balle', 50, 0, 1),
('banane', 'Banane', 20, 0, 1),
('bandage', 'Bandage', 50, 0, 1),
('bankidcard', 'Bank ID', -1, 0, 1),
('beer', 'Bière', 10, 0, 1),
('biere', 'Bière', 20, 0, 1),
('billets', 'Plaque de billets', 10, 0, 1),
('blowpipe', 'Kit de crochetage', 10, 0, 1),
('blowtorch', 'Chalumeau', 10, 0, 1),
('blue_phone', 'Téléphone', 1, 0, 1),
('bmx', 'Bmx', 2, 0, 1),
('bodybandage', 'Body Bandage', 5, 0, 1),
('bois', 'Rondin', 50, 0, 1),
('boitierarmesdepoing', 'Boitier d\'armes de poing', 3, 0, 1),
('boitierarmeslourdes', 'Boitier d\'armes lourdes', 3, 0, 1),
('bong', 'Pipe a eau', 10, 0, 1),
('bread', 'Sandwich', 50, 0, 1),
('brique', 'Brique', 50, 0, 1),
('briquet', 'Briquet', 50, 0, 1),
('brolly', 'Parapluie', 10, 0, 1),
('bronzemedal', 'Médaille de bronze rallye', 5, 0, 1),
('bullet1', 'Protection ultralégère', 3, 0, 1),
('bullet2', 'Protection légère', 3, 0, 1),
('bullet3', 'Protection standard', 3, 0, 1),
('bullet4', 'Protection lourde', 3, 0, 1),
('bulletproof', 'Gilet par balle', -1, 0, 1),
('bulletproofpolice', 'GPB lspd', 5, 0, 1),
('bulletproofsheriff', 'GPB Sheriff', 5, 0, 1),
('burger', 'Hamburger', 20, 0, 1),
('c4_bank', '4kg de C4', 10, 0, 1),
('camera', 'Caméra', -1, 0, 1),
('carokit', 'Kit carosserie', 10, 0, 1),
('carotool', 'Outils carosserie', 10, 0, 1),
('carteidentite', 'Carte d\'identité', -1, 0, 1),
('casapapel', 'Tenue - Casapapel', 5, 0, 1),
('cddaym', 'CD scellé', 50, 0, 1),
('cdvierge', 'CD vierge', 50, 0, 1),
('chanvre', 'Chanvre', 500, 0, 1),
('char', 'Char', 50, 0, 1),
('cheese', 'Fromage', 20, 0, 1),
('cigar', 'Cigare cubain', 50, 0, 1),
('cigarette', 'Cigarette', 20, 0, 1),
('citron', 'Citron', 20, 0, 1),
('clip', 'Chargeur', 50, 0, 1),
('clipdrum', 'Chargeur tambour', 2, 0, 1),
('clipextended', 'Grand chargeur', 5, 0, 1),
('coca', 'Coca-Cola', 20, 0, 1),
('cocaine', 'Cocaine', -1, 0, 1),
('cocktail', 'Cocktail sans Alcool', 20, 0, 1),
('coffee', 'Café', 20, 0, 1),
('coke', 'Coke', 100, 0, 1),
('coke10g', 'Cocaine (10G)', 50, 0, 1),
('coke1g', 'Cocaïne', 100, 0, 1),
('coke_pooch', 'Pochon de coke', 50, 0, 1),
('cokebrick', 'Paquet(s) de coke', 5, 0, 1),
('cokeburn', 'Clé USB Coke', 2, 0, 1),
('colis', 'Colis', -1, 0, 1),
('comprimidos', 'Doliprane', 10, 0, 1),
('condom', 'Préservatif souillé', 20, 0, 1),
('contract', 'Contrat de vente', 5, 0, 1),
('copper', 'Cuivre', 50, 0, 1),
('coyotte', 'Coyotte', 10, 0, 1),
('craftingtable', 'Crafting Table', -1, 0, 1),
('crawfish', 'Écrevisse', 50, 0, 1),
('croquettes', 'Croquettes', 50, 0, 1),
('crystaldemeth', 'Cristal de meth', 500, 0, 1),
('cuff_keys', 'Pince coupante', 10, 0, 1),
('cuffs', 'Menottes', 10, 0, 1),
('cutting_pliers', 'Pince coupante', 10, 0, 1),
('dia_box', 'Boîte de diamant', 75, 0, 1),
('diamond', 'Diamonds', -1, 0, 1),
('diamondring', 'Diamond Ring', -1, 0, 1),
('disc_ammo_pistol', '.45', 5000, 0, 1),
('disc_ammo_pistol_large', '9mm', 5000, 0, 1),
('disc_ammo_rifle', '5.56mm', 5000, 0, 1),
('disc_ammo_rifle_large', '7.62mm', 5000, 0, 1),
('disc_ammo_shotgun', 'Calibre 12', 5000, 0, 1),
('disc_ammo_shotgun_large', 'Calibre 12', 5000, 0, 1),
('disc_ammo_smg', '19mm', 5000, 0, 1),
('disc_ammo_smg_large', '28mm', 5000, 0, 1),
('disc_ammo_snp', '300 Magnum', 5000, 0, 1),
('disc_ammo_snp_large', '300 Magnum', 5000, 0, 1),
('dopebag', 'Blood Sample', -1, 0, 1),
('drill', 'Drill', 2, 0, 1),
('drugbags', 'Pochtar(s)', 1000, 0, 1),
('drugscales', 'Ammo Analyzer', -1, 0, 1),
('energy', 'RedBull', 20, 0, 1),
('fanta', 'Fanta', 20, 0, 1),
('feijao', 'Haricots bio', 50, 0, 1),
('ferraille', 'Ferraille', 50, 0, 1),
('feuilledecoca', 'Feuilles de coca', 500, 0, 1),
('feuilletabac', 'Feuilles de tabac', 100, 0, 1),
('fichepaye', 'Fiche de paye', -1, 0, 1),
('fish', 'Poisson', 20, 0, 1),
('fishandchips', 'Fish And Chips', 20, 0, 1),
('fishburger', 'Hamburger au poisson', 20, 0, 1),
('fishd', 'Poisson Abattu', 20, 0, 1),
('fishingpermit', 'Permis de Pêche', 5, 0, 1),
('fishingrod', 'Canne à Pêche', 2, 0, 1),
('fixkit', 'Kit réparation', 10, 0, 1),
('fixtool', 'Outils réparation', 10, 0, 1),
('flashlight', 'Lampe', 5, 0, 1),
('fly-ticket', 'Ticket Journalier North Yankton', 5, 0, 1),
('frites', 'Frites', 20, 0, 1),
('gazbottle', 'Bouteille de gaz', 10, 0, 1),
('ghb', 'GHB', 100, 0, 1),
('ghb_pooch', 'Pochon de GHB', 50, 0, 1),
('glacon', 'Glaçon', 50, 0, 1),
('gold', 'Or', 50, 0, 1),
('goldNecklace', 'Collier en Or', -1, 0, 1),
('gold_bar', 'Lingot d\'or', 75, 0, 1),
('goldbar', 'Barre en Or', 20, 0, 1),
('goldbull', 'Gold Bullion', -1, 0, 1),
('goldfish', 'Poisson Rouge', 50, 0, 1),
('goldmedal', 'Médaille d\'or du rallye', 5, 0, 1),
('goldwatch', 'Montre en Or', 20, 0, 1),
('goodbread', 'Bon Pain', 50, 0, 1),
('gps', 'GPS', 20, 0, 1),
('grain', 'Céréale bio', 50, 0, 1),
('green_phone', 'Yeşil Telefon', 1, 0, 1),
('grip', 'Poignée', 5, 0, 1),
('gym_membership', 'Carte membre - GYM', 5, 0, 1),
('hackerDevice', 'Hacking Device', 10, 0, 1),
('hamburger', 'Hamburger', 20, 0, 1),
('handcuff', 'Menottes', 10, 0, 1),
('handcuffs', 'Menottes', 10, 0, 1),
('hazmat1', 'Combinaison Noir', 5, 0, 1),
('hazmat2', 'Combinaison Bleu', 5, 0, 1),
('hazmat3', 'Combinaison Jaune', 5, 0, 1),
('hazmat4', 'Combinaison Blanche', 5, 0, 1),
('hotdog', 'HotDog', 20, 0, 1),
('houblon', 'Houblon', 50, 0, 1),
('hqscale', 'High Quality Scale', 5000, 0, 1),
('icetea', 'icetea', 20, 0, 1),
('id_card', 'Carte d\'identité', 1, 0, 1),
('id_card_f', 'Carte d\'accès ', 5, 3, 1),
('idcard', 'Carte d\'Identité', 5, 0, 1),
('ipad', 'iPad', -1, 0, 1),
('iphone', 'iPhone', -1, 0, 1),
('iron', 'Fer', 50, 0, 1),
('james_fish', 'Poisson cru', 50, 0, 1),
('james_fishingbait', 'Appât', 100, 0, 1),
('james_fishingrod', 'Canne à Pêche', 2, 0, 1),
('jbl', 'Enceinte JBL', 5, 0, 1),
('jewels', 'Bijoux', 50, 0, 1),
('joint', 'Joint', 50, 0, 1),
('joint2g', 'Joint(s)', 1500, 0, 1),
('jumelles', 'Jumelles', 10, 0, 1),
('juscanne', 'Jus de canne', 50, 0, 1),
('jusfruit', 'Jus de fruit', 20, 0, 1),
('jusraisin', 'Jus de Raisin', 50, 0, 1),
('kalilinux', 'Kali Linux', 10, 0, 1),
('karting1', 'Tenue - Karting', 5, 0, 1),
('karting2', 'Tenue - Karting 2', 5, 0, 1),
('keycard', 'System X', 50, 0, 1),
('kitpic', 'Kit de picnic', 5, 0, 1),
('laptop', 'Ordinateur', -1, 0, 1),
('laptop_h', 'PC Portable', 1, 0, 1),
('legbrace', 'Leg Brace', 5, 0, 1),
('levure', 'Levure', 50, 0, 1),
('lobster', 'Lobster', 50, 0, 1),
('lockpick', 'Outil de crochetage', 10, 0, 1),
('lokalizator', 'GPS Véhicules', 5000, 0, 1),
('mackerel', 'Mackerel', 50, 0, 1),
('madera', 'Sapin', 50, 0, 1),
('maderaf', 'Pin', 50, 0, 1),
('maderag', 'Épicéa', 50, 0, 1),
('maderam', 'Cedre', 50, 0, 1),
('magazine', 'Magasine Playboy', 20, 0, 1),
('malbora', 'RedWood', 50, 0, 1),
('malette', 'Malette', -1, 0, 1),
('malt', 'Malt', 50, 0, 1),
('marijuana', 'Marijuana', 100, 0, 1),
('mask', 'mask', -1, 0, 1),
('mask_swim', 'Masque de plongée', 10, 0, 1),
('mclon', 'Carbon', 50, 0, 1),
('medikit', 'Kit de soin', 50, 0, 1),
('menthe', 'Feuille de Menthe', 50, 0, 1),
('meth', 'Méthamphétamine', 100, 0, 1),
('meth10g', 'Meth (10G)', 50, 0, 1),
('meth1g', 'Méthamphétamine', 100, 0, 1),
('meth_pooch', 'Pochon de meth', 50, 0, 1),
('methbrick', 'Paquet(s) de meth', 5, 0, 1),
('methburn', 'Clé USB Meth', 5000, 0, 1),
('milho', 'Maïs bio', 50, 0, 1),
('milk', 'Lait', 20, 0, 1),
('milkbottle', 'Bouteille de Lait', 20, 0, 1),
('mleko', 'lait', 20, 0, 1),
('mojito', 'Mojito', 20, 0, 1),
('morphine', 'Morphine', -1, 0, 1),
('moukate', 'Algue Toxique', 100, 0, 1),
('moukate_pooch', 'Pochon de Moukate', 50, 0, 1),
('neckbrace', 'Neck Brace', 5, 0, 1),
('notepad', 'Bloc-notes', 10, 0, 1),
('odznaka', 'Carte de Police', 5, 0, 1),
('opal', 'Opal', -1, 0, 1),
('opium', 'Opium', 100, 0, 1),
('opium_pooch', 'Pochon de opium', 50, 0, 1),
('opona', 'Pneu', 10, 0, 1),
('orangina', 'Orangina', 20, 0, 1),
('oxycutter', 'Chalumaux', -1, 0, 1),
('pacificidcard', 'Pacific ID', -1, 0, 1),
('paquetnuggets', 'Paquet de nuggets', 50, 0, 1),
('paquetplanche', 'Paquet de planches', 50, 0, 1),
('pelle', 'Pelle', 2, 0, 1),
('permis', 'Permis', -1, 0, 1),
('permisarmes', 'Permis d\'armes', -1, 0, 1),
('petrol', 'Rondin', 50, 0, 1),
('phone', 'Téléphone', 5, 0, 1),
('pierre', 'Pierre', 50, 0, 1),
('pike', 'Pike', 50, 0, 1),
('pizza', 'Pizza', 20, 0, 1),
('planche', 'Planche', 50, 0, 1),
('playersafe', 'Player Safe', 1, 0, 1),
('pochon_mari', 'Pochon de Marijuana', 50, 0, 1),
('poisson', 'Poisson', 50, 0, 1),
('poissoncru', 'Poisson Cru', 50, 0, 1),
('pot', 'Pot', 20, 0, 1),
('poubelle', 'Poubelle', 50, 0, 1),
('poule', 'Poule', 20, 0, 1),
('powerade', 'PoweRade', 10, 0, 1),
('prisonnier', 'Tenue - Prison', 5, 0, 1),
('protein_shake', 'Pot de Proteine', 10, 0, 1),
('radio', 'Talkies walkie', 5, 0, 1),
('raisin', 'Raisin', 100, 0, 1),
('recipe_bagofdope', 'Recipe: Bag of Dope', -1, 0, 1),
('rhum', 'Rhum', 20, 0, 1),
('ring', 'Bague', -1, 0, 1),
('roach', 'Mort', 50, 0, 1),
('rolex', 'Rolex', -1, 0, 1),
('rolpaper', 'Papier a rouler', 500, 0, 1),
('rose', 'Rose', 5, 0, 1),
('sable', 'Sable', 500, 0, 1),
('sactactique', 'Sac tactique', -1, 0, 1),
('salmon', 'Salmon', 50, 0, 1),
('samsungS10', 'Samsung S10', -1, 0, 1),
('sandwich', 'Sandwich', 50, 0, 1),
('sapphire', 'Sapphire', -1, 0, 1),
('scratch', 'Tickets à gratter', -1, 0, 1),
('secure_card', 'Carte de sécurité', 5, 3, 1),
('silencieux', 'Silencieux', 5, 0, 1),
('silverbull', 'Silver Bullion', -1, 0, 1),
('silvermedal', 'Médaille d\'argent rallye', 5, 0, 1),
('sim', 'Carte Sim', 10, 0, 1),
('sirop', 'Sirop', 20, 0, 1),
('skydiving', 'Tenue - Parachute', 5, 0, 1),
('sniffer', 'Tracker - LSPD', 5, 0, 0),
('soda', 'Soda', 20, 0, 1),
('sportlunch', 'Déjeuner de Sport', 10, 0, 1),
('sprite', 'Sprite', 20, 0, 1),
('steak', 'Steak', 20, 0, 1),
('sucrecanne', 'Sucre de Canne', 50, 0, 1),
('tabacsec', 'Tabac Sec', 50, 0, 1),
('tatgun', 'Pistolet tatouage', 5, 0, 1),
('tea', 'Ice-Tea', 20, 0, 1),
('tel', 'tel', 20, 0, 1),
('terre', 'Terre', 200, 0, 1),
('thermal_charge', 'Charge thermique', 5, 0, 1),
('ticket_news', 'Ticket d\'annonce', 5, 0, 1),
('traceur', 'Traceur', 20, 0, 1),
('tracker', 'Bracelet électronique', 5, 0, 0),
('trout', 'Trout', 50, 0, 1),
('truele', 'Truelle', 5, 0, 1),
('up7', '7up', 20, 0, 1),
('vaccine', 'vaccine', -1, 0, 1),
('vault', 'vault', 2, 0, 1),
('veganburger', 'Hamburger Végan', 20, 0, 1),
('viande', 'Viande', 20, 0, 1),
('viandepoulet', 'Viande de poulet', 30, 0, 1),
('vin', 'Vin', 50, 0, 1),
('viseur', 'Viseur', -1, 0, 1),
('warehouse_key', 'Warehouse Key', 1, 0, 1),
('water', 'Eau', 20, 0, 1),
('waterg', 'Eau Gazeuze', 20, 0, 1),
('weed', 'Marihuana', 100, 0, 1),
('weed20g', 'Weed (20G)', 50, 0, 1),
('weed4g', 'Weed', 100, 0, 1),
('weed_pooch', 'Pochon de weed', 50, 0, 1),
('weed_seed', 'Graine de Weed', 50, 0, 1),
('weedbrick', 'Paquet(s) de weed', 5, 0, 1),
('weedburn', 'Clé USB Weed', 2, 0, 1),
('wheat', 'Blé', 50, 0, 1),
('whiskey', 'Whiskey', -1, 0, 1),
('white_phone', 'Beyaz Telefon', 1, 0, 1),
('whitefish', 'Poisson Blanc', 50, 0, 1),
('wine', 'Wine', -1, 0, 1),
('wipe', 'Pillule Euthanasie', 5, 0, 1),
('wood', 'Rondin', 50, 0, 1),
('yusuf', 'Skin de luxe', 5, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (name`, `label`, `whitelisted`) VALUES
('abatteur', 'Abatteur', 1),
('ambulance', 'EMS', 1),
('avocat', 'Avocat', 1),
('bacars', 'Towing', 1),
('beekers', 'Beeker\'s', 1),
('bikedealer', 'American Motor\'s', 1),
('brinks', 'Brinks', 1),
('bucheron', 'Bûcheron', 1),
('burgershot', 'BurgerShot', 1),
('cardealer', 'American Car\'s', 1),
('daymson', 'Capitol Record\'s', 1),
('eboueur', 'Little Pricks', 1),
('farm', 'Fermier', 1),
('farmer', 'Fermier', 1),
('ferrailleur', 'Ferrailleur', 0),
('fishing', 'Pêcheur', 1),
('fueler', 'Raffineur', 1),
('garbage', 'Little Pricks', 0),
('gardien', 'Gardien', 1),
('gouv', 'Gouv', 1),
('journalist', 'DistrictNew\'s', 1),
('krowa', 'Laitier', 0),
('lscustoms', 'Ls Customs', 1),
('ltd', 'LTD', 1),
('ltdnord', 'LTD Nord', 1),
('mechanic', 'Simmons', 1),
('mhmclovin', 'Mineur', 0),
('militaire', 'Militaire', 1),
('offambulance', 'Hors-Service EMS', 1),
('offpolice', 'Hors-Service LSPD', 1),
('offsheriff', 'Hors-Service BSCO', 1),
('palace', 'Palace', 1),
('pecheur', 'Pêcheur', 1),
('police', 'LSPD', 1),
('rally', 'Rallye', 1),
('realestateagent', 'Agent immobilier', 1),
('security', 'Gruppe6', 1),
('sheriff', 'Sheriff', 1),
('suicidsquad', 'Suicid Squad', 1),
('tabac', 'RedWood', 1),
('taxi', 'Taxi', 1),
('unemployed', 'Sans-Emploi', 0),
('unicorn', 'Unicorn', 1),
('vigneron', 'Vigneron', 1),
('woodcutter', 'Bucheron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'chomage', 'RSA', 10, '{}', '{}'),
(2, 'ambulance', 0, 'ambulance', 'Ambulancier', 10, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes_1\":12,\"shoes_2\":6,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":96,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":87,\"helmet_1\":122,\"helmet_2\":1,\"arms\":85,\"face\":19,\"decals_1\":58,\"torso_1\":250,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":5}', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":99,\"glasses_1\":5,\"hair_1\":2,\"sex\":1,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":121,\"helmet_2\":1,\"arms\":106,\"face\":19,\"decals_1\":66,\"torso_1\":258,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":6,\"chain_2\":1}'),
(3, 'ambulance', 1, 'doctor', 'Medecin', 15, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes_1\":12,\"shoes_2\":6,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":96,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":87,\"helmet_1\":122,\"helmet_2\":1,\"arms\":85,\"face\":19,\"decals_1\":58,\"torso_1\":250,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":5}', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":99,\"glasses_1\":5,\"hair_1\":2,\"sex\":1,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":121,\"helmet_2\":1,\"arms\":106,\"face\":19,\"decals_1\":66,\"torso_1\":258,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":6,\"chain_2\":1}'),
(4, 'ambulance', 2, 'chief_doctor', 'Chef-Medecin', 25, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes_1\":12,\"shoes_2\":6,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":96,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":87,\"helmet_1\":122,\"helmet_2\":1,\"arms\":85,\"face\":19,\"decals_1\":58,\"torso_1\":250,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":5}', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":99,\"glasses_1\":5,\"hair_1\":2,\"sex\":1,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":121,\"helmet_2\":1,\"arms\":106,\"face\":19,\"decals_1\":66,\"torso_1\":258,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":6,\"chain_2\":1}'),
(5, 'ambulance', 3, 'boss', 'Directeur', 35, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes_1\":12,\"shoes_2\":6,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":96,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":87,\"helmet_1\":122,\"helmet_2\":1,\"arms\":85,\"face\":19,\"decals_1\":58,\"torso_1\":250,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":5}', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":1,\"hair_color_2\":0,\"pants_1\":99,\"glasses_1\":5,\"hair_1\":2,\"sex\":1,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":121,\"helmet_2\":1,\"arms\":106,\"face\":19,\"decals_1\":66,\"torso_1\":258,\"hair_2\":0,\"skin\":34,\"pants_2\":1,\"chain_1\":6,\"chain_2\":1}'),
(6, 'cardealer', 0, 'recruit', 'Stagiaire', 1, '{}', '{}'),
(7, 'cardealer', 1, 'novice', 'Employé', 1, '{}', '{}'),
(8, 'cardealer', 2, 'experienced', 'Responsable', 1, '{}', '{}'),
(9, 'cardealer', 3, 'boss', 'Patron', 1, '{}', '{}'),
(10, 'mechanic', 0, 'recrue', 'Stagiaire', 1, '{torso_1\":66,\"torso_2\":1,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":96,\"bags_1\":44,\"bags_2\":0,\"pants_1\":39,\"pants_2\":1,\"shoes_1\":27,\"shoes_2\":0}', '{torso_1\":60,\"torso_2\":1,\"tshirt_1\":14,\"tshirt_2\":0,\"arms\":54,\"bags_1\":44,\"bags_2\":0,\"pants_1\":39,\"pants_2\":1,\"shoes_1\":76,\"shoes_2\":0}'),
(11, 'mechanic', 1, 'novice', 'Mécanicien', 1, '{torso_1\":66,\"torso_2\":0,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":96,\"bags_1\":40,\"bags_2\":0,\"pants_1\":39,\"pants_2\":1,\"shoes_1\":27,\"shoes_2\":0}', '{torso_1\":60,\"torso_2\":0,\"tshirt_1\":14,\"tshirt_2\":0,\"arms\":54,\"bags_1\":40,\"bags_2\":0,\"pants_1\":39,\"pants_2\":0,\"shoes_1\":76,\"shoes_2\":0}'),
(12, 'mechanic', 2, 'experimente', 'Chef d\'équipe', 1, '{torso_1\":43,\"torso_2\":0,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":37,\"bags_1\":40,\"bags_2\":0,\"pants_1\":75,\"pants_2\":0,\"shoes_1\":27,\"shoes_2\":0}', '{torso_1\":86,\"torso_2\":0,\"tshirt_1\":14,\"tshirt_2\":0,\"arms\":54,\"bags_1\":40,\"bags_2\":0,\"pants_1\":0,\"pants_2\":1,\"shoes_1\":62,\"shoes_2\":20}'),
(13, 'mechanic', 3, 'chief', 'Co-Patron', 1, '{torso_1\":43,\"torso_2\":0,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":37,\"bags_1\":40,\"bags_2\":0,\"pants_1\":75,\"pants_2\":0,\"shoes_1\":27,\"shoes_2\":0}', '{torso_1\":86,\"torso_2\":0,\"tshirt_1\":14,\"tshirt_2\":0,\"arms\":54,\"bags_1\":40,\"bags_2\":0,\"pants_1\":0,\"pants_2\":1,\"shoes_1\":62,\"shoes_2\":20}'),
(14, 'mechanic', 4, 'boss', 'Patron', 1, '{torso_1\":56,\"torso_2\":0,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":74,\"bags_1\":40,\"bags_2\":0,\"pants_1\":1,\"pants_2\":0,\"shoes_1\":35,\"shoes_2\":0}', '{torso_1\":49,\"torso_2\":0,\"tshirt_1\":14,\"tshirt_2\":0,\"arms\":57,\"bags_1\":40,\"bags_2\":0,\"pants_1\":4,\"pants_2\":0,\"shoes_1\":62,\"shoes_2\":20}'),
(20, 'daymson', 0, 'employe', 'Employé', 60, '{}', '{}'),
(21, 'daymson', 1, 'vigile', 'Vigile', 80, '{}', '{}'),
(22, 'daymson', 2, 'artiste', 'Artiste', 100, '{}', '{}'),
(23, 'daymson', 3, 'ingeson', 'Ingé Son', 120, '{}', '{}'),
(24, 'daymson', 4, 'manager', 'Manager', 140, '{}', '{}'),
(25, 'daymson', 5, 'gerant', 'Gérant', 160, '{}', '{}'),
(26, 'daymson', 6, 'boss', 'Patron', 180, '{}', '{}'),
(27, 'avocat', 0, 'employe', 'Employé', 300, '{}', '{}'),
(28, 'avocat', 1, 'boss', 'Patron', 400, '{}', '{}'),
(29, 'journalist', 0, 'stagiaire', 'Stagiaire', 60, '{}', '{}'),
(30, 'journalist', 1, 'employe', 'Journalist', 80, '{}', '{}'),
(31, 'journalist', 2, 'boss', 'Patron', 120, '{}', '{}'),
(32, 'taxi', 0, 'recrue', 'Stagiaire', 20, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":260,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":5,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":21,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":8,\"pants_1\":52}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(33, 'taxi', 1, 'novice', 'Employé', 30, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":260,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":5,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":21,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":8,\"pants_1\":52}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(34, 'taxi', 2, 'experimente', 'Responsable ', 40, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":260,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":5,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":21,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":8,\"pants_1\":52}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(35, 'taxi', 3, 'uber', 'Uber', 50, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":260,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":5,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":21,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":8,\"pants_1\":52}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(36, 'taxi', 4, 'boss', 'Patron', 1, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":260,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":15,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":5,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":21,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":8,\"pants_1\":52}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(37, 'palace', 0, 'employe', 'Barman', 75, '{}', '{}'),
(38, 'palace', 1, 'vigile', 'Vigile', 85, '{}', '{}'),
(39, 'palace', 2, 'danse', 'Danseuse', 95, '{}', '{}'),
(40, 'palace', 3, 'gerant', 'Gérant', 110, '{}', '{}'),
(41, 'palace', 4, 'boss', 'Patron', 125, '{}', '{}'),
(42, 'gouv', 0, 'stagiaire', 'secrétaire', 150, '{}', '{}'),
(43, 'gouv', 1, 'gardedc', 'Garde du Corps', 350, '{}', '{}'),
(44, 'gouv', 2, 'secretaire', 'service secret', 500, '{}', '{}'),
(45, 'gouv', 3, 'coboss', 'Vice-président', 750, '{}', '{}'),
(46, 'gouv', 4, 'boss', 'Président', 1000, '{}', '{}'),
(47, 'tabac', 0, 'stagiaire', 'Stagiaire', 1, '{}', '{}'),
(48, 'tabac', 1, 'employe', 'Employe', 1, '{}', '{}'),
(49, 'tabac', 2, 'responsable', 'Responsable', 1, '{}', '{}'),
(50, 'tabac', 3, 'coboss', 'Co-Patron', 1, '{}', '{}'),
(51, 'tabac', 4, 'boss', 'Patron', 1, '{}', '{}'),
(52, 'vigneron', 0, 'stagiaire', 'Stagiaire', 2, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":24,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":97,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":43,\"hair_2\":0,\"skin\":34,\"pants_2\":3}', '{}'),
(53, 'vigneron', 1, 'employe', 'Employe', 3, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":24,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":97,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":43,\"hair_2\":0,\"skin\":34,\"pants_2\":3}', '{}'),
(54, 'vigneron', 2, 'responsable', 'Responsable', 1, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":24,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":97,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":43,\"hair_2\":0,\"skin\":34,\"pants_2\":3}', '{}'),
(55, 'vigneron', 3, 'boss', 'Patron', 1, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":62,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":97,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":24,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":97,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":43,\"hair_2\":0,\"skin\":34,\"pants_2\":3}', '{}'),
(56, 'unicorn', 0, 'danseuse', 'Danseuse', 150, '{}', '{}'),
(57, 'unicorn', 1, 'vigile', 'Vigile', 250, '{}', '{}'),
(58, 'unicorn', 2, 'barman', 'Barman', 300, '{}', '{}'),
(59, 'unicorn', 3, 'gerant', 'Gérant', 400, '{}', '{}'),
(60, 'unicorn', 4, 'boss', 'Patron', 500, '{}', '{}'),
(61, 'bucheron', 0, 'stagiaire', 'Intérim', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":52,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":44,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(62, 'bucheron', 1, 'employe', 'Employe', 25, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":52,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":44,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(63, 'bucheron', 2, 'responsable', 'Responsable', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":52,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":44,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(64, 'bucheron', 3, 'gerant', 'Gérant', 35, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":52,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":44,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(65, 'bucheron', 4, 'boss', 'Patron', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":52,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":0,\"torso_1\":44,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(66, 'abatteur', 0, 'stagiaire', 'Stagiaire', 12, '{}', '{}'),
(67, 'abatteur', 1, 'employe', 'Employe', 24, '{}', '{}'),
(68, 'abatteur', 2, 'responsable', 'Responsable', 36, '{}', '{}'),
(69, 'abatteur', 3, 'gerant', 'Gérant', 44, '{}', '{}'),
(70, 'abatteur', 4, 'boss', 'Patron', 63, '{}', '{}'),
(71, 'pecheur', 0, 'stagiaire', 'Stagiaire', 12, '{}', '{}'),
(72, 'pecheur', 1, 'employe', 'Employe', 24, '{}', '{}'),
(73, 'pecheur', 2, 'responsable', 'Responsable', 36, '{}', '{}'),
(74, 'pecheur', 3, 'boss', 'Patron', 48, '{}', '{}'),
(75, 'burgershot', 0, 'stagiaire', 'Stagiaire', 1, '{}', '{}'),
(76, 'burgershot', 1, 'employe', 'Employe', 10, '{}', '{}'),
(77, 'burgershot', 2, 'responsable', 'Responsable', 20, '{}', '{}'),
(78, 'burgershot', 3, 'coboss', 'Co-Patron', 20, '{}', '{}'),
(79, 'burgershot', 4, 'boss', 'Patron', 1, '{}', '{}'),
(80, 'bacars', 0, 'stagiaire', 'Stagiaire', 50, '{}', '{}'),
(81, 'bacars', 1, 'expcustom', 'Expert Customs', 85, '{}', '{}'),
(82, 'bacars', 2, 'chef', 'Chef d’équipe', 90, '{}', '{}'),
(83, 'bacars', 3, 'gerant', 'Gérant', 110, '{}', '{}'),
(84, 'bacars', 4, 'boss', 'Patron', 125, '{}', '{}'),
(85, 'bikedealer', 0, 'recruit', 'Stagiaire', 10, '{}', '{}'),
(86, 'bikedealer', 1, 'novice', 'Employé', 10, '{}', '{}'),
(87, 'bikedealer', 2, 'experienced', 'Experimente', 10, '{}', '{}'),
(88, 'bikedealer', 3, 'boss', 'Patron', 10, '{}', '{}'),
(89, 'militaire', 0, 'recrue', 'Recrue', 50, '{}', '{}'),
(90, 'militaire', 1, 'caporal', 'Caporal', 60, '{}', '{}'),
(91, 'militaire', 2, 'sergent', 'Sergent', 70, '{}', '{}'),
(92, 'militaire', 3, 'lieutenant', 'Lieutenant', 80, '{}', '{}'),
(93, 'militaire', 4, 'major', 'Major', 90, '{}', '{}'),
(94, 'militaire', 5, 'colonel', 'Colonel', 100, '{}', '{}'),
(95, 'militaire', 6, 'boss', 'Maréchal', 110, '{}', '{}'),
(96, 'suicidsquad', 1, 'boss', 'Membre', 50, '{}', '{}'),
(97, 'eboueur', 0, 'interim', 'Intérimaire', 50, '{}', '{}'),
(98, 'eboueur', 1, 'boss', 'Patron', 80, '{}', '{}'),
(100, 'realestateagent', 0, 'location', 'Location', 10, '{}', '{}'),
(101, 'realestateagent', 1, 'vendeur', 'Vendeur', 25, '{}', '{}'),
(102, 'realestateagent', 2, 'gestion', 'Gestion', 40, '{}', '{}'),
(103, 'realestateagent', 3, 'boss', 'Patron', 0, '{}', '{}'),
(104, 'gardien', 0, 'recruit', 'Stagiaire', 20, '{}', '{}'),
(105, 'gardien', 1, 'officer', 'Gardien', 40, '{}', '{}'),
(106, 'gardien', 2, 'sergeant', 'Gardien-Sup', 60, '{}', '{}'),
(107, 'gardien', 3, 'lieutenant', 'Sous-Chef', 85, '{}', '{}'),
(108, 'gardien', 4, 'boss', 'Directeur', 100, '{}', '{}'),
(109, 'police', 1, 'officer', 'Officier I', 120, '{}', '{}'),
(110, 'police', 2, 'officer', 'Officier II', 140, '{}', '{}'),
(111, 'police', 3, 'officer', 'Officier III', 160, '{}', '{}'),
(112, 'police', 4, 'sergeant', 'Sergent I', 200, '{}', '{}'),
(113, 'police', 5, 'sergeant', 'Sergent II', 250, '{}', '{}'),
(114, 'police', 6, 'sergeant', 'Sergent III', 250, '{}', '{}'),
(115, 'police', 7, 'lieutenant', 'Lieutenant I', 300, '{}', '{}'),
(116, 'police', 8, 'lieutenant', 'Lieutenant II', 300, '{}', '{}'),
(117, 'police', 9, 'lieutenant', 'Lieutenant III', 360, '{}', '{}'),
(118, 'police', 10, 'boss', 'Capitaine', 400, '{}', '{}'),
(119, 'police', 11, 'boss', 'Commandant', 500, '{}', '{}'),
(120, 'sheriff', 1, 'officer', 'Officier I', 30, '{}', '{}'),
(121, 'sheriff', 2, 'officer', 'Officier II', 30, '{}', '{}'),
(122, 'sheriff', 3, 'officer', 'Officier III', 30, '{}', '{}'),
(123, 'sheriff', 4, 'sergeant', 'Major I', 60, '{}', '{}'),
(124, 'sheriff', 5, 'sergeant', 'Major II', 60, '{}', '{}'),
(125, 'sheriff', 6, 'sergeant', 'Major III', 60, '{}', '{}'),
(126, 'sheriff', 7, 'lieutenant', 'Sheriff-Adjoint I', 60, '{}', '{}'),
(127, 'sheriff', 8, 'lieutenant', 'Sheriff-Adjoint II', 60, '{}', '{}'),
(128, 'sheriff', 9, 'lieutenant', 'Sheriff-Adjoint III', 60, '{}', '{}'),
(129, 'sheriff', 10, 'boss', 'Capitaine', 60, '{}', '{}'),
(130, 'sheriff', 11, 'boss', 'Commandant', 50, '{}', '{}'),
(131, 'rally', 0, 'employee', 'Pilote', 50, '{\"shoes_1\":55,\"lipstick_4\":0,\"age_1\":10,\"beard_2\":10,\"decals_1\":12,\"decals_2\":0,\"beard_3\":0,\"lipstick_2\":0,\"mask_2\":0,\"hair_color_2\":0,\"eyebrows_4\":2,\"makeup_3\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":11,\"tshirt_1\":15,\"torso_1\":148,\"ears_2\":1,\"shoes_2\":3,\"lipstick_1\":0,\"helmet_1\":72,\"age_2\":4,\"sex\":0,\"beard_1\":10,\"skin\":0,\"hair_color_1\":2,\"glasses_2\":1,\"hair_1\":21,\"bags_1\":0,\"tshirt_2\":0,\"eyebrows_1\":17,\"bproof_1\":0,\"eyebrows_2\":10,\"glasses_1\":15,\"pants_1\":66,\"hair_2\":1,\"mask_1\":0,\"makeup_1\":0,\"torso_2\":4,\"bags_2\":0,\"face\":31,\"chain_2\":0,\"helmet_2\":5,\"pants_2\":2,\"arms\":1,\"chain_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"eyebrows_3\":3,\"makeup_4\":0}', '{\"shoes_1\":55,\"lipstick_4\":0,\"age_1\":10,\"beard_2\":10,\"decals_1\":12,\"decals_2\":0,\"beard_3\":0,\"lipstick_2\":0,\"mask_2\":0,\"hair_color_2\":0,\"eyebrows_4\":2,\"makeup_3\":0,\"beard_4\":0,\"makeup_2\":0,\"ears_1\":11,\"tshirt_1\":15,\"torso_1\":148,\"ears_2\":1,\"shoes_2\":3,\"lipstick_1\":0,\"helmet_1\":72,\"age_2\":4,\"sex\":0,\"beard_1\":10,\"skin\":0,\"hair_color_1\":2,\"glasses_2\":1,\"hair_1\":21,\"bags_1\":0,\"tshirt_2\":0,\"eyebrows_1\":17,\"bproof_1\":0,\"eyebrows_2\":10,\"glasses_1\":15,\"pants_1\":66,\"hair_2\":1,\"mask_1\":0,\"makeup_1\":0,\"torso_2\":4,\"bags_2\":0,\"face\":31,\"chain_2\":0,\"helmet_2\":5,\"pants_2\":2,\"arms\":1,\"chain_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"eyebrows_3\":3,\"makeup_4\":0}'),
(132, 'security', 0, 'recruit', 'Garde Recrue', 35, '{}', '{}'),
(133, 'security', 1, 'guard', 'Guarde Sécurité', 50, '{}', '{}'),
(134, 'security', 2, 'nightwatch', 'Guarde de Nuit', 75, '{}', '{}'),
(135, 'security', 3, 'manager', 'Manager', 10, '{}', '{}'),
(136, 'security', 4, 'boss', 'Directeur', 120, '{}', '{}'),
(137, 'brinks', 0, 'employee', 'Employé(e)', 200, '{}', '{}'),
(138, 'woodcutter', 0, 'empleado', 'Bucheron', 20, '', ''),
(139, 'mhmclovin', 0, 'empleado', 'Mineur', 20, '', ''),
(230, 'krowa', 0, 'employee', 'Fermier', 20, '', ''),
(231, 'ferrailleur', 0, 'employee', 'Ferrailleur', 20, '', ''),
(232, 'farmer', 0, 'employee', 'Fermier', 10, '{}', '{}'),
(233, 'police', 0, 'cadet', 'En Stage', 75, '{}', '{}'),
(234, 'sheriff', 0, 'cadet', 'cadet', 10, '{}', '{}'),
(236, 'fishing', 0, 'recrue', 'Apprentie', 30, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(237, 'fishing', 1, 'recrue', 'Employer', 50, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(238, 'fishing', 2, 'novice', 'Chef équipe', 70, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(239, 'fishing', 3, 'cdisenior', 'Co-Patron', 75, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(240, 'fishing', 4, 'boss', 'Patron', 100, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(241, 'fueler', 0, 'recrue', 'Intérimaire', 250, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(242, 'fueler', 1, 'novice', 'Chef équipe', 500, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(243, 'fueler', 2, 'cdisenior', 'Adjoint', 750, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(244, 'fueler', 3, 'boss', 'Patron', 1000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{}'),
(245, 'farm', 0, 'recrue', 'Novice', 0, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(246, 'farm', 1, 'novice', 'CDI', 0, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(247, 'farm', 2, 'cdisenior', 'Gerente', 0, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(248, 'farm', 3, 'boss', 'Boss', 0, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(249, 'beekers', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(250, 'beekers', 1, 'novice', 'Novice', 24, '{}', '{}'),
(251, 'beekers', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(252, 'beekers', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(253, 'beekers', 4, 'boss', 'Patron', 0, '{}', '{}'),
(254, 'lscustoms', 0, 'recrue', 'Recrue', 1, '{}', '{}'),
(255, 'lscustoms', 1, 'novice', 'Novice', 1, '{}', '{}'),
(256, 'lscustoms', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
(257, 'lscustoms', 3, 'chief', 'Chef d\'équipe', 1, '{}', '{}'),
(258, 'lscustoms', 4, 'boss', 'Patron', 1, '{}', '{}'),
(259, 'garbage', 0, 'employee', 'Employé', 40, '{}', '{}'),
(260, 'offpolice', 0, 'cadet', 'En Stage', 0, '{}', '{}'),
(261, 'offpolice', 1, 'officer', 'Officier I', 0, '{}', '{}'),
(262, 'offpolice', 2, 'officer', 'Officier II', 0, '{}', '{}'),
(263, 'offpolice', 3, 'officer', 'Officier III', 0, '{}', '{}'),
(264, 'offpolice', 4, 'sergeant', 'Sergent I', 0, '{}', '{}'),
(265, 'offpolice', 5, 'sergeant', 'Sergent II', 0, '{}', '{}'),
(266, 'offpolice', 6, 'sergeant', 'Sergent III', 0, '{}', '{}'),
(267, 'offpolice', 7, 'lieutenant', 'Lieutenant I', 0, '{}', '{}'),
(268, 'offpolice', 8, 'lieutenant', 'Lieutenant II', 0, '{}', '{}'),
(269, 'offpolice', 9, 'lieutenant', 'Lieutenant III', 0, '{}', '{}'),
(270, 'offpolice', 10, 'boss', 'Capitaine', 0, '{}', '{}'),
(271, 'offpolice', 11, 'boss', 'Commandant', 0, '{}', '{}'),
(272, 'offambulance', 0, 'ambulance', 'Ambulancier', 0, '{}', '{}'),
(273, 'offambulance', 1, 'doctor', 'Médecin', 0, '{}', '{}'),
(274, 'offambulance', 2, 'chief_doctor', 'Chef-Medecin', 0, '{}', '{}'),
(275, 'offambulance', 3, 'boss', 'Directeur', 0, '{}', '{}'),
(276, 'offsheriff', 0, 'cadet', 'En Stage', 0, '{}', '{}'),
(278, 'offsheriff', 1, 'officer', 'Officier I', 0, '{}', '{}'),
(279, 'offsheriff', 2, 'officer', 'Officier II', 0, '{}', '{}'),
(280, 'offsheriff', 3, 'officer', 'Officier III', 0, '{}', '{}'),
(281, 'offsheriff', 4, 'sergeant', 'Major I', 0, '{}', '{}'),
(282, 'offsheriff', 5, 'sergeant', 'Major II', 0, '{}', '{}'),
(283, 'offsheriff', 6, 'sergeant', 'Major III', 0, '{}', '{}'),
(284, 'offsheriff', 7, 'lieutenant', 'Sheriff-Adjoint I', 0, '{}', '{}'),
(285, 'offsheriff', 8, 'lieutenant', 'Sheriff-Adjoint II', 0, '{}', '{}'),
(286, 'offsheriff', 9, 'lieutenant', 'Sheriff-Adjoint III', 0, '{}', '{}'),
(287, 'offsheriff', 10, 'boss', 'Capitainne', 0, '{}', '{}'),
(288, 'offsheriff', 11, 'boss', 'Commandant', 0, '{}', '{}'),
(1000, 'ltd', 0, 'employer', 'Employé', 150, '{}', '{}'),
(1001, 'ltd', 1, 'gerant', 'Gérant', 150, '{}', '{}'),
(1002, 'ltdnord', 0, 'employer', 'Employé', 150, '{}', '{}'),
(1003, 'ltdnord', 1, 'gerant', 'Gérant', 150, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `known_recipes`
--

CREATE TABLE `known_recipes` (
  `identifier` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('aircraft', 'Aircraft License'),
('boating', 'Boating License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'Permis de port d\'arme'),
('weed_processing', 'Marijuana License');

-- --------------------------------------------------------

--
-- Structure de la table `lrp_registromedico`
--

CREATE TABLE `lrp_registromedico` (
  `offense` varchar(160) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT 0,
  `identifier` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `warden` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lrp_registromedicoinfo`
--

CREATE TABLE `lrp_registromedicoinfo` (
  `identifier` varchar(160) NOT NULL,
  `aliases` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyecolor` varchar(255) DEFAULT NULL,
  `haircolor` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mdt_reports`
--

-- --------------------------------------------------------

--
-- Structure de la table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `meeta_vehicle_trunk`
--

CREATE TABLE `meeta_vehicle_trunk` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isweapon` int(255) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `label_weapon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `meeta_vehicle_trunk`
--

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `org`
--

CREATE TABLE `org` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `org`
--

INSERT INTO `org` (`name`, `label`) VALUES
('Arkan', 'Arkan'),
('ballas', 'Ballas'),
('families', 'Families'),
('lost', 'Lost'),
('Madrazo', 'Madrazo'),
('Marabunta', 'Marabunta'),
('organisation', 'État'),
('sacra', 'Sacra'),
('SinaLoa', 'SinaLoa'),
('vagos', 'Vagos');

-- --------------------------------------------------------

--
-- Structure de la table `org_gradeorg`
--

CREATE TABLE `org_gradeorg` (
  `id` int(11) NOT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `gradeorg` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `org_gradeorg`
--

INSERT INTO `org_gradeorg` (`id`, `org_name`, `gradeorg`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'organisation', 0, 'organisation', 'Civil', 200, '{}', '{}'),
(2, 'ballas', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(3, 'ballas', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(4, 'ballas', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(5, 'ballas', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(6, 'vagos', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(7, 'vagos', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(8, 'vagos', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(9, 'vagos', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(10, 'families', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(11, 'families', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(12, 'families', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(13, 'families', 3, 'boss', 'OG', 2700, '{}', '{}'),
(14, 'sacra', 0, 'soldato', 'Principiante', 1500, '{}', '{}'),
(15, 'sacra', 1, 'capo', 'Venditore', 1800, '{}', '{}'),
(16, 'sacra', 2, 'consigliere', 'Tenente', 2100, '{}', '{}'),
(17, 'sacra', 3, 'boss', 'El Capo', 2700, '{}', '{}'),
(18, 'SinaLoa', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(19, 'SinaLoa', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(20, 'SinaLoa', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(21, 'SinaLoa', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(22, 'Arkan', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(23, 'Arkan', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(24, 'Arkan', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(25, 'Arkan', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(26, 'Madrazo', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(27, 'Madrazo', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(28, 'Madrazo', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(29, 'Madrazo', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(30, 'Marabunta', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(31, 'Marabunta', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(32, 'Marabunta', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(33, 'Marabunta', 3, 'boss', 'Patron', 2700, '{}', '{}'),
(34, 'lost', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(35, 'lost', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(36, 'lost', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(37, 'lost', 3, 'boss', 'Patron', 2700, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `owned_boats`
--

CREATE TABLE `owned_boats` (
  `id` int(11) NOT NULL,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'State of the boat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `owned_shops`
--

CREATE TABLE `owned_shops` (
  `identifier` varchar(250) DEFAULT NULL,
  `ShopNumber` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT 0,
  `ShopValue` int(11) DEFAULT NULL,
  `LastRobbery` int(11) DEFAULT 0,
  `ShopName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Etat de la voiture',
  `stored` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'State of the vehicle',
  `garage_name` varchar(50) NOT NULL DEFAULT 'Centre',
  `pound` tinyint(1) NOT NULL DEFAULT 0,
  `vehiclename` varchar(50) DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  `lasthouse` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `owned_vehicles`
--

-- --------------------------------------------------------

--
-- Structure de la table `pawnshops`
--

CREATE TABLE `pawnshops` (
  `shopdata` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_calls`
--

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phone_messages`
--

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `playerhousing`
--

CREATE TABLE `playerhousing` (
  `id` int(32) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `rented` tinyint(1) DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `playerhousing`
--


-- --------------------------------------------------------

--
-- Structure de la table `playerhousing_keys`
--

CREATE TABLE `playerhousing_keys` (
  `owner` varchar(50) NOT NULL,
  `house` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `playersafes`
--

CREATE TABLE `playersafes` (
  `owner` varchar(50) NOT NULL,
  `location` longtext NOT NULL,
  `instance` varchar(50) NOT NULL,
  `inventory` longtext NOT NULL,
  `dirtymoney` int(11) NOT NULL,
  `weapons` longtext NOT NULL,
  `safeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `playerstattoos`
--

-- --------------------------------------------------------

--
-- Structure de la table `position_agricultures`
--

CREATE TABLE `position_agricultures` (
  `id` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `x` double(8,2) NOT NULL,
  `y` double(8,2) NOT NULL,
  `z` double(8,2) NOT NULL,
  `percent` double(8,2) DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 150000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 150000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 70000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 150000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 150000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 150000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 120000),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 150000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 150000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 150000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 70000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 130000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 130000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 130000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 130000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 130000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 130000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 130000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 130000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 130000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 130000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 130000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 130000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 130000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 130000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 130000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 130000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 130000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 130000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 130000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 130000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 130000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 130000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 130000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 130000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 170000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 170000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 170000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 170000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-76.49,\"y\":-826.80,\"z\":243.38}', 500000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', 350000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 270000),
(73, 'Local 388 Bis', 'La puerta 5', '{\"z\":18.863836364746,\"y\":-1728.2718505859,\"x\":-428.69546508789}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"z\":18.803836364746,\"y\":-1728.2718505859,\"x\":-428.69546508789}', '[]', NULL, 1, 1, 0, '{\"z\":104.75812866211,\"y\":370.71148681641,\"x\":246.72312927246}', 9253),
(74, 'Local 387 Bis 1', 'La puerta 3', '{\"z\":18.97916229248,\"y\":-1714.0845947266,\"x\":-499.00402832031}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"z\":18.91916229248,\"y\":-1714.0845947266,\"x\":-499.00402832031}', '[]', NULL, 1, 1, 0, '{\"z\":104.75812866211,\"y\":370.75234985352,\"x\":246.88012695313}', 10230),
(75, 'Local 387 Bis', 'La puerta 2', '{\"z\":18.972696380615,\"y\":-1638.0922851563,\"x\":-539.84027099609}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"z\":18.912696380615,\"y\":-1638.0922851563,\"x\":-539.84027099609}', '[]', NULL, 1, 1, 0, '{\"z\":104.75811340332,\"y\":370.69750976563,\"x\":246.58380126953}', 10260),
(76, 'Entrepot Puerta', 'La puerta', '{\"z\":17.954795913696,\"y\":-1605.4112548828,\"x\":-547.83752441406}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":17.894795913696,\"y\":-1605.4112548828,\"x\":-547.83752441406}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979965667725,\"y\":-3101.3732910156,\"x\":1101.6837158203}', 13250),
(77, 'Local 388', 'La puerta 4', '{\"z\":19.713815765381,\"y\":-1653.0720214844,\"x\":-595.00830078125}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"z\":19.653815765381,\"y\":-1653.0720214844,\"x\":-595.00830078125}', '[]', NULL, 1, 1, 0, '{\"z\":104.75811340332,\"y\":370.59002685547,\"x\":246.71829223633}', 9452),
(78, 'Appartement 386', 'La puerta 6', '{\"z\":32.090585784912,\"y\":-1623.3776855469,\"x\":-575.22784423828}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":32.030585784912,\"y\":-1623.3776855469,\"x\":-575.22784423828}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988659362793,\"y\":-999.42309570313,\"x\":265.89108276367}', 7260),
(79, 'Motel 386', 'La puerta 7', '{\"z\":32.09057434082,\"y\":-1620.2478027344,\"x\":-596.71942138672}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"z\":32.03057434082,\"y\":-1620.2478027344,\"x\":-596.71942138672}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"z\":-99.98,\"y\":-1001.2936401367,\"x\":151.79302978516}', 5230),
(80, 'Local 387', 'La puerta 1', '{\"z\":18.32507522583,\"y\":-1747.3659667969,\"x\":-512.02447509766}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"z\":18.26507522583,\"y\":-1747.3659667969,\"x\":-512.02447509766}', '[]', NULL, 1, 1, 0, '{\"z\":104.75812866211,\"y\":370.54745483398,\"x\":246.59384155273}', 10320),
(81, 'Entrepot Forum Drive 2', 'Forum Drive', '{\"z\":32.570135192871,\"y\":-1700.001953125,\"x\":-197.72647094727}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":32.510135192871,\"y\":-1700.001953125,\"x\":-197.72647094727}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979965667725,\"y\":-3101.6069335938,\"x\":1101.2991943359}', 9253),
(82, 'Appartement 109', 'Forum Drive 3', '{\"z\":35.246164398193,\"y\":-1688.494140625,\"x\":-146.8662109375}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":35.186164398193,\"y\":-1688.494140625,\"x\":-146.8662109375}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988659362793,\"y\":-999.33715820313,\"x\":265.77673339844}', 7562),
(83, 'Appartement 106', 'Forum Drive 8', '{\"z\":33.543214874268,\"y\":-1668.1680908203,\"x\":-212.24513244629}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":33.483214874268,\"y\":-1668.1680908203,\"x\":-212.24513244629}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988674621582,\"y\":-999.50994873047,\"x\":265.89556884766}', 6253),
(84, 'Appartement 107', 'Forum Drive 7', '{\"z\":33.108430938721,\"y\":-1638.7727050781,\"x\":-161.1505279541}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":33.048430938721,\"y\":-1638.7727050781,\"x\":-161.1505279541}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988674621582,\"y\":-999.44989013672,\"x\":265.89331054688}', 6320),
(85, 'Appartement 104', 'Forum Drive 9', '{\"z\":33.949323730469,\"y\":-1617.5184326172,\"x\":-223.08961486816}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":33.889323730469,\"y\":-1617.5184326172,\"x\":-223.08961486816}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988666992188,\"y\":-999.48846435547,\"x\":265.87609863281}', 6230),
(86, 'Maison 126', 'Forum Drive 4', '{\"z\":33.91137512207,\"y\":-1599.3853759766,\"x\":-140.35238647461}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"z\":33.85137512207,\"y\":-1599.3853759766,\"x\":-140.35238647461}', '[]', NULL, 1, 1, 0, '{\"z\":30.121528167725,\"y\":-1430.43359375,\"x\":-16.785911560059}', 7520),
(87, 'Appartement 108', 'Forum Drive 6', '{\"z\":33.439558105469,\"y\":-1539.4423828125,\"x\":-184.3740234375}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":33.379558105469,\"y\":-1539.4423828125,\"x\":-184.3740234375}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988666992188,\"y\":-999.29876708984,\"x\":265.89477539063}', 6420),
(88, 'Appartement 117', 'Forum Drive 11', '{\"z\":33.315233306885,\"y\":-1526.4807128906,\"x\":-69.263008117676}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":33.255233306885,\"y\":-1526.4807128906,\"x\":-69.263008117676}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988666992188,\"y\":-999.50823974609,\"x\":265.89602661133}', 6153),
(89, 'Maison 126 Bis', 'Forum Drive 1', '{\"z\":31.604925231934,\"y\":-1449.4520263672,\"x\":-64.509590148926}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"z\":31.544925231934,\"y\":-1449.4520263672,\"x\":-64.509590148926}', '[]', NULL, 1, 1, 0, '{\"z\":53.791499633789,\"y\":-1711.9340820313,\"x\":1272.4331054688}', 8652),
(90, 'Appartement 110', 'Forum Drive 5', '{\"z\":31.509622650146,\"y\":-1445.6201171875,\"x\":-45.497711181641}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":31.449622650146,\"y\":-1445.6201171875,\"x\":-45.497711181641}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988682250977,\"y\":-999.59466552734,\"x\":265.8916015625}', 6532),
(91, 'Appartement 127', 'Forum Drive 10', '{\"z\":30.971262054443,\"y\":-1446.4500732422,\"x\":-32.347537994385}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"z\":30.911262054443,\"y\":-1446.4500732422,\"x\":-32.347537994385}', '[]', NULL, 1, 1, 0, '{\"z\":-99.988666992188,\"y\":-999.47595214844,\"x\":265.89135742188}', 6213),
(92, 'Maison 126 Bis 1', 'Forum Drive 2', '{\"z\":30.181545333862,\"y\":-1441.8762207031,\"x\":-14.095552444458}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"z\":30.121545333862,\"y\":-1441.8762207031,\"x\":-14.095552444458}', '[]', NULL, 1, 1, 0, '{\"z\":30.121530075073,\"y\":-1430.3859863281,\"x\":-16.761280059814}', 8562),
(93, 'Entrepot Forum Drive', 'Forum Drive 12', '{\"z\":29.442089157104,\"y\":-1490.8262939453,\"x\":-24.897567749023}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":29.382089157104,\"y\":-1490.8262939453,\"x\":-24.897567749023}', '[]', NULL, 1, 1, 0, '{\"z\":-39.97995803833,\"y\":-3101.2805175781,\"x\":1101.3020019531}', 14250),
(94, 'Entrepot Forum Drive 1', 'Forum Drive 13', '{\"z\":28.400699691772,\"y\":-1389.3116455078,\"x\":-77.913040161133}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":28.340699691772,\"y\":-1389.3116455078,\"x\":-77.913040161133}', '[]', NULL, 1, 1, 0, '{\"z\":-39.97995803833,\"y\":-3101.2114257813,\"x\":1101.7526855469}', 13250),
(95, 'Maison 184', 'East Los Santos 9', '{\"x\":1403.9617919922,\"z\":59.042314605713,\"y\":-1496.3061523438}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"x\":1403.9617919922,\"z\":58.982314605713,\"y\":-1496.3061523438}', '[]', NULL, 1, 1, 0, '{\"x\":1969.6335449219,\"z\":32.448733825684,\"y\":3815.1564941406}', 4230),
(96, 'Maison 188', 'East Los Santos 5', '{\"x\":1379.2237548828,\"z\":57.512224273682,\"y\":-1514.8698730469}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"x\":1379.2237548828,\"z\":57.452224273682,\"y\":-1514.8698730469}', '[]', NULL, 1, 1, 0, '{\"x\":1272.4157714844,\"z\":53.791503448486,\"y\":-1711.9210205078}', 8452),
(97, 'Appartement 183 Bis', 'East Los Santos 3', '{\"x\":1360.5791015625,\"z\":55.423933105469,\"y\":-1556.3677978516}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":1360.5791015625,\"z\":55.363933105469,\"y\":-1556.3677978516}', '[]', NULL, 1, 1, 0, '{\"x\":-16.542568206787,\"z\":30.121522445679,\"y\":-1430.3128662109}', 8524),
(98, 'Maison 187', 'East Los Santos 4', '{\"x\":1315.8205566406,\"z\":50.887605743408,\"y\":-1526.4521484375}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":1315.8205566406,\"z\":50.827605743408,\"y\":-1526.4521484375}', '[]', NULL, 1, 1, 0, '{\"x\":-16.661851882935,\"z\":30.121522445679,\"y\":-1430.3220214844}', 8465),
(99, 'Appartement 180', 'East Los Santos 8', '{\"x\":1333.9691162109,\"z\":53.530927734375,\"y\":-1566.3247070313}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1333.9691162109,\"z\":53.470927734375,\"y\":-1566.3247070313}', '[]', NULL, 1, 1, 0, '{\"x\":265.89135742188,\"z\":-99.988682250977,\"y\":-999.42791748047}', 6452),
(100, 'Maison 185', 'East Los Santos 6', '{\"x\":1230.6612548828,\"z\":52.849504547119,\"y\":-1590.8193359375}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":1230.6612548828,\"z\":52.789504547119,\"y\":-1590.8193359375}', '[]', NULL, 1, 1, 0, '{\"x\":-16.801887512207,\"z\":30.121524353027,\"y\":-1430.3645019531}', 8452),
(101, 'Local 187', 'East Los Santos 1', '{\"x\":1214.544921875,\"z\":47.725988464355,\"y\":-1644.3162841797}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1214.544921875,\"z\":47.665988464355,\"y\":-1644.3162841797}', '[]', NULL, 1, 1, 0, '{\"x\":246.62821960449,\"z\":104.7581362915,\"y\":370.64559936523}', 11250),
(102, 'Local 186', 'East Los Santos', '{\"x\":1166.7386474609,\"z\":36.040884094238,\"y\":-1641.1744384766}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1166.7386474609,\"z\":35.980884094238,\"y\":-1641.1744384766}', '[]', NULL, 1, 1, 0, '{\"x\":246.63087463379,\"z\":104.75812103271,\"y\":370.57620239258}', 11320),
(103, 'Maison 186', 'East Los Santos 7', '{\"x\":1268.1198730469,\"z\":53.735017852783,\"y\":-1714.1275634766}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"x\":1268.1198730469,\"z\":53.675017852783,\"y\":-1714.1275634766}', '[]', NULL, 1, 1, 0, '{\"x\":1272.3171386719,\"z\":53.791499633789,\"y\":-1711.8500976563}', 8625),
(104, 'Local 188', 'East Los Santos 2', '{\"x\":1451.1838378906,\"z\":67.841543273926,\"y\":-1720.6943359375}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1451.1838378906,\"z\":67.781543273926,\"y\":-1720.6943359375}', '[]', NULL, 1, 1, 0, '{\"x\":246.7474822998,\"z\":104.75811340332,\"y\":370.63586425781}', 11230),
(105, 'Local 113', 'Groove Street 6', '{\"x\":104.99609375,\"z\":20.044328765869,\"y\":-1976.4978027344}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":104.99609375,\"z\":19.984328765869,\"y\":-1976.4978027344}', '[]', NULL, 1, 1, 0, '{\"x\":246.85299682617,\"z\":104.75811340332,\"y\":370.45950317383}', 11230),
(106, 'Appartement 110', 'Groove Street 2', '{\"x\":76.323905944824,\"z\":20.254203872681,\"y\":-1948.0860595703}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":76.323905944824,\"z\":20.194203872681,\"y\":-1948.0860595703}', '[]', NULL, 1, 1, 0, '{\"x\":265.89376831055,\"z\":-99.988689880371,\"y\":-999.38629150391}', 6423),
(107, 'Maison 112', 'Groove Street 4', '{\"x\":100.99647521973,\"z\":20.487495498657,\"y\":-1912.2326660156}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":100.99647521973,\"z\":20.427495498657,\"y\":-1912.2326660156}', '[]', NULL, 1, 1, 0, '{\"x\":-16.441707611084,\"z\":30.121526260376,\"y\":-1430.3093261719}', 8452),
(108, 'Appartement 122', 'Groove Street 1', '{\"x\":126.70726013184,\"z\":20.462438659668,\"y\":-1930.0201416016}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":126.70726013184,\"z\":20.402438659668,\"y\":-1930.0201416016}', '[]', NULL, 1, 1, 0, '{\"x\":265.92144775391,\"z\":-99.988666992188,\"y\":-999.42504882813}', 6423),
(109, 'Maison 123', 'Groove Street 5', '{\"x\":56.545192718506,\"z\":20.991424636841,\"y\":-1922.7585449219}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"x\":56.545192718506,\"z\":20.931424636841,\"y\":-1922.7585449219}', '[]', NULL, 1, 1, 0, '{\"x\":1272.1094970703,\"z\":53.791438598633,\"y\":-1711.9870605469}', 8952),
(110, 'Maison 111', 'Groove Street 3', '{\"x\":46.066207885742,\"z\":22.358303146362,\"y\":-1864.2321777344}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":46.066207885742,\"z\":22.298303146362,\"y\":-1864.2321777344}', '[]', NULL, 1, 1, 0, '{\"x\":-16.62154006958,\"z\":30.121531982422,\"y\":-1430.474609375}', 7562),
(111, 'Appartement 122 Bis', 'Groove Street', '{\"x\":-34.101593017578,\"z\":25.27352722168,\"y\":-1847.1116943359}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":-34.101593017578,\"z\":25.21352722168,\"y\":-1847.1116943359}', '[]', NULL, 1, 1, 0, '{\"x\":265.8928527832,\"z\":-99.988666992188,\"y\":-999.40106201172}', 6423),
(112, 'Appartement 147 Bis', 'Rancho 7', '{\"x\":341.87683105469,\"z\":20.022197799683,\"y\":-2064.1276855469}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":341.87683105469,\"z\":19.962197799683,\"y\":-2064.1276855469}', '[]', NULL, 1, 1, 0, '{\"x\":265.89205932617,\"z\":-99.988666992188,\"y\":-998.99652099609}', 8000),
(113, 'Appartement 139', 'Rancho 3', '{\"x\":332.97973632813,\"z\":20.016904907227,\"y\":-2056.9306640625}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":332.97973632813,\"z\":19.956904907227,\"y\":-2056.9306640625}', '[]', NULL, 1, 1, 0, '{\"x\":265.88967895508,\"z\":-99.988682250977,\"y\":-999.57006835938}', 8000),
(114, 'Local 140', 'Rancho 2', '{\"x\":313.43591308594,\"z\":20.015913085937,\"y\":-2040.5399169922}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":313.43591308594,\"z\":19.955913085937,\"y\":-2040.5399169922}', '[]', NULL, 1, 1, 0, '{\"x\":246.75019836426,\"z\":104.75812103271,\"y\":370.17687988281}', 11250),
(115, 'Appartement 147', 'Rancho 6', '{\"x\":357.81637573242,\"z\":20.823894577026,\"y\":-2073.4150390625}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":357.81637573242,\"z\":20.763894577026,\"y\":-2073.4150390625}', '[]', NULL, 1, 1, 0, '{\"x\":265.89654541016,\"z\":-99.988666992188,\"y\":-999.30914306641}', 8000),
(116, 'Appartement 139 Bis', 'Rancho 4', '{\"x\":365.12582397461,\"z\":20.824539260864,\"y\":-2064.6882324219}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":365.12582397461,\"z\":20.764539260864,\"y\":-2064.6882324219}', '[]', NULL, 1, 1, 0, '{\"x\":265.89019775391,\"z\":-99.988682250977,\"y\":-999.55084228516}', 8000),
(117, 'Appartement 139 Bis 1', 'Rancho 5', '{\"x\":372.3625793457,\"z\":20.824533538818,\"y\":-2056.0629882813}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":372.3625793457,\"z\":20.764533538818,\"y\":-2056.0629882813}', '[]', NULL, 1, 1, 0, '{\"x\":265.87780761719,\"z\":-99.988674621582,\"y\":-999.71038818359}', 8000),
(118, 'Local 146', 'Rancho', '{\"x\":335.54058837891,\"z\":21.393087463379,\"y\":-2010.8406982422}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":335.54058837891,\"z\":21.333087463379,\"y\":-2010.8406982422}', '[]', NULL, 1, 1, 0, '{\"x\":246.63125610352,\"z\":104.75811340332,\"y\":370.63192749023}', 11250),
(119, 'Entrepot 147', 'Rancho 8', '{\"x\":420.84942626953,\"z\":21.36205871582,\"y\":-2057.8608398438}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"x\":420.84942626953,\"z\":21.30205871582,\"y\":-2057.8608398438}', '[]', NULL, 1, 1, 0, '{\"x\":1101.5568847656,\"z\":-39.979965667725,\"y\":-3101.1801757813}', 15420),
(120, 'Motel 619', 'Red Desert', '{\"y\":-662.15008544922,\"z\":28.663036422729,\"x\":-1463.0209960938}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-662.15008544922,\"z\":28.603036422729,\"x\":-1463.0209960938}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.4731445313,\"z\":-99.980007629395,\"x\":151.79856872559}', 2450),
(121, 'Motel  619 Bis', 'Red Desert 1', '{\"y\":-661.63275146484,\"z\":28.102930145264,\"x\":-1495.2796630859}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-661.63275146484,\"z\":28.042930145264,\"x\":-1495.2796630859}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.4948120117,\"z\":-99.980022888184,\"x\":151.7947845459}', 2450),
(122, 'Motel 619 Bis 1', 'Red Desert 2', '{\"y\":-645.86309814453,\"z\":28.663065032959,\"x\":-1473.6260986328}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-645.86309814453,\"z\":28.603065032959,\"x\":-1473.6260986328}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.5512084961,\"z\":-99.98,\"x\":151.79602050781}', 2450),
(123, 'Motel 619 Bis 2', 'Red Desert 3', '{\"y\":-653.26361083984,\"z\":28.663150863647,\"x\":-1452.3594970703}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-653.26361083984,\"z\":28.603150863647,\"x\":-1452.3594970703}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.0034790039,\"z\":-99.980022888184,\"x\":151.80256652832}', 2450),
(124, 'Motel 619 Bis 3', 'Red Desert 4', '{\"y\":-642.96221923828,\"z\":32.461244659424,\"x\":-1469.5738525391}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-642.96221923828,\"z\":32.401244659424,\"x\":-1469.5738525391}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.3529663086,\"z\":-99.980015258789,\"x\":151.79365539551}', 2450),
(125, 'Motel 619 Bis 4', 'Red Desert 5', '{\"y\":-655.412109375,\"z\":32.461206512451,\"x\":-1486.7191162109}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-655.412109375,\"z\":32.401206512451,\"x\":-1486.7191162109}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.3432006836,\"z\":-99.980015258789,\"x\":151.79470825195}', 2450),
(126, 'Motel 620', 'Red Desert 6', '{\"y\":-668.16302490234,\"z\":32.461202697754,\"x\":-1493.7568359375}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-668.16302490234,\"z\":32.401202697754,\"x\":-1493.7568359375}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.4814453125,\"z\":-99.98,\"x\":151.79420471191}', 2450),
(127, 'Motel 620 Bis ', 'Red Desert 7', '{\"y\":-648.59783935547,\"z\":32.461233215332,\"x\":-1455.7236328125}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-648.59783935547,\"z\":32.401233215332,\"x\":-1455.7236328125}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.1791992188,\"z\":-99.980007629395,\"x\":151.79273986816}', 2450),
(128, 'Motel 620 Bis 1', 'Red Desert 8', '{\"y\":-659.33581542969,\"z\":32.461214141846,\"x\":-1459.1375732422}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-659.33581542969,\"z\":32.401214141846,\"x\":-1459.1375732422}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1000.7632446289,\"z\":-99.980015258789,\"x\":151.80302429199}', 2450),
(129, 'Motel 620 Bis 2', 'Red Desert 9', '{\"y\":-671.70989990234,\"z\":32.46122177124,\"x\":-1476.1759033203}', '{\"x\":151.3258,\"y\":-1007.7642,\"z\":-100.0000}', '{\"x\":151.45,\"y\":-1007.57,\"z\":-98.9999}', '{\"y\":-671.70989990234,\"z\":32.40122177124,\"x\":-1476.1759033203}', '[\"hei_hw1_blimp_interior_v_motel_mp_milo_\"]', NULL, 1, 1, 0, '{\"y\":-1001.4891967773,\"z\":-99.980007629395,\"x\":151.79383850098}', 2450),
(130, 'Entrepot 628', 'Red Desert 12', '{\"y\":-655.31414794922,\"z\":27.753393249512,\"x\":-1413.0819091797}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"y\":-655.31414794922,\"z\":27.693393249512,\"x\":-1413.0819091797}', '[]', NULL, 1, 1, 0, '{\"y\":-3101.4135742188,\"z\":-39.979961853027,\"x\":1101.4418945313}', 12500),
(131, 'Local 629', 'Red Desert 10', '{\"y\":-640.55389404297,\"z\":27.753387527466,\"x\":-1422.1719970703}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-640.55389404297,\"z\":27.693387527466,\"x\":-1422.1719970703}', '[]', NULL, 1, 1, 0, '{\"y\":370.6647644043,\"z\":104.75812866211,\"x\":246.20581054688}', 9562),
(132, 'Local 628', 'Red Desert 11', '{\"y\":-640.26440429688,\"z\":27.753379898071,\"x\":-1392.412109375}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-640.26440429688,\"z\":27.693379898071,\"x\":-1392.412109375}', '[]', NULL, 1, 1, 0, '{\"y\":370.69189453125,\"z\":104.75812103271,\"x\":246.76774597168}', 9562),
(133, 'Local 628 Bis', 'Red Desert 13', '{\"y\":-647.21350097656,\"z\":27.773876266479,\"x\":-1367.9962158203}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-647.21350097656,\"z\":27.713876266479,\"x\":-1367.9962158203}', '[]', NULL, 1, 1, 0, '{\"y\":370.75076293945,\"z\":104.75812866211,\"x\":246.68701171875}', 9250),
(135, 'Trevor Stab 1', 'Stab City 2', '{\"y\":3688.8913574219,\"z\":39.285989837646,\"x\":15.388403892517}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3688.8913574219,\"z\":39.225989837646,\"x\":15.388403892517}', '[]', NULL, 1, 1, 0, '{\"y\":3814.7885742188,\"z\":32.448737640381,\"x\":1969.6632080078}', 3520),
(136, 'Trevor Stab 2', 'Stab City 3', '{\"y\":3682.404296875,\"z\":38.815279083252,\"x\":97.853355407715}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3682.404296875,\"z\":38.755279083252,\"x\":97.853355407715}', '[]', NULL, 1, 1, 0, '{\"y\":3815.2575683594,\"z\":32.448741455078,\"x\":1969.7585449219}', 3560),
(137, 'Trevor Stab 3', 'Stab City 4', '{\"y\":3728.4729003906,\"z\":39.550180511475,\"x\":105.75475311279}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3728.4729003906,\"z\":39.490180511475,\"x\":105.75475311279}', '[]', NULL, 1, 1, 0, '{\"y\":3815.2690429688,\"z\":32.448741455078,\"x\":1969.8961181641}', 3560),
(138, 'Trevor Stab 4', 'Stab City 5', '{\"y\":3732.6791992188,\"z\":39.35433013916,\"x\":78.161666870117}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3732.6791992188,\"z\":39.29433013916,\"x\":78.161666870117}', '[]', NULL, 1, 1, 0, '{\"y\":3815.3996582031,\"z\":32.448737640381,\"x\":1969.8343505859}', 3560),
(139, 'Trevor Stab 5', 'Stab City 6', '{\"y\":3742.1545410156,\"z\":39.37541015625,\"x\":52.129844665527}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3742.1545410156,\"z\":39.31541015625,\"x\":52.129844665527}', '[]', NULL, 1, 1, 0, '{\"y\":3815.4575195313,\"z\":32.448741455078,\"x\":1969.7655029297}', 3560),
(140, 'Trevor Stab 6', 'Stab City 7', '{\"y\":3736.0007324219,\"z\":39.710321502686,\"x\":31.128244400024}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3736.0007324219,\"z\":39.650321502686,\"x\":31.128244400024}', '[]', NULL, 1, 1, 0, '{\"y\":3815.5637207031,\"z\":32.448745269775,\"x\":1969.8952636719}', 3560),
(141, 'Trevor Stab 7', 'Stab City 8', '{\"y\":3702.0063476563,\"z\":39.805605010986,\"x\":47.743381500244}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3702.0063476563,\"z\":39.745605010986,\"x\":47.743381500244}', '[]', NULL, 1, 1, 0, '{\"y\":3815.3911132813,\"z\":32.448737640381,\"x\":1969.6540527344}', 3560),
(142, 'Trevor Stab 8', 'Stab City 9', '{\"y\":3693.1457519531,\"z\":39.72525604248,\"x\":68.024314880371}', '{\"x\":1973.0,\"y\":3816.44,\"z\":32.49}', '{\"x\":1973.44,\"y\":3818.64,\"z\":33.44}', '{\"y\":3693.1457519531,\"z\":39.66525604248,\"x\":68.024314880371}', '[]', NULL, 1, 1, 0, '{\"y\":3815.4418945313,\"z\":32.448737640381,\"x\":1969.8686523438}', 3560),
(144, 'Local Stab 9', 'Stab City 10', '{\"x\":13.619840621948,\"y\":3724.6455078125,\"z\":38.766122894287}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":13.619840621948,\"y\":3724.6455078125,\"z\":38.706122894287}', '[]', NULL, 1, 1, 0, '{\"x\":246.72682189941,\"y\":370.4889831543,\"z\":104.75809814453}', 8560),
(145, 'Madrazo 1', 'Entrepôt Madrazo', '{\"y\":1137.9647216797,\"x\":1441.2458496094,\"z\":113.40643890381}', '{\"x\":1104.6102,\"y\":-3099.4333,\"z\":-39.9999}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"y\":1137.9647216797,\"x\":1441.2458496094,\"z\":113.34643890381}', '[]', NULL, 1, 1, 0, '{\"y\":-3101.3684082031,\"x\":1101.3059082031,\"z\":-39.979977111816}', 9750),
(146, 'Local Madrazo 1', 'Local Madrazo', '{\"y\":1114.580078125,\"x\":1401.4802246094,\"z\":113.91776092529}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":1114.580078125,\"x\":1401.4802246094,\"z\":113.85776092529}', '[]', NULL, 1, 1, 0, '{\"y\":370.55422973633,\"x\":246.63374328613,\"z\":104.75812103271}', 8750),
(149, 'Local Alamo Sea', 'Local Alamo Sea', '{\"z\":32.899786071777,\"y\":3554.8330078125,\"x\":909.78015136719}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-39.99}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-38.9999}', '{\"z\":32.839786071777,\"y\":3554.8330078125,\"x\":909.78015136719}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979980926514,\"y\":-3102.3129882813,\"x\":1067.3972167969}', 23250),
(150, 'Local Alamo Seaa', 'Local Alamo Sea 1', '{\"z\":32.4976902771,\"y\":3586.5578613281,\"x\":905.80212402344}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-39.99}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-38.9999}', '{\"z\":32.4376902771,\"y\":3586.5578613281,\"x\":905.80212402344}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979977111816,\"y\":-3102.3898925781,\"x\":1067.5223388672}', 23250),
(151, 'Entrepot sandy', 'Local Sandy 1', '{\"z\":34.092153625488,\"y\":3623.8452148438,\"x\":1395.3203125}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-39.99}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":34.032153625488,\"y\":3623.8452148438,\"x\":1395.3203125}', '[]', NULL, 1, 1, 0, '{\"z\":-39.990053405762,\"y\":-3101.5600585938,\"x\":1100.3074951172}', 18250),
(152, 'Entrepot sandy 2', 'Local Sandy 2', '{\"z\":33.491109924316,\"y\":3696.3859863281,\"x\":1724.6160888672}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-39.99}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":33.431109924316,\"y\":3696.3859863281,\"x\":1724.6160888672}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979977111816,\"y\":-3101.4426269531,\"x\":1101.5012207031}', 18250),
(153, 'Entrepot sandy 3', 'Local Sandy 3', '{\"z\":34.585142211914,\"y\":3842.4465332031,\"x\":1941.6682128906}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-39.99}', '{\"x\":1088.1834,\"y\":-3099.3547,\"z\":-38.9999}', '{\"z\":34.525142211914,\"y\":3842.4465332031,\"x\":1941.6682128906}', '[]', NULL, 1, 1, 0, '{\"z\":-39.979969482422,\"y\":-3101.0681152344,\"x\":1101.4014892578}', 18250),
(154, 'El Burro 1', 'El Burro', '{\"x\":1382.3508300781,\"y\":-1544.3074951172,\"z\":56.188646392822}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1382.3508300781,\"y\":-1544.3074951172,\"z\":56.128646392822}', '[]', NULL, 1, 1, 0, '{\"x\":265.86895751953,\"y\":-999.78875732422,\"z\":-99.988682250977}', 8000),
(155, 'El Burro 2', 'El Burro 1', '{\"x\":1342.3405761719,\"y\":-1526.6773681641,\"z\":53.661623077393}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"x\":1342.3405761719,\"y\":-1526.6773681641,\"z\":53.601623077393}', '[]', NULL, 1, 1, 0, '{\"x\":1272.1148681641,\"y\":-1711.9997558594,\"z\":53.791430969238}', 9500),
(156, 'El Burro 3', 'El Burro 2', '{\"x\":1323.259765625,\"y\":-1559.4466552734,\"z\":50.536741333008}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1323.259765625,\"y\":-1559.4466552734,\"z\":50.476741333008}', '[]', NULL, 1, 1, 0, '{\"x\":246.62261962891,\"y\":370.72546386719,\"z\":104.75811340332}', 10250),
(157, 'El Burro 4', 'El Burro 3', '{\"x\":1261.5693359375,\"y\":-1616.8872070313,\"z\":53.822881774902}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1261.5693359375,\"y\":-1616.8872070313,\"z\":53.762881774902}', '[]', NULL, 1, 1, 0, '{\"x\":265.89178466797,\"y\":-999.61053466797,\"z\":-99.988682250977}', 8000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(158, 'El Burro 5', 'El Burro 4', '{\"x\":1245.3034667969,\"y\":-1626.7596435547,\"z\":52.3625050354}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1245.3034667969,\"y\":-1626.7596435547,\"z\":52.3025050354}', '[]', NULL, 1, 1, 0, '{\"x\":265.89508056641,\"y\":-999.50244140625,\"z\":-99.988682250977}', 8000),
(159, 'El Burro 6', 'El Burro 5', '{\"x\":1210.3366699219,\"y\":-1606.6003417969,\"z\":49.816740112305}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"x\":1210.3366699219,\"y\":-1606.6003417969,\"z\":49.756740112305}', '[]', NULL, 1, 1, 0, '{\"x\":1272.6879882813,\"y\":-1711.8078613281,\"z\":53.791530151367}', 9500),
(160, 'El Burro 7', 'El Burro 6', '{\"x\":1193.4749755859,\"y\":-1622.2635498047,\"z\":44.30151184082}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1193.4749755859,\"y\":-1622.2635498047,\"z\":44.24151184082}', '[]', NULL, 1, 1, 0, '{\"x\":265.89343261719,\"y\":-999.61889648438,\"z\":-99.98853729248}', 8000),
(161, 'El Burro 8', 'El Burro 7', '{\"x\":1193.4639892578,\"y\":-1656.4295654297,\"z\":42.106924133301}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1193.4639892578,\"y\":-1656.4295654297,\"z\":42.046924133301}', '[]', NULL, 1, 1, 0, '{\"x\":265.85946655273,\"y\":-999.65161132813,\"z\":-99.988689880371}', 8000),
(162, 'El Burro 9', 'El Burro 8', '{\"x\":1141.3310546875,\"y\":-1657.3865966797,\"z\":35.493539886475}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1141.3310546875,\"y\":-1657.3865966797,\"z\":35.433539886475}', '[]', NULL, 1, 1, 0, '{\"x\":246.75820922852,\"y\":370.48727416992,\"z\":104.75812103271}', 11250),
(163, 'El Burro 10', 'El Burro 9', '{\"x\":1365.5015869141,\"y\":-1721.7891845703,\"z\":64.714078979492}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1365.5015869141,\"y\":-1721.7891845703,\"z\":64.654078979492}', '[]', NULL, 1, 1, 0, '{\"x\":265.80801391602,\"y\":-999.57159423828,\"z\":-99.988689880371}', 8000),
(164, 'El Burro 11', 'El Burro 10', '{\"x\":1354.9061279297,\"y\":-1690.5374755859,\"z\":59.571241455078}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":1354.9061279297,\"y\":-1690.5374755859,\"z\":59.511241455078}', '[]', NULL, 1, 1, 0, '{\"x\":265.89013671875,\"y\":-999.361328125,\"z\":-99.988712768555}', 8000),
(165, 'El Burro 12', 'El Burro 11', '{\"x\":1297.3684082031,\"y\":-1618.8221435547,\"z\":53.308393554687}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":1297.3684082031,\"y\":-1618.8221435547,\"z\":53.248393554688}', '[]', NULL, 1, 1, 0, '{\"x\":246.2940826416,\"y\":370.61047363281,\"z\":104.75810577393}', 11250),
(166, 'RanchoHa', 'RanchoH', '{\"x\":368.54244995117,\"z\":24.258541183472,\"y\":-1896.0264892578}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":368.54244995117,\"z\":24.198541183472,\"y\":-1896.0264892578}', '[]', NULL, 1, 1, 0, '{\"x\":265.8948059082,\"z\":-99.988598327637,\"y\":-999.71252441406}', 8000),
(167, 'RanchoHa 1', 'RanchoH 1', '{\"x\":385.36019897461,\"z\":25.109685974121,\"y\":-1881.6850585938}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":385.36019897461,\"z\":25.049685974121,\"y\":-1881.6850585938}', '[]', NULL, 1, 1, 0, '{\"x\":-16.714876174927,\"z\":30.121552963257,\"y\":-1430.3018798828}', 9500),
(168, 'RanchoHa 2', 'RanchoH 2', '{\"x\":399.32373046875,\"z\":25.796344833374,\"y\":-1864.9876708984}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":399.32373046875,\"z\":25.736344833374,\"y\":-1864.9876708984}', '[]', NULL, 1, 1, 0, '{\"x\":265.8935546875,\"z\":-99.988689880371,\"y\":-999.62414550781}', 8000),
(169, 'RanchoHa 3', 'RanchoH 3', '{\"x\":412.41610717773,\"z\":26.403127746582,\"y\":-1856.3266601563}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":412.41610717773,\"z\":26.343127746582,\"y\":-1856.3266601563}', '[]', NULL, 1, 1, 0, '{\"x\":265.89379882813,\"z\":-99.988689880371,\"y\":-999.46520996094}', 8000),
(170, 'RanchoHa 4', 'RanchoH 4', '{\"x\":427.24508666992,\"z\":27.543436126709,\"y\":-1842.1716308594}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"x\":427.24508666992,\"z\":27.483436126709,\"y\":-1842.1716308594}', '[]', NULL, 1, 1, 0, '{\"x\":265.88977050781,\"z\":-99.988682250977,\"y\":-999.55255126953}', 8000),
(171, 'RanchoHa 5', 'RanchoH 5', '{\"x\":424.33065795898,\"z\":27.424846725464,\"y\":-1819.7513427734}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":424.33065795898,\"z\":27.364846725464,\"y\":-1819.7513427734}', '[]', NULL, 1, 1, 0, '{\"x\":246.72174072266,\"z\":104.75811340332,\"y\":370.70843505859}', 11250),
(172, 'RanchoHa 6', 'RanchoH 6', '{\"x\":429.33865356445,\"z\":27.438432769775,\"y\":-1820.1174316406}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"x\":429.33865356445,\"z\":27.378432769775,\"y\":-1820.1174316406}', '[]', NULL, 1, 1, 0, '{\"x\":-16.803634643555,\"z\":30.121522445679,\"y\":-1430.4276123047}', 9500),
(173, 'RanchoHa 7', 'RanchoH 7', '{\"x\":435.00692749023,\"z\":25.013259963989,\"y\":-1906.8039550781}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"x\":435.00692749023,\"z\":24.953259963989,\"y\":-1906.8039550781}', '[]', NULL, 1, 1, 0, '{\"x\":246.48503112793,\"z\":104.75810577393,\"y\":370.63748168945}', 11250),
(174, 'RanchoHa 8', 'RanchoH 8', '{\"x\":460.09368896484,\"z\":26.062015609741,\"y\":-1869.7735595703}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-39.99}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-38.9999}', '{\"x\":460.09368896484,\"z\":26.002015609741,\"y\":-1869.7735595703}', '[]', NULL, 1, 1, 0, '{\"x\":1068.1126708984,\"z\":-39.979973297119,\"y\":-3102.6882324219}', 15250),
(175, 'Ranchobis 9', 'Rancho 9', '{\"y\":-1937.2801513672,\"x\":324.21835327148,\"z\":24.098970489502}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-1937.2801513672,\"x\":324.21835327148,\"z\":24.038970489502}', '[]', NULL, 1, 1, 0, '{\"y\":-999.83581542969,\"x\":265.88397216797,\"z\":-99.988712768555}', 8000),
(176, 'Ranchobis 10', 'Rancho 10', '{\"y\":-1956.2110595703,\"x\":311.88317871094,\"z\":23.696748809814}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-1956.2110595703,\"x\":311.88317871094,\"z\":23.636748809814}', '[]', NULL, 1, 1, 0, '{\"y\":-999.68432617188,\"x\":265.82974243164,\"z\":-99.988689880371}', 8000),
(177, 'Ranchobis 11', 'Rancho 11', '{\"y\":-1971.8983154297,\"x\":295.72229003906,\"z\":21.98069770813}', '{\"x\":-14.52,\"y\":-1427.48,\"z\":30.20}', '{\"x\":-14.4,\"y\":-1429.44,\"z\":31.12}', '{\"y\":-1971.8983154297,\"x\":295.72229003906,\"z\":21.92069770813}', '[]', NULL, 1, 1, 0, '{\"y\":-1430.3547363281,\"x\":-16.535919189453,\"z\":30.121522445679}', 9500),
(178, 'Ranchobis 12', 'Rancho 12', '{\"y\":-1980.2376708984,\"x\":291.61392211914,\"z\":20.680519180298}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-1980.2376708984,\"x\":291.61392211914,\"z\":20.620519180298}', '[]', NULL, 1, 1, 0, '{\"y\":-999.47344970703,\"x\":265.89422607422,\"z\":-99.988682250977}', 8000),
(179, 'Ranchobis 13', 'Rancho 13', '{\"y\":-1993.966796875,\"x\":279.6240234375,\"z\":19.884225921631}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-1993.966796875,\"x\":279.6240234375,\"z\":19.824225921631}', '[]', NULL, 1, 1, 0, '{\"y\":-999.27856445313,\"x\":265.89495849609,\"z\":-99.988682250977}', 8000),
(180, 'Ranchobis 14', 'Rancho 14', '{\"y\":-1997.7301025391,\"x\":278.66818237305,\"z\":19.331148223877}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-1997.7301025391,\"x\":278.66818237305,\"z\":19.271148223877}', '[]', NULL, 1, 1, 0, '{\"y\":370.62847900391,\"x\":246.54476928711,\"z\":104.75810577393}', 11250),
(181, 'Ranchobis 15', 'Rancho 15', '{\"y\":-1979.3529052734,\"x\":267.75350952148,\"z\":20.546503143311}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-1979.3529052734,\"x\":267.75350952148,\"z\":20.486503143311}', '[]', NULL, 1, 1, 0, '{\"y\":370.74444580078,\"x\":246.95303344727,\"z\":104.75811340332}', 11250),
(182, 'Ranchobis 16', 'Rancho 16', '{\"y\":-2006.2373046875,\"x\":250.26719665527,\"z\":19.28874786377}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-2006.2373046875,\"x\":250.26719665527,\"z\":19.22874786377}', '[]', NULL, 1, 1, 0, '{\"y\":370.75604248047,\"x\":246.78755187988,\"z\":104.75811340332}', 11250),
(183, 'Ranchobis 17', 'Rancho 17', '{\"y\":-2023.3834228516,\"x\":256.44705200195,\"z\":18.346683578491}', '{\"x\":1269.12,\"y\":-1711.16,\"z\":53.84}', '{\"x\":1269.96,\"y\":-1709.76,\"z\":54.76}', '{\"y\":-2023.3834228516,\"x\":256.44705200195,\"z\":18.286683578491}', '[]', NULL, 1, 1, 0, '{\"y\":-1712.0716552734,\"x\":1272.0899658203,\"z\":53.791503448486}', 10250),
(184, 'Ranchobis 18', 'Rancho 18', '{\"y\":-2023.0675048828,\"x\":233.70184326172,\"z\":18.143711166382}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-2023.0675048828,\"x\":233.70184326172,\"z\":18.083711166382}', '[]', NULL, 1, 1, 0, '{\"y\":370.78912353516,\"x\":246.97113037109,\"z\":104.75811340332}', 11250),
(185, 'Ranchobis 19', 'Rancho 19', '{\"y\":-2042.7768554688,\"x\":241.94937133789,\"z\":17.092683868408}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-2042.7768554688,\"x\":241.94937133789,\"z\":17.032683868408}', '[]', NULL, 1, 1, 0, '{\"y\":370.75827026367,\"x\":246.66253662109,\"z\":104.75809814453}', 11250),
(186, 'Ranchobis 20', 'Rancho 20', '{\"y\":-2046.2817382813,\"x\":236.03381347656,\"z\":17.459985809326}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-2046.2817382813,\"x\":236.03381347656,\"z\":17.399985809326}', '[]', NULL, 1, 1, 0, '{\"y\":-999.10406494141,\"x\":265.89135742188,\"z\":-99.988689880371}', 10250),
(187, 'Ranchobis 21', 'Rancho 21', '{\"y\":-2033.3034667969,\"x\":221.16465759277,\"z\":17.087740020752}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-2033.3034667969,\"x\":221.16465759277,\"z\":17.027740020752}', '[]', NULL, 1, 1, 0, '{\"y\":370.53805541992,\"x\":246.58963012695,\"z\":104.75810577393}', 11250),
(188, 'Ranchobis 22', 'Rancho 22', '{\"y\":-1989.5874023438,\"x\":210.30268859863,\"z\":18.79647644043}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-39.99}', '{\"x\":1048.5067,\"y\":-3097.0817,\"z\":-38.9999}', '{\"y\":-1989.5874023438,\"x\":210.30268859863,\"z\":18.73647644043}', '[]', NULL, 1, 1, 0, '{\"y\":-3102.3193359375,\"x\":1067.5920410156,\"z\":-39.979980926514}', 20250),
(189, 'Ranchobis 23', 'Rancho 23', '{\"y\":-2043.4489746094,\"x\":317.03329467773,\"z\":20.016923980713}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-2043.4489746094,\"x\":317.03329467773,\"z\":19.956923980713}', '[]', NULL, 1, 1, 0, '{\"y\":-999.77844238281,\"x\":265.89517211914,\"z\":-99.988689880371}', 8000),
(190, 'Ranchobis 24', 'Rancho 24', '{\"y\":-2050.9777832031,\"x\":325.66375732422,\"z\":20.017105178833}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-2050.9777832031,\"x\":325.66375732422,\"z\":19.957105178833}', '[]', NULL, 1, 1, 0, '{\"y\":-999.775390625,\"x\":265.89135742188,\"z\":-99.988682250977}', 8000),
(191, 'Ranchobis 25', 'Rancho 25', '{\"y\":-2049.73828125,\"x\":324.18713378906,\"z\":20.017097549438}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-2049.73828125,\"x\":324.18713378906,\"z\":19.957097549438}', '[]', NULL, 1, 1, 0, '{\"y\":-999.35516357422,\"x\":265.89688110352,\"z\":-99.988682250977}', 8000),
(192, 'Ranchobis 26', 'Rancho 26', '{\"y\":-2058.1538085938,\"x\":334.38177490234,\"z\":20.016965942383}', '{\"x\":266.0773,\"y\":-1007.3900,\"z\":-102.006}', '{\"x\":265.307,\"y\":-1002.802,\"z\":-99.50}', '{\"y\":-2058.1538085938,\"x\":334.38177490234,\"z\":19.956965942383}', '[]', NULL, 1, 1, 0, '{\"y\":-999.85485839844,\"x\":265.85565185547,\"z\":-99.988682250977}', 8000),
(193, 'Ranchobis 27', 'Rancho 27', '{\"y\":-2067.4521484375,\"x\":345.32528686523,\"z\":20.021003799438}', '{\"x\":244.64,\"y\":374.56,\"z\":104.80}', '{\"x\":244.52,\"y\":372.24,\"z\":105.72}', '{\"y\":-2067.4521484375,\"x\":345.32528686523,\"z\":19.961003799438}', '[]', NULL, 1, 1, 0, '{\"y\":371.00357055664,\"x\":247.05145263672,\"z\":104.75810577393}', 11250);

-- --------------------------------------------------------

--
-- Structure de la table `properties_inventory`
--

CREATE TABLE `properties_inventory` (
  `id` int(11) NOT NULL,
  `propertie_id` int(11) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isweapon` int(255) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `label_weapon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `rented_bikes`
--

CREATE TABLE `rented_bikes` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `rented_boats`
--

CREATE TABLE `rented_boats` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `savedobjects`
--

CREATE TABLE `savedobjects` (
  `pos` longtext DEFAULT NULL,
  `rot` longtext DEFAULT NULL,
  `model` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sim`
--

CREATE TABLE `sim` (
  `identifier` varchar(50) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sim`
--

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `trucks`
--

CREATE TABLE `trucks` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `trucks`
--

INSERT INTO `trucks` (`name`, `model`, `price`, `category`) VALUES
('Burrito', 'burrito3', 40000, 'fourgonnette'),
('Camping Car Moderne', 'camper', 39500, 'voyage'),
('Burrito Spoiler', 'gburrito', 28200, 'fourgonnette'),
('Burrito Spoiler 2', 'gburrito2', 29350, 'fourgonnette'),
('Camping Car Modeste', 'journey', 22030, 'voyage'),
('Paradise', 'paradise', 27600, 'fourgonnette'),
('Rumpo', 'rumpo', 27600, 'fourgonnette'),
('Rumpo 2', 'rumpo2', 22030, 'fourgonnette'),
('Rumpo 3', 'rumpo3', 30000, 'fourgonnette'),
('Speedo', 'speedo', 23150, 'fourgonnette'),
('Speedo 2', 'speedo2', 39500, 'fourgonnette'),
('Speedo 3', 'speedo3', 23150, 'fourgonnette'),
('Surfer Nouveau', 'surfer', 22030, 'voyage'),
('Surfer Ancien', 'surfer2', 19830, 'voyage'),
('Youga', 'youga', 22030, 'fourgonnette'),
('Youga Retro', 'youga2', 27600, 'fourgonnette');

-- --------------------------------------------------------

--
-- Structure de la table `truck_categories`
--

CREATE TABLE `truck_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `truck_categories`
--

INSERT INTO `truck_categories` (`name`, `label`) VALUES
('fourgonnette', 'Fourgonettes'),
('voyage', 'Voyage');

-- --------------------------------------------------------

--
-- Structure de la table `truck_inventory`
--

CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `itemt` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `trunk_inventory`
--


-- --------------------------------------------------------

--
-- Structure de la table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`, `identifier`) VALUES
(1624, 'Matt Nelson', '0', NULL, 'steam:110000113f169df'),
(1625, 'troma8502', '0', NULL, 'steam:1100001090136bc');

-- --------------------------------------------------------

--
-- Structure de la table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `twitter_tweets`
--

INSERT INTO `twitter_tweets` (`id`, `authorId`, `realUser`, `message`, `image`, `time`, `likes`) VALUES
(10712, 1625, 'steam:1100001090136bc', 'yo yo yo on est lààà #LosSantos', '', '2020-09-25 16:13:45', 0),
(10713, 1624, 'steam:110000113f169df', '@troma8502 cc {{{laughing}}}', 'https://www.numerama.com/content/uploads/2019/05/creative-commons-1024x512.png', '2020-09-25 16:14:28', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL,
  `license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `org` varchar(50) DEFAULT 'organisation',
  `org_gradeorg` int(11) DEFAULT 0,
  `faction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'resid',
  `faction_grade` int(11) DEFAULT 0,
  `loadout` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `tattoos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pet` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `armour` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `health` tinyint(3) UNSIGNED NOT NULL DEFAULT 200,
  `last_house` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--
-- --------------------------------------------------------

--
-- Structure de la table `user_accessories`
--

CREATE TABLE `user_accessories` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mask` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT 'Masque',
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `user_accounts`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_convictions`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` int(11) NOT NULL,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user_hangard`
--

CREATE TABLE `user_hangard` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `user_inventory`

-- --------------------------------------------------------

--
-- Structure de la table `user_lastcharacter`
--

CREATE TABLE `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `user_licenses`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_mdt`
--

CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_mdt`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT '{}',
  `humor` varchar(60) COLLATE utf8mb4_bin DEFAULT '{}',
  `demarche` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `pav7` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}',
  `pav8` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}',
  `pav9` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_sim`
--

CREATE TABLE `user_sim` (
  `id` int(11) NOT NULL,
  `identifier` varchar(555) NOT NULL,
  `number` varchar(555) NOT NULL,
  `label` varchar(555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user_tenue`
--

CREATE TABLE `user_tenue` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tenue` longtext COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 190000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 40000, 'sports'),
('Ardent', 'ardent', 100000, 'sportsclassics'),
('Asea', 'asea', 4050, 'berlines'),
('Asterope', 'asterope', 4950, 'berlines'),
('Autarch', 'autarch', 200000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller', 25000, 'suv'),
('Baller 2', 'baller2', 35000, 'suv'),
('Baller Sport', 'baller3', 40000, 'suv'),
('Banshee', 'banshee', 50000, 'sports'),
('Bashee', 'banshee2', 170000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 65400, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bfinjection', 'bfinjection', 12120, 'muscles'),
('Bison', 'bison', 12000, 'vans'),
('BeeJay XL', 'bjxl', 15000, 'suv'),
('Blade', 'blade', 9000, 'muscles'),
('blazer4', 'blazer4', 10000, 'motorcycles'),
('Blista', 'blista', 3450, 'compacts'),
('Blista 2', 'blista2', 6290, 'sports'),
('Blista 3', 'blista3', 6860, 'sports'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobctaxl', 15000, 'vans'),
('Bodhi', 'bodhi2', 12000, 'suv'),
('Brioso', 'brioso', 3000, 'compacts'),
('Buccaneer', 'buccaneer', 12000, 'muscles'),
('Buccaneer ', 'buccaneer2', 17000, 'muscles'),
('Buffalo', 'buffalo', 30000, 'sports'),
('Buffalo Sport', 'buffalo2', 40000, 'sports'),
('Carbonizzare', 'carbonizzare', 50000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 100000, 'sportsclassics'),
('Cavalcade', 'cavalcade', 20000, 'suv'),
('Cavalcade V2', 'cavalcade2', 25000, 'suv'),
('Cheburek', 'cheburek', 14260, 'compacts'),
('Cheetah', 'cheetah2', 200000, 'sportsclassics'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 16520, 'muscles'),
('Chino Custom', 'chino2', 11000, 'muscles'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Clique', 'clique', 9000, 'compacts'),
('Cognoscenti ', 'cogcabrio', 18000, 'coupes'),
('Cognoscenti', 'cognoscenti', 20000, 'berlines'),
('Comet', 'comet2', 108000, 'sports'),
('Comet Retro', 'comet3', 110000, 'sports'),
('Comet ', 'comet4', 115000, 'sports'),
('Contender', 'contender', 90000, 'suv'),
('Coquette', 'coquette', 70000, 'sports'),
('Coquette', 'coquette2', 90000, 'sportsclassics'),
('Coquette ', 'coquette3', 100000, 'muscles'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 160000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deviant', 'deviant', 20000, 'muscles'),
('Dilettante', 'dilettante', 3850, 'compacts'),
('D Loader', 'dloader', 7260, 'muscles'),
('Dominator', 'dominator', 27600, 'muscles'),
('Dominator 2', 'dominator2', 31200, 'muscles'),
('Dominato', 'dominator3', 55000, 'muscles'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 30000, 'suv'),
('Dubsta Luxury', 'dubsta2', 41900, 'suv'),
('Dubsta 6x6', 'dubsta3', 121000, 'suv'),
('Dukes', 'dukes', 18730, 'muscles'),
('Elegy Retro', 'elegy', 95000, 'sports'),
('Elegy', 'elegy2', 83890, 'sports'),
('Emperor', 'emperor', 4050, 'berlines'),
('Emperor V2', 'emperor2', 3650, 'berlines'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 95500, 'coupes'),
('F620', 'f620', 59500, 'coupes'),
('Faction', 'faction', 14260, 'muscles'),
('Faction ', 'faction2', 18190, 'muscles'),
('Faction Custom 3', 'faction3', 20930, 'muscles'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 27600, 'coupes'),
('Felon 2', 'felon2', 31200, 'sports'),
('Felon GT', 'felongt', 31200, 'coupes'),
('Feltzer', 'feltzer2', 102500, 'sports'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FQ 2', 'fq2', 34750, 'suv'),
('Fugitive', 'fugitive', 18730, 'berlines'),
('Furore GT', 'furoregt', 95000, 'sports'),
('Fusilade', 'fusilade', 30000, 'sports'),
('Futo', 'futo', 7260, 'compacts'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 20000, 'muscles'),
('Gauntlet 2', 'gauntlet2', 23000, 'muscles'),
('GBurrito', 'gburrito', 17000, 'suv'),
('GBurrito 2', 'gburrito2', 20000, 'suv'),
('Glendale', 'glendale', 4050, 'berlines'),
('GP1', 'gp1', 175000, 'super'),
('Granger', 'granger', 20000, 'suv'),
('Gresley', 'gresley', 16000, 'suv'),
('GT500', 'gt500', 150000, 'sportsclassics'),
('Habanero', 'habanero', 12000, 'suv'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 16000, 'muscles'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Huntley', 'huntley', 20000, 'suv'),
('Hustler', 'hustler', 11000, 'coupes'),
('Impaler', 'impaler', 12000, 'muscles'),
('Infernus', 'infernus', 120000, 'super'),
('Ingot', 'ingot', 5250, 'berlines'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 6860, 'berlines'),
('Issi ', 'issi2', 4450, 'compacts'),
('Issi Classique', 'issi3', 5000, 'compacts'),
('Itali GTO', 'italigto', 130000, 'sports'),
('Jackal', 'jackal', 15000, 'coupes'),
('Jester', 'jester', 115000, 'sports'),
('Jester 2', 'jester2', 108000, 'sports'),
('Jester 3', 'jester3', 170600, 'sports'),
('Journey', 'journey', 22030, 'muscles'),
('Kamacho', 'kamacho', 60500, 'suv'),
('Khamelion', 'khamelion', 96000, 'sports'),
('Kuruma', 'kuruma', 78000, 'sports'),
('Landstalker', 'landstalker', 43700, 'suv'),
('Lynx', 'lynx', 56250, 'sports'),
('Mamba', 'mamba', 90000, 'sportsclassics'),
('Manana', 'manana', 13710, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 115000, 'sports'),
('Massacro 2', 'massacro2', 108000, 'sports'),
('Mesa', 'mesa', 61200, 'suv'),
('Mesa 2', 'mesa2', 26500, 'suv'),
('Mesa 3', 'mesa3', 30100, 'suv'),
('Mini Van', 'minivan', 19830, 'vans'),
('Mini Van ', 'minivan2', 24600, 'vans'),
('Monroe', 'monroe', 121900, 'sportsclassics'),
('Moonbeam', 'moonbeam', 16030, 'suv'),
('Moonbeam 2', 'moonbeam2', 20600, 'suv'),
('Mower', 'mower', 3280, 'compacts'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('N?on', 'neon', 184400, 'sports'),
('N?ro', 'nero', 136000, 'super'),
('N?ro 2', 'nero2', 213000, 'super'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 85000, 'muscles'),
('9F', 'ninef', 108000, 'sports'),
('9F ', 'ninef2', 115000, 'sports'),
('Oracle', 'oracle', 27600, 'coupes'),
('Oracle XS', 'oracle2', 32400, 'coupes'),
('Osiris', 'osiris', 200000, 'super'),
('Panto', 'panto', 3280, 'compacts'),
('Pariah', 'pariah', 250000, 'sports'),
('Patriot', 'patriot', 53500, 'suv'),
('Patriot 2', 'patriot2', 193900, 'suv'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 31800, 'sports'),
('Peyote', 'peyote', 14260, 'sportsclassics'),
('Phoenix', 'phoenix', 90000, 'muscles'),
('Picador', 'picador', 13710, 'muscles'),
('Pigalle', 'pigalle', 78000, 'sportsclassics'),
('Pony', 'pony', 24250, 'suv'),
('Pony 2', 'pony2', 28200, 'suv'),
('Prairie', 'prairie', 5050, 'compacts'),
('Premier', 'premier', 4250, 'berlines'),
('Primo', 'primo', 4900, 'berlines'),
('Primo Custom', 'primo2', 14870, 'berlines'),
('Radi', 'radi', 24250, 'suv'),
('Raiden', 'raiden', 170600, 'sports'),
('Rancher XL', 'rancherxl', 39500, 'suv'),
('Rapid GT', 'rapidgt', 121000, 'sports'),
('Rapid GT ', 'rapidgt2', 127000, 'sports'),
('Rapid G', 'rapidgt3', 77000, 'sportsclassics'),
('Ratloader 2', 'ratloader2', 11000, 'muscles'),
('Reaper', 'reaper', 175000, 'super'),
('Rebel', 'rebel', 14000, 'suv'),
('Regina', 'regina', 4900, 'berlines'),
('Retinue', 'retinue', 27600, 'sportsclassics'),
('Revolter', 'revolter', 71500, 'sports'),
('Rhapsody', 'rhapsody', 4050, 'compacts'),
('Riata', 'riata', 37020, 'suv'),
('Rocoto', 'rocoto', 26900, 'suv'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner', 'ruiner', 17620, 'muscles'),
('Rumpo', 'rumpo', 27600, 'suv'),
('Rumpo 2', 'rumpo2', 22030, 'suv'),
('Rumpo 3', 'rumpo3', 26000, 'suv'),
('Sabre Turbo', 'sabregt', 22600, 'muscles'),
('Sabre GT ', 'sabregt2', 31200, 'muscles'),
('Sadler', 'sadler', 17000, 'vans'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking XL', 'sandking', 59550, 'suv'),
('Sandking', 'sandking2', 30000, 'suv'),
('Savestra', 'savestra', 30500, 'sportsclassics'),
('SC-1', 'sc1', 202000, 'super'),
('Schafter 2', 'schafter2', 27600, 'coupes'),
('Schafter V12', 'schafter3', 35000, 'sports'),
('Schlagen', 'schlagen', 100000, 'sports'),
('Schwarzer', 'schwarzer', 53500, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Tracteur', 'scrap', 8590, 'muscles'),
('Seminole', 'seminole', 13000, 'suv'),
('Sentinel', 'sentinel', 22750, 'coupes'),
('Sentinel C', 'sentinel2', 26400, 'coupes'),
('Sentiel 3', 'sentinel3', 32000, 'sports'),
('Serrano', 'serrano', 22500, 'suv'),
('Seven 70', 'seven70', 171000, 'sports'),
('Schafter', 'shafter2', 60000, 'berlines'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slamvan', 'slamvan', 12650, 'suv'),
('Slamvan 2', 'slamvan2', 20350, 'suv'),
('Slamvan 3', 'slamvan3', 26000, 'suv'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Specter', 'specter', 103500, 'sports'),
('Specter', 'specter2', 125000, 'sports'),
('Speedo', 'speedo', 16150, 'suv'),
('Speedo 2', 'speedo2', 20500, 'suv'),
('Speedo 3', 'speedo3', 23150, 'suv'),
('Stafford', 'stafford', 20000, 'berlines'),
('Stallion', 'stalion', 14870, 'muscles'),
('Stallion 2', 'stalion2', 27000, 'muscles'),
('Stanier', 'stanier', 6860, 'berlines'),
('Stinger', 'stinger', 83000, 'sportsclassics'),
('Stratum', 'stratum', 5350, 'berlines'),
('Sultan', 'sultan', 20400, 'sports'),
('Sultan RS', 'sultanrs', 50000, 'super'),
('Super Diamond', 'superd', 19600, 'berlines'),
('Surano', 'surano', 84000, 'sports'),
('Surfer', 'surfer', 15030, 'suv'),
('Surge', 'surge', 5250, 'berlines'),
('Swinger', 'swinger', 210000, 'sportsclassics'),
('T-20', 't20', 200000, 'super'),
('Tailgater', 'tailgater', 24250, 'berlines'),
('Tampa', 'tampa', 24250, 'muscles'),
('Tampa 2', 'tampa2', 45000, 'muscles'),
('Tempesta', 'tempesta', 185000, 'super'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('tmaxdx', 'tmaxdx', 1000000, 'super'),
('Torero', 'torero', 197000, 'sportsclassics'),
('Tornado', 'tornado', 14520, 'sportsclassics'),
('Tornado ', 'tornado2', 18730, 'sportsclassics'),
('Tornado ', 'tornado3', 13240, 'sportsclassics'),
('Tornado ', 'tornado4', 7260, 'sportsclassics'),
('Tornado Cabriolet 5', 'tornado5', 27600, 'sportsclassics'),
('Tornado Cabriolet 6', 'tornado6', 15420, 'sportsclassics'),
('Toros', 'toros', 200000, 'suv'),
('Tracteur', 'tractor', 7680, 'muscles'),
('Tracteur 2', 'tractor2', 8000, 'muscles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Tropos', 'tropos', 107000, 'sports'),
('Tulip', 'tulip', 18000, 'muscles'),
('Turismo', 'turismo2', 211000, 'sportsclassics'),
('Turismo R', 'turismor', 195000, 'super'),
('Vacca', 'vacca', 95000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Vamos', 'vamos', 15500, 'muscles'),
('Vigero', 'vigero', 10620, 'muscles'),
('Virgo', 'virgo', 10080, 'muscles'),
('Virgo Custom', 'virgo2', 13000, 'muscles'),
('Virgo Custom 2', 'virgo3', 11000, 'muscles'),
('Viseris', 'viseris', 140000, 'sportsclassics'),
('Voltic', 'voltic', 150000, 'super'),
('Voodoo', 'voodoo', 11620, 'muscles'),
('Voodoo 2', 'voodoo2', 10240, 'muscles'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 7260, 'berlines'),
('Washington', 'washington', 6860, 'berlines'),
('Windsor', 'windsor', 20000, 'coupes'),
('Windsor ', 'windsor2', 26000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XA21', 'xa21', 200000, 'super'),
('XLS', 'xls', 21000, 'suv'),
('Yosemite', 'yosemite', 27600, 'muscles'),
('Youga', 'youga', 18000, 'suv'),
('Youga 2', 'youga2', 20000, 'suv'),
('Zion', 'zion', 15000, 'coupes'),
('Zion Cabriolet', 'zion2', 41900, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z Type', 'ztype', 130000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles_for_sale`
--

CREATE TABLE `vehicles_for_sale` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('berlines', 'Berlines'),
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscles', 'Muscles'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Supers'),
('suv', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `veh_km`
--

CREATE TABLE `veh_km` (
  `carplate` varchar(10) NOT NULL,
  `km` varchar(255) NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT 0,
  `reset` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `whitelist`
--

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`) USING BTREE,
  ADD KEY `index_addon_account_data_account_name` (`account_name`) USING BTREE;

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE;

--
-- Index pour la table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bikedealer_vehicles`
--
ALTER TABLE `bikedealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `bike_categories`
--
ALTER TABLE `bike_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `bike_sold`
--
ALTER TABLE `bike_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `boatdealer_boats`
--
ALTER TABLE `boatdealer_boats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `boat_categories`
--
ALTER TABLE `boat_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `bwh_bans`
--
ALTER TABLE `bwh_bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bwh_identifiers`
--
ALTER TABLE `bwh_identifiers`
  ADD PRIMARY KEY (`steam`);

--
-- Index pour la table `bwh_warnings`
--
ALTER TABLE `bwh_warnings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `crafting`
--
ALTER TABLE `crafting`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE,
  ADD KEY `index_datastore_data_name` (`name`) USING BTREE;

--
-- Index pour la table `dpkeybinds`
--
ALTER TABLE `dpkeybinds`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`) USING BTREE;

--
-- Index pour la table `lrp_registromedico`
--
ALTER TABLE `lrp_registromedico`
  ADD PRIMARY KEY (`offense`);

--
-- Index pour la table `lrp_registromedicoinfo`
--
ALTER TABLE `lrp_registromedicoinfo`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `meeta_vehicle_trunk`
--
ALTER TABLE `meeta_vehicle_trunk`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier_value` (`identifier`,`value`) USING BTREE;

--
-- Index pour la table `org`
--
ALTER TABLE `org`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `org_gradeorg`
--
ALTER TABLE `org_gradeorg`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_boats`
--
ALTER TABLE `owned_boats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name_owner` (`name`,`owner`) USING BTREE;

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `vehsowned` (`owner`);

--
-- Index pour la table `pawnshops`
--
ALTER TABLE `pawnshops`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playerhousing`
--
ALTER TABLE `playerhousing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `position_agricultures`
--
ALTER TABLE `position_agricultures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties_inventory`
--
ALTER TABLE `properties_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `rented_bikes`
--
ALTER TABLE `rented_bikes`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `rented_boats`
--
ALTER TABLE `rented_boats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `truck_categories`
--
ALTER TABLE `truck_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `item` (`item`,`plate`) USING BTREE;

--
-- Index pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Index pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `identifier_money_bank` (`identifier`,`money`,`bank`) USING BTREE;

--
-- Index pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_hangard`
--
ALTER TABLE `user_hangard`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier_item` (`identifier`,`item`) USING BTREE;

--
-- Index pour la table `user_lastcharacter`
--
ALTER TABLE `user_lastcharacter`
  ADD PRIMARY KEY (`steamid`) USING BTREE;

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `user_mdt`
--
ALTER TABLE `user_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_sim`
--
ALTER TABLE `user_sim`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_tenue`
--
ALTER TABLE `user_tenue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `vehicles_for_sale`
--
ALTER TABLE `vehicles_for_sale`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `veh_km`
--
ALTER TABLE `veh_km`
  ADD PRIMARY KEY (`carplate`),
  ADD UNIQUE KEY `carplate` (`carplate`),
  ADD KEY `carplate_2` (`carplate`);

--
-- Index pour la table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bikedealer_vehicles`
--
ALTER TABLE `bikedealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `boatdealer_boats`
--
ALTER TABLE `boatdealer_boats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bwh_bans`
--
ALTER TABLE `bwh_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `bwh_warnings`
--
ALTER TABLE `bwh_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

--
-- AUTO_INCREMENT pour la table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT pour la table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `meeta_vehicle_trunk`
--
ALTER TABLE `meeta_vehicle_trunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT pour la table `org_gradeorg`
--
ALTER TABLE `org_gradeorg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `owned_boats`
--
ALTER TABLE `owned_boats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pawnshops`
--
ALTER TABLE `pawnshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT pour la table `properties_inventory`
--
ALTER TABLE `properties_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `rented_boats`
--
ALTER TABLE `rented_boats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1626;

--
-- AUTO_INCREMENT pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10714;

--
-- AUTO_INCREMENT pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_hangard`
--
ALTER TABLE `user_hangard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10896;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `user_mdt`
--
ALTER TABLE `user_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_sim`
--
ALTER TABLE `user_sim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_tenue`
--
ALTER TABLE `user_tenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicles_for_sale`
--
ALTER TABLE `vehicles_for_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
