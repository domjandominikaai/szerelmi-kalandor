-- ============================================================
-- Hiányzó kategóriák pótlása az answer_pool-ba
-- Futtatás: phpMyAdmin → SQL fül → beillesztés és végrehajtás
-- ============================================================

SET NAMES utf8mb4;

-- SZEREPEK – "Mi az, amit mindig te csinálsz meg kettőnk közül?"
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('szerepek', 'mosogatás'),
('szerepek', 'főzés'),
('szerepek', 'bevásárlás'),
('szerepek', 'takarítás'),
('szerepek', 'kukavitel'),
('szerepek', 'autóba tankolás'),
('szerepek', 'számlafizetés'),
('szerepek', 'vacsora megrendelése'),
('szerepek', 'kert rendezése'),
('szerepek', 'tervek szervezése');

-- ALOMSZAKMA – "Mi volt az álmom gyerekként?"
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('alomszakma', 'orvos'),
('alomszakma', 'tanár'),
('alomszakma', 'tűzoltó'),
('alomszakma', 'pilóta'),
('alomszakma', 'énekes'),
('alomszakma', 'állatorvos'),
('alomszakma', 'rendőr'),
('alomszakma', 'focista'),
('alomszakma', 'űrhajós'),
('alomszakma', 'festő');

-- KOZOS_EMLEKEK (ha nem lenne még)
INSERT IGNORE INTO `answer_pool` (`category`, `answer_text`) VALUES
('kozos_emlekek', 'az első közös nyaralásunk'),
('kozos_emlekek', 'az első randevúnk'),
('kozos_emlekek', 'amikor elveszünk egy idegen városban'),
('kozos_emlekek', 'az a hosszú éjszakás buli'),
('kozos_emlekek', 'az első közös főzésünk'),
('kozos_emlekek', 'amikor megleptelek'),
('kozos_emlekek', 'a legjobb közös karácsonyunk');

-- AJANDEK (ha nem lenne még)
INSERT IGNORE INTO `answer_pool` (`category`, `answer_text`) VALUES
('ajandek', 'közös élmény'),
('ajandek', 'könyv'),
('ajandek', 'ékszer'),
('ajandek', 'utazás'),
('ajandek', 'kézzel készített ajándék'),
('ajandek', 'wellness'),
('ajandek', 'technológia'),
('ajandek', 'ruha vagy cipő');

-- JOVOKEP (ha nem lenne még)
INSERT IGNORE INTO `answer_pool` (`category`, `answer_text`) VALUES
('jovokep', 'vidéken, kerttel'),
('jovokep', 'városban'),
('jovokep', 'tengerparton'),
('jovokep', 'más országban'),
('jovokep', 'ahol most vagyunk'),
('jovokep', 'kis faluban'),
('jovokep', 'digitális nomádként');
