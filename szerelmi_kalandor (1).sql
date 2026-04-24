-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2026. Ápr 23. 20:39
-- Kiszolgáló verziója: 5.7.24
-- PHP verzió: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szerelmi_kalandor`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `answer_pool`
--

CREATE TABLE `answer_pool` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `answer_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `answer_pool`
--

INSERT INTO `answer_pool` (`id`, `category`, `answer_text`) VALUES
(1, 'allatok', 'Tacskó'),
(2, 'allatok', 'Aranyhal'),
(3, 'allatok', 'Papagáj'),
(4, 'allatok', 'Hörcsög'),
(5, 'gyumolcs', 'Eper'),
(6, 'gyumolcs', 'Banán'),
(7, 'gyumolcs', 'Kivi'),
(8, 'gyumolcs', 'Mangó'),
(9, 'datumok', 'Június 15.'),
(10, 'datumok', 'Szeptember 3.'),
(11, 'datumok', 'Január 20.'),
(12, 'datumok', 'Március 12.'),
(13, 'helyszinek', 'Egy hangulatos kávézóban'),
(14, 'helyszinek', 'A város főterén'),
(15, 'helyszinek', 'Egy kertmoziban'),
(16, 'helyszinek', 'A folyóparton sétálva'),
(17, 'helyszinek', 'Egy elegáns étteremben'),
(18, 'helyszinek', 'Egy barátunk házibulijában'),
(19, 'utazas_hely', 'Párizs, a fények városa'),
(20, 'utazas_hely', 'Egy távoli trópusi sziget'),
(21, 'utazas_hely', 'Havas hegycsúcsok egy faházzal'),
(22, 'utazas_hely', 'Róma történelmi utcái'),
(23, 'utazas_hely', 'New York pörgősebb negyedei'),
(24, 'utazas_hely', 'Izland és az északi fény'),
(25, 'napszakok', 'Késő este, amikor mindenki alszik'),
(26, 'napszakok', 'Hajnalban, napfelkeltekor'),
(27, 'napszakok', 'Kora délután, ebéd után'),
(28, 'napszakok', 'Délelőtt, a munka hevében'),
(29, 'italok', 'Frissen facsart narancslé'),
(30, 'italok', 'Egy csésze fekete tea'),
(31, 'italok', 'Forró csokoládé tejszínhabbal'),
(32, 'italok', 'Hideg mentes víz'),
(33, 'italok', 'Zöld tea mézzel'),
(34, 'italok', 'Tejeskávé cukor nélkül'),
(35, 'film_stilus', 'Véres és izgalmas horror'),
(36, 'film_stilus', 'Látványos sci-fi akció'),
(37, 'film_stilus', 'Könnyed, nevettetős vígjáték'),
(38, 'film_stilus', 'Lélektani dráma'),
(39, 'film_stilus', 'Történelmi dokumentumfilm'),
(40, 'film_stilus', 'Romantikus musical'),
(41, 'szinek', 'Elegáns sötétkék'),
(42, 'szinek', 'Szenvedélyes vörös'),
(43, 'szinek', 'Tisztaságot sugárzó fehér'),
(44, 'szinek', 'Vidám napsárga'),
(45, 'szinek', 'Titokzatos smaragdzöld'),
(46, 'szinek', 'Modern pasztell rózsaszín'),
(47, 'haz_stilus', 'Ultramodern üvegpalota'),
(48, 'haz_stilus', 'Rusztikus erdei rönkház'),
(49, 'haz_stilus', 'Mediterrán villa terasszal'),
(50, 'haz_stilus', 'Skandináv minimalista lakás'),
(51, 'haz_stilus', 'Klasszikus polgári lakóház'),
(52, 'haz_stilus', 'Indusztriális loft lakás'),
(53, 'bosszusag', 'Ha lassú az internet'),
(54, 'bosszusag', 'Ha valaki hangosan rág'),
(55, 'bosszusag', 'Ha nagy a tömeg a boltban'),
(56, 'bosszusag', 'Ha nem találom a kulcsomat'),
(57, 'bosszusag', 'Ha elmosogatnak helyettem, de rosszul'),
(58, 'bosszusag', 'Ha hideg a kávé, amit rendeltem'),
(59, 'oltozkodes', 'Elegáns, alkalmi viselet'),
(60, 'oltozkodes', 'Laza, sportos melegítő'),
(61, 'oltozkodes', 'Csinos, \"smart casual\" szett'),
(62, 'oltozkodes', 'Bő, kényelmes otthoni ruha'),
(63, 'oltozkodes', 'Klasszikus farmer-póló kombináció'),
(64, 'oltozkodes', 'Extravagáns, egyedi darabok'),
(65, 'konyha_tipus', 'Csípős és fűszeres mexikói'),
(66, 'konyha_tipus', 'Könnyed mediterrán görög'),
(67, 'konyha_tipus', 'Házias, laktató magyaros'),
(68, 'konyha_tipus', 'Különleges ázsiai fúziós'),
(69, 'konyha_tipus', 'Letisztult japán sushi'),
(70, 'konyha_tipus', 'Szaftos amerikai BBQ'),
(71, 'hetvegi_program', 'Egész napos túrázás a természetben'),
(72, 'hetvegi_program', 'Lustálkodás és sorozatnézés a kanapén'),
(73, 'hetvegi_program', 'Városnézés és múzeumlátogatás'),
(74, 'hetvegi_program', 'Wellness és teljes kikapcsolódás'),
(75, 'hetvegi_program', 'Kerti parti a barátokkal'),
(76, 'hetvegi_program', 'Kreatív barkácsolás vagy sütés-főzés'),
(77, 'zene_stilus', 'Dübörgő techno vagy elektronikus'),
(78, 'zene_stilus', 'Énekelhető, klasszikus pop slágerek'),
(79, 'zene_stilus', 'Lágy, akusztikus dallamok'),
(80, 'zene_stilus', 'Zúzós rock vagy metál'),
(81, 'zene_stilus', 'Hangulatos jazz és blues'),
(82, 'zene_stilus', 'Mai modern trap és hip-hop'),
(83, 'naszut_hely', 'Maldív-szigetek luxus villája'),
(84, 'naszut_hely', 'Sarkvidéki expedíció'),
(85, 'naszut_hely', 'Hátizsákos túra Ázsiában'),
(86, 'naszut_hely', 'Toszkán vidéki kúria'),
(87, 'naszut_hely', 'Vitorlás túra a Karib-tengeren'),
(88, 'naszut_hely', 'Japán körutazás'),
(89, 'gyerek_szam', 'Egy kis felfedezőt'),
(90, 'gyerek_szam', 'Két gyerkőcöt'),
(91, 'gyerek_szam', 'Három vagy több gyermeket'),
(92, 'gyerek_szam', 'Egyelőre nem tervezek'),
(93, 'fuszer', 'Erős és csípős chili'),
(94, 'fuszer', 'Friss, illatos bazsalikom'),
(95, 'fuszer', 'Édes és lágy fahéj'),
(96, 'fuszer', 'Karakteres fokhagyma'),
(97, 'fuszer', 'Füstös BBQ aroma'),
(98, 'fuszer', 'Klasszikus sós-borsos'),
(99, 'jatekok', 'Stratégiai Monopoly'),
(100, 'jatekok', 'Gyors és pörgős Uno'),
(101, 'jatekok', 'Logikai Sakk'),
(102, 'jatekok', 'Asszociációs Dixit'),
(103, 'jatekok', 'Klasszikus francia kártya'),
(104, 'jatekok', 'Online lövöldözős játék'),
(105, 'ekszer', 'Egy elegáns karóra'),
(106, 'ekszer', 'Apró, csillogó fülbevaló'),
(107, 'ekszer', 'Vékony arany nyaklánc'),
(108, 'ekszer', 'Egy feltűnő gyűrű'),
(109, 'ekszer', 'Bőr karkötő'),
(110, 'ekszer', 'Sosem hordok ékszert'),
(111, 'foto_helyszin', 'A tavalyi nyaraláson készült'),
(112, 'foto_helyszin', 'Egy véletlen elkapott pillanat otthon'),
(113, 'foto_helyszin', 'A legelső közös képünk'),
(114, 'foto_helyszin', 'A karácsonyi fa alatt készült'),
(115, 'foto_helyszin', 'Egy profi fotózáson'),
(116, 'foto_helyszin', 'Az egyik buli végén készült szelfi'),
(117, 'tulajdonsag', 'A végtelen türelmed'),
(118, 'tulajdonsag', 'A fanyar humorod'),
(119, 'tulajdonsag', 'A kedves tekinteted'),
(120, 'tulajdonsag', 'A magabiztosságod'),
(121, 'tulajdonsag', 'Az önzetlen segítséged'),
(122, 'tulajdonsag', 'A közös érdeklődési körünk');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `funny_messages`
--

