-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 06 juin 2021 à 18:32
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `root`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id_q` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `contenu` longtext DEFAULT NULL,
  `resolue` tinyint(4) DEFAULT NULL,
  `vue` tinyint(4) NOT NULL,
  `id_u` int(11) NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `questions_tags`
--

CREATE TABLE `questions_tags` (
  `id_l` int(11) NOT NULL,
  `id_q` int(11) DEFAULT NULL,
  `id_t` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `id_r` int(11) NOT NULL,
  `contenu_r` longtext NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_mise_a_jour` datetime DEFAULT NULL,
  `correcte` tinyint(4) NOT NULL DEFAULT 0,
  `id_q` int(11) NOT NULL,
  `id_u` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id_t` int(11) NOT NULL,
  `noms` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_u` int(11) NOT NULL,
  `type_u` varchar(200) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `telephone` int(11) NOT NULL,
  `date_naissance` datetime NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `profil` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `pays` varchar(200) NOT NULL,
  `ville` varchar(200) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_mise_a_jour` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_q`),
  ADD KEY `fk_questions_utilisateur_idx` (`id_u`);

--
-- Index pour la table `questions_tags`
--
ALTER TABLE `questions_tags`
  ADD PRIMARY KEY (`id_l`),
  ADD KEY `fk_lien_questions1_idx` (`id_q`),
  ADD KEY `fk_lien_tags1_idx` (`id_t`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id_r`),
  ADD KEY `fk_reponse_questions1_idx` (`id_q`),
  ADD KEY `fk_reponse_utilisateur1_idx` (`id_u`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_t`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions_tags`
--
ALTER TABLE `questions_tags`
  MODIFY `id_l` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_t` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