CREATE TABLE `funny_messages` (
  `id` int(11) NOT NULL,
  `message_text` varchar(255) NOT NULL,
  `type` enum('wrong','game_over') DEFAULT 'wrong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `funny_messages`
--

INSERT INTO `funny_messages` (`id`, `message_text`, `type`) VALUES
(1, 'Ezt még a Google sem tudta volna elrontani ennyire...', 'wrong'),
(2, 'Biztos, hogy egy pár vagyunk? Ezt illene tudnod!', 'wrong'),
(3, 'Hoppá! Valaki nem figyelt az évfordulónkon...', 'wrong'),
(4, 'Majdnem sikerült! (De tényleg csak majdnem.)', 'wrong'),
(5, 'Úgy tűnik ma te mosogatsz.', 'wrong'),
(6, 'Ezt most úgy teszünk, mintha meg sem történt volna.', 'wrong'),
(7, 'Sajnos elfogytak az életeid, mehetsz a kanapéra aludni!', 'game_over'),
(8, 'Game Over! De ne aggódj, attól még szeretlek. (Talán.)', 'game_over');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question_text` text,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_index` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'gasztro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_index`, `category`) VALUES
(1, 9, 'Mikor van a születésnapom?', 'május 9.', 'Március 12.', 'Január 20.', 'Június 15.', 0, 'datumok'),
(2, 9, 'Melyik a kedvenc állatom?', 'cica', 'Tacskó', 'Hörcsög', 'Papagáj', 0, 'allatok'),
(3, 9, 'Melyik gyümölcsöt szeretem a legjobban?', 'dinnye', 'Mangó', 'Banán', 'Kivi', 0, 'gyumolcs'),
(4, 10, 'Melyik a kedvenc színem rajtad?', 'fehér', 'Modern pasztell rózsaszín', 'Szenvedélyes vörös', 'Elegáns sötétkék', 0, 'szinek'),
(5, 10, 'Melyik filmstílust választanám egy esti mozizáshoz?', 'vígjáték', 'Romantikus musical', 'Történelmi dokumentumfilm', 'Könnyed, nevettetős vígjáték', 0, 'film_stilus'),
(6, 10, 'Melyik a kedvenc állatom?', 'cica', 'Hörcsög', 'Tacskó', 'Aranyhal', 0, 'allatok'),
(7, 10, 'Melyik gyümölcsöt szeretem a legjobban?', 'dinnye', 'Kivi', 'Mangó', 'Banán', 0, 'gyumolcs'),
(8, 10, 'Milyen stílusú házban élnék a legszívesebben?', 'luxus', 'Klasszikus polgári lakóház', 'Mediterrán villa terasszal', 'Rusztikus erdei rönkház', 0, 'haz_stilus'),
(9, 10, 'Hová utaznék el most a legszívesebben?', 'Japán', 'Egy távoli trópusi sziget', 'Havas hegycsúcsok egy faházzal', 'Párizs, a fények városa', 0, 'utazas_hely'),
(10, 10, 'Milyen stílusú ruhában vagyok a legszívesebben?', 'itthoni', 'Extravagáns, egyedi darabok', 'Laza, sportos melegítő', 'Klasszikus farmer-póló kombináció', 0, 'oltozkodes'),
(11, 10, 'Mi a legideálisabb hétvégi program számomra?', 'játék', 'Kreatív barkácsolás vagy sütés-főzés', 'Wellness és teljes kikapcsolódás', 'Városnézés és múzeumlátogatás', 0, 'hetvegi_program'),
(12, 10, 'Mikor van a születésnapom?', 'május 9', 'Június 15.', 'Szeptember 3.', 'Január 20.', 0, 'datumok'),
(13, 10, 'Milyen zenei stílus szólna az autómban egy hosszú úton?', 'bármilyen', 'Zúzós rock vagy metál', 'Énekelhető, klasszikus pop slágerek', 'Dübörgő techno vagy elektronikus', 0, 'zene_stilus'),
(14, 11, 'Hová utaznék el most a legszívesebben?', 'Japán', 'Havas hegycsúcsok egy faházzal', 'Egy távoli trópusi sziget', 'Róma történelmi utcái', 0, 'utazas_hely'),
(15, 11, 'Mi az a tulajdonságod, amibe először beleszerettem?', 'kedvességed', 'A közös érdeklődési körünk', 'A kedves tekinteted', 'Az önzetlen segítséged', 0, 'tulajdonsag'),
(16, 11, 'Milyen stílusú házban élnék a legszívesebben?', 'luxus', 'Skandináv minimalista lakás', 'Klasszikus polgári lakóház', 'Ultramodern üvegpalota', 0, 'haz_stilus'),
(17, 11, 'Hol volt az első randink?', 'Pécs belvárosában', 'A folyóparton sétálva', 'Egy kertmoziban', 'Egy barátunk házibulijában', 0, 'helyszinek'),
(18, 11, 'Mi a legideálisabb hétvégi program számomra?', 'Játék', 'Kerti parti a barátokkal', 'Wellness és teljes kikapcsolódás', 'Lustálkodás és sorozatnézés a kanapén', 0, 'hetvegi_program'),
(19, 12, 'Melyik a kedvenc színem rajtad?', 'fehér', 'Vidám napsárga', 'Titokzatos smaragdzöld', 'Szenvedélyes vörös', 0, 'szinek'),
(20, 12, 'Melyik a kedvenc állatom?', 'cica', 'Tacskó', 'Papagáj', 'Aranyhal', 0, 'allatok'),
(21, 12, 'Melyik a kedvenc konyhatípusom?', 'luxus', 'Szaftos amerikai BBQ', 'Csípős és fűszeres mexikói', 'Könnyed mediterrán görög', 0, 'konyha_tipus'),
(22, 12, 'Mi a leggyakoribb reggeli italom?', 'kávé', 'Hideg mentes víz', 'Frissen facsart narancslé', 'Egy csésze fekete tea', 0, 'italok'),
(23, 13, 'Mi az a tulajdonságod, amibe először beleszerettem?', 'kedvesség', 'A végtelen türelmed', 'Az önzetlen segítséged', 'A magabiztosságod', 0, 'tulajdonsag'),
(24, 13, 'Mi az, ami a leggyorsabban ki tud hozni a sodromból?', 'értetlenség', 'Ha lassú az internet', 'Ha nem találom a kulcsomat', 'Ha nagy a tömeg a boltban', 0, 'bosszusag'),
(25, 13, 'Melyik gyümölcsöt szeretem a legjobban?', 'dinnye', 'Mangó', 'Banán', 'Kivi', 0, 'gyumolcs'),
(26, 13, 'Hány gyermeket szeretnék a jövőben?', '0', 'Egyelőre nem tervezek', 'Három vagy több gyermeket', 'Két gyerkőcöt', 0, 'gyerek_szam'),
(27, 15, 'Melyik közös fotónk a kedvencem?', 'dsadsadasdad', 'A legelső közös képünk', 'Az egyik buli végén készült szelfi', 'Egy profi fotózáson', 0, 'foto_helyszin'),
(28, 15, 'Mi a legideálisabb hétvégi program számomra?', 'sdasdsadsad', 'Egész napos túrázás a természetben', 'Városnézés és múzeumlátogatás', 'Kreatív barkácsolás vagy sütés-főzés', 0, 'hetvegi_program'),
(29, 15, 'Milyen stílusú házban élnék a legszívesebben?', 'sdsadasdas', 'Indusztriális loft lakás', 'Skandináv minimalista lakás', 'Mediterrán villa terasszal', 0, 'haz_stilus'),
(30, 20, 'Melyik a kedvenc állatom?', 'Cica', 'Hörcsög', 'Aranyhal', 'Tacskó', 0, 'allatok'),
(31, 20, 'Milyen zenei stílus szólna az autómban egy hosszú úton?', 'Bármi, amit mindketten szeretünk', 'Zúzós rock vagy metál', 'Lágy, akusztikus dallamok', 'Énekelhető, klasszikus pop slágerek', 0, 'zene_stilus'),
(32, 20, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD, bár még sosem próbáltam', 'Klasszikus francia kártya', 'Asszociációs Dixit', 'Gyors és pörgős Uno', 0, 'jatekok'),
(33, 20, 'Hová mennék legszívesebben nászútra?', 'Japán', 'Maldív-szigetek luxus villája', 'Vitorlás túra a Karib-tengeren', 'Japán körutazás', 0, 'naszut_hely'),
(34, 20, 'Hány gyermeket szeretnék a jövőben?', '0', 'Egy kis felfedezőt', 'Három vagy több gyermeket', 'Egyelőre nem tervezek', 0, 'gyerek_szam'),
(35, 20, 'Mi a kedvenc fűszerem vagy ízesítőm?', 'Tárkony', 'Klasszikus sós-borsos', 'Erős és csípős chili', 'Füstös BBQ aroma', 0, 'fuszer'),
(36, 20, 'Mi az a tulajdonságod, amibe először beleszerettem?', 'A kedvességed', 'A kedves tekinteted', 'A fanyar humorod', 'A magabiztosságod', 0, 'tulajdonsag'),
(37, 20, 'Melyik napszakban vagyok a legaktívabb?', 'Este', 'Kora délután, ebéd után', 'Hajnalban, napfelkeltekor', 'Késő este, amikor mindenki alszik', 0, 'napszakok'),
(38, 20, 'Milyen stílusú házban élnék a legszívesebben?', 'Luxus', 'Ultramodern üvegpalota', 'Skandináv minimalista lakás', 'Klasszikus polgári lakóház', 0, 'haz_stilus'),
(39, 21, 'Mi a kedvenc fűszerem vagy ízesítőm?', 'Tárkony', 'Édes és lágy fahéj', 'Erős és csípős chili', 'Klasszikus sós-borsos', 0, 'fuszer'),
(40, 21, 'Mi a leggyakoribb reggeli italom?', 'Kávé', 'Zöld tea mézzel', 'Frissen facsart narancslé', 'Egy csésze fekete tea', 0, 'italok'),
(41, 21, 'Melyik gyümölcsöt szeretem a legjobban?', 'Dinnye', 'Kivi', 'Banán', 'Mangó', 0, 'gyumolcs'),
(42, 21, 'Melyik napszakban vagyok a legaktívabb?', 'Este', 'Késő este, amikor mindenki alszik', 'Hajnalban, napfelkeltekor', 'Délelőtt, a munka hevében', 0, 'napszakok'),
(43, 21, 'Mi az, ami a leggyorsabban ki tud hozni a sodromból?', 'Ha értetlen valaki', 'Ha elmosogatnak helyettem, de rosszul', 'Ha nagy a tömeg a boltban', 'Ha hideg a kávé, amit rendeltem', 0, 'bosszusag'),
(44, 21, 'Melyik a kedvenc állatom?', 'Cica', 'Tacskó', 'Papagáj', 'Aranyhal', 0, 'allatok'),
(45, 21, 'Hol volt az első randink?', 'Pécsen a belvárosban', 'A város főterén', 'A folyóparton sétálva', 'Egy barátunk házibulijában', 0, 'helyszinek'),
(46, 21, 'Melyik ékszert hordom a legszívesebben?', 'Piercing és karkötő', 'Bőr karkötő', 'Egy elegáns karóra', 'Egy feltűnő gyűrű', 0, 'ekszer'),
(47, 21, 'Melyik gyümölcsöt szeretem a legjobban?', 'Dinnye', 'Eper', 'Kivi', 'Mangó', 0, 'gyumolcs'),
(48, 21, 'Mikor van a születésnapom?', 'Május 9.', 'Szeptember 3.', 'Március 12.', 'Június 15.', 0, 'datumok'),
(49, 21, 'Hová utaznék el most a legszívesebben?', 'Japán', 'Izland és az északi fény', 'Róma történelmi utcái', 'Párizs, a fények városa', 0, 'utazas_hely'),
(50, 21, 'Melyik a kedvenc színem rajtad?', 'Fehér', 'Vidám napsárga', 'Elegáns sötétkék', 'Titokzatos smaragdzöld', 0, 'szinek'),
(51, 21, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD, bár még sosem próbáltam', 'Online lövöldözős játék', 'Stratégiai Monopoly', 'Klasszikus francia kártya', 0, 'jatekok'),
(52, 21, 'Milyen stílusú házban élnék a legszívesebben?', 'Luxus', 'Klasszikus polgári lakóház', 'Skandináv minimalista lakás', 'Indusztriális loft lakás', 0, 'haz_stilus'),
(53, 29, 'Melyik a kedvenc színem rajtad?', 'Fehér', 'Szenvedélyes vörös', 'Tisztaságot sugárzó fehér', 'Modern pasztell rózsaszín', 0, 'szinek'),
(54, 29, 'Mi az a tulajdonságod, amibe először beleszerettem?', 'Kedvesség', 'A közös érdeklődési körünk', 'A magabiztosságod', 'A kedves tekinteted', 0, 'tulajdonsag'),
(55, 32, 'Melyik a kedvenc színem rajtad?', 'Fehér', 'Vidám napsárga', 'Szenvedélyes vörös', 'Modern pasztell rózsaszín', 0, 'szinek'),
(56, 32, 'Melyik közös fotónk a kedvencem?', 'A legelső, amikor fagyiztunk', 'A tavalyi nyaraláson készült', 'Egy profi fotózáson', 'Az egyik buli végén készült szelfi', 0, 'foto_helyszin'),
(57, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Gyors és pörgős Uno', 'Logikai Sakk', 'Asszociációs Dixit', 0, 'jatekok'),
(58, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Online lövöldözős játék', 'Klasszikus francia kártya', 'Asszociációs Dixit', 0, 'jatekok'),
(59, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Gyors és pörgős Uno', 'Klasszikus francia kártya', 'Stratégiai Monopoly', 0, 'jatekok'),
(60, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Logikai Sakk', 'Klasszikus francia kártya', 'Online lövöldözős játék', 0, 'jatekok'),
(61, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Gyors és pörgős Uno', 'Logikai Sakk', 'Stratégiai Monopoly', 0, 'jatekok'),
(62, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Stratégiai Monopoly', 'Klasszikus francia kártya', 'Logikai Sakk', 0, 'jatekok'),
(63, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Klasszikus francia kártya', 'Stratégiai Monopoly', 'Logikai Sakk', 0, 'jatekok'),
(64, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Logikai Sakk', 'Online lövöldözős játék', 'Asszociációs Dixit', 0, 'jatekok'),
(65, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Klasszikus francia kártya', 'Online lövöldözős játék', 'Gyors és pörgős Uno', 0, 'jatekok'),
(66, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Stratégiai Monopoly', 'Asszociációs Dixit', 'Logikai Sakk', 0, 'jatekok'),
(67, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Online lövöldözős játék', 'Gyors és pörgős Uno', 'Klasszikus francia kártya', 0, 'jatekok'),
(68, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Asszociációs Dixit', 'Gyors és pörgős Uno', 'Stratégiai Monopoly', 0, 'jatekok'),
(69, 32, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Online lövöldözős játék', 'Asszociációs Dixit', 'Stratégiai Monopoly', 0, 'jatekok'),
(70, 33, 'Melyik közös fotónk a kedvencem?', 'A legelső, amikor fagyiztunk', 'Egy profi fotózáson', 'A tavalyi nyaraláson készült', 'A legelső közös képünk', 0, 'foto_helyszin'),
(71, 35, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'DnD', 'Online lövöldözős játék', 'Klasszikus francia kártya', 'Logikai Sakk', 0, 'jatekok'),
(72, 33, 'Melyik közös fotónk a kedvencem?', 'A legelső, amikor fagyiztunk', 'Egy véletlen elkapott pillanat otthon', 'Egy profi fotózáson', 'A legelső közös képünk', 0, 'foto_helyszin'),
(73, 36, 'Mi a kedvenc fűszerem vagy ízesítőm?', 'Tárkony', 'Erős és csípős chili', 'Klasszikus sós-borsos', 'Friss, illatos bazsalikom', 0, 'fuszer'),
(74, 38, 'Melyik közös fotónk a kedvencem?', 'adsdasdadsad', 'A legelső közös képünk', 'A karácsonyi fa alatt készült', 'A tavalyi nyaraláson készült', 0, 'foto_helyszin'),
(75, 40, 'Melyik gyümölcsöt szeretem a legjobban?', 'Dinnye', 'Kivi', 'Banán', 'Mangó', 0, 'gyumolcs'),
(76, 44, 'Melyik napszakban vagyok a legaktívabb?', 'sadasdasdasdas', 'Délelőtt, a munka hevében', 'Hajnalban, napfelkeltekor', 'Késő este, amikor mindenki alszik', 0, 'napszakok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `unique_code` varchar(50) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `theme_color` varchar(20) DEFAULT 'pink'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `quizzes`
--

INSERT INTO `quizzes` (`id`, `unique_code`, `slug`, `title`, `theme_color`) VALUES
(1, NULL, 'elso-kvizunk', 'Alapértelmezett Kvíz', '#FF3131'),
(2, 'love-89e7ec73', 'love-89e7ec73', 'Új meglepetés kvíz', 'pink'),
(3, 'love-2d9be072', 'love-2d9be072', 'Új meglepetés kvíz', 'pink'),
(4, 'love-cd9ca69f', 'love-cd9ca69f', 'Új meglepetés kvíz', 'pink'),
(5, 'love-33d37e19', 'love-33d37e19', 'Új meglepetés kvíz', 'pink'),
(6, 'love-2bfef365', 'love-2bfef365', 'Új meglepetés kvíz', 'pink'),
(7, 'love-5f152e7f', 'love-5f152e7f', 'Új teszt kvíz', 'pink'),
(8, 'love-20eb183c', 'love-20eb183c', 'Teszt2', 'pink'),
(9, 'love-2f5c9ecd', 'love-2f5c9ecd', 'Teszt kvíz', 'pink'),
(10, 'love-afa9a520', 'love-afa9a520', 'Kvíz2', 'pink'),
(11, 'love-368b74a9', 'love-368b74a9', 'Janinak', 'pink'),
(12, 'love-63f806d1', 'love-63f806d1', 'Janinak', 'pink'),
(13, 'love-0492a2c8', 'love-0492a2c8', 'Janinak', 'pink'),
(14, 'love-46c48709', 'love-46c48709', 'Új meglepetés kvíz', 'pink'),
(15, 'love-da1c7931', 'love-da1c7931', 'Kvíz2', 'pink'),
(16, 'love-fb03da42', 'love-fb03da42', 'Új meglepetés kvíz', 'pink'),
(17, 'love-21969bf6', 'love-21969bf6', 'Új meglepetés kvíz', 'pink'),
(18, 'love-24190e72', 'love-24190e72', 'Új meglepetés kvíz', 'pink'),
(19, 'love-b27b5541', 'love-b27b5541', 'Új meglepetés kvíz', 'pink'),
(20, 'love-574b9cc6', 'love-574b9cc6', 'Janinak', 'pink'),
(21, 'love-37a88d83', 'love-37a88d83', 'Janinak', 'pink'),
(22, 'love-7a17ebfa', 'love-7a17ebfa', 'Új meglepetés kvíz', 'pink'),
(23, 'love-132af6c1', 'love-132af6c1', 'Új meglepetés kvíz', 'pink'),
(24, 'love-2831a9cf', 'love-2831a9cf', 'Új meglepetés kvíz', 'pink'),
(25, 'love-1979e31a', 'love-1979e31a', 'Új meglepetés kvíz', 'pink'),
(26, 'love-4acb76f7', 'love-4acb76f7', 'Új meglepetés kvíz', 'pink'),
(27, 'love-d71c3552', 'love-d71c3552', 'Új meglepetés kvíz', 'pink'),
(28, 'love-2fce7f1e', 'love-2fce7f1e', 'Új meglepetés kvíz', 'pink'),
(29, 'love-f5176330', 'love-f5176330', 'Janinak', 'pink'),
(30, 'love-5d25020c', 'love-5d25020c', 'Új meglepetés kvíz', 'pink'),
(31, 'love-85b3ed63', 'love-85b3ed63', 'Új meglepetés kvíz', 'pink'),
(32, 'love-4b9a1bc3', 'love-4b9a1bc3', 'Janinak', 'pink'),
(33, 'love-e1c23bce', 'love-e1c23bce', 'Janinak', 'pink'),
(34, 'love-04af94ea', 'love-04af94ea', 'Új meglepetés kvíz', 'pink'),
(35, 'love-9c2404e1', 'love-9c2404e1', 'Dominika', 'pink'),
(36, 'love-6ebc588e', 'love-6ebc588e', 'Janinak', 'pink'),
(37, 'love-f3979681', 'love-f3979681', 'Új meglepetés kvíz', 'pink'),
(38, 'love-0977071a', 'love-0977071a', 'Dominika', 'pink'),
(39, 'love-5c7ffd2a', 'love-5c7ffd2a', 'Új meglepetés kvíz', 'pink'),
(40, 'love-c0f7a597', 'love-c0f7a597', 'Jani', 'pink'),
(41, 'love-3bbd4eec', 'love-3bbd4eec', 'Új meglepetés kvíz', 'pink'),
(42, 'love-ec5d9787', 'love-ec5d9787', 'Új meglepetés kvíz', 'pink'),
(43, 'love-7ca1e30d', 'love-7ca1e30d', 'Új meglepetés kvíz', 'pink'),
(44, 'love-88e5ca9b', 'love-88e5ca9b', 'Dominika', 'pink');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `rewards`
--

INSERT INTO `rewards` (`id`, `name`) VALUES
(1, 'Egy gyertyafényes vacsora 🍝'),
(2, 'Mozi est (te választod a filmet!) 🎬'),
(3, '30 perces hátmasszázs 💆‍♂️'),
(4, 'Egy egész napos kirándulás 🌳'),
(5, 'Reggeli az ágyba hozva ☕'),
(6, 'Egy szabadon választott süti/desszert 🍰'),
(7, 'Egy romantikus esti séta ✨'),
(8, 'Piknik a szabadban 🧺'),
(9, 'Ma én mosogatok helyetted! 🍽️'),
(10, 'Egy óra zavartalan játék/pihenés 🎮');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `template_questions`
--

CREATE TABLE `template_questions` (
  `id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `category` varchar(50) DEFAULT 'altalanos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `template_questions`
--

INSERT INTO `template_questions` (`id`, `question_text`, `category`) VALUES
(1, 'Melyik a kedvenc állatom?', 'allatok'),
(2, 'Melyik gyümölcsöt szeretem a legjobban?', 'gyumolcs'),
(3, 'Mikor van a születésnapom?', 'datumok'),
(4, 'Hol volt az első randink?', 'helyszinek'),
(5, 'Hová utaznék el most a legszívesebben?', 'utazas_hely'),
(6, 'Melyik napszakban vagyok a legaktívabb?', 'napszakok'),
(7, 'Mi a leggyakoribb reggeli italom?', 'italok'),
(8, 'Melyik filmstílust választanám egy esti mozizáshoz?', 'film_stilus'),
(9, 'Melyik a kedvenc színem rajtad?', 'szinek'),
(10, 'Milyen stílusú házban élnék a legszívesebben?', 'haz_stilus'),
(11, 'Mi az, ami a leggyorsabban ki tud hozni a sodromból?', 'bosszusag'),
(12, 'Milyen stílusú ruhában vagyok a legszívesebben?', 'oltozkodes'),
(13, 'Melyik a kedvenc konyhatípusom?', 'konyha_tipus'),
(14, 'Mi a legideálisabb hétvégi program számomra?', 'hetvegi_program'),
(15, 'Milyen zenei stílus szólna az autómban egy hosszú úton?', 'zene_stilus'),
(16, 'Hová mennék legszívesebben nászútra?', 'naszut_hely'),
(17, 'Hány gyermeket szeretnék a jövőben?', 'gyerek_szam'),
(18, 'Mi a kedvenc fűszerem vagy ízesítőm?', 'fuszer'),
(19, 'Melyik kártyajátékot vagy társast szeretem a legjobban?', 'jatekok'),
(20, 'Melyik ékszert hordom a legszívesebben?', 'ekszer'),
(21, 'Milyen színű körömlakk/ruha állna rajtam a legjobban szerinted?', 'szinek'),
(22, 'Melyik közös fotónk a kedvencem?', 'foto_helyszin'),
(23, 'Mi az a tulajdonságod, amibe először beleszerettem?', 'tulajdonsag');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `answer_pool`
--
ALTER TABLE `answer_pool`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `funny_messages`
--
ALTER TABLE `funny_messages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- A tábla indexei `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `unique_code` (`unique_code`);

--
-- A tábla indexei `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `template_questions`
--
ALTER TABLE `template_questions`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `answer_pool`
--
ALTER TABLE `answer_pool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT a táblához `funny_messages`
--
ALTER TABLE `funny_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT a táblához `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT a táblához `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `template_questions`
--
ALTER TABLE `template_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
