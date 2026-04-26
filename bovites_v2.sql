-- ============================================================
-- SZERELMI KALANDOR – Answer Pool teljes csere (v2)
-- FONTOS: Ez törli és újraírja az answer_pool tábla tartalmát.
-- A get_quiz_data.php már a mentett opciókat használja,
-- így ez csak az ÚJ kvízekre lesz hatással.
--
-- Importálás: phpMyAdmin → Adatbázis kiválasztása → Importálás
-- ============================================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Töröljük a régi, hosszú formátumú adatokat
TRUNCATE TABLE `answer_pool`;

-- ============================================================
-- ALLATOK – Rövid állatnevek, ahogy egy ember írná
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('allatok', 'kutya'),
('allatok', 'cica'),
('allatok', 'nyuszi'),
('allatok', 'hörcsög'),
('allatok', 'papagáj'),
('allatok', 'aranyhal'),
('allatok', 'teknős'),
('allatok', 'sün'),
('allatok', 'mókus'),
('allatok', 'egerész'),
('allatok', 'kanári'),
('allatok', 'galamb');

-- ============================================================
-- GYUMOLCS – Gyümölcsök neve
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('gyumolcs', 'alma'),
('gyumolcs', 'eper'),
('gyumolcs', 'banán'),
('gyumolcs', 'mangó'),
('gyumolcs', 'kivi'),
('gyumolcs', 'görögdinnye'),
('gyumolcs', 'barack'),
('gyumolcs', 'áfonya'),
('gyumolcs', 'málna'),
('gyumolcs', 'cseresznye'),
('gyumolcs', 'körte'),
('gyumolcs', 'szőlő');

-- ============================================================
-- DATUMOK – Dátumok, ahogy valaki egy születésnapot írna
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('datumok', 'január 1.'),
('datumok', 'február 14.'),
('datumok', 'március 15.'),
('datumok', 'április 4.'),
('datumok', 'május 1.'),
('datumok', 'június 15.'),
('datumok', 'július 20.'),
('datumok', 'augusztus 20.'),
('datumok', 'szeptember 3.'),
('datumok', 'október 23.'),
('datumok', 'november 11.'),
('datumok', 'december 6.');

-- ============================================================
-- HELYSZINEK – Hol volt az első randi / közös emlék
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('helyszinek', 'kávézóban'),
('helyszinek', 'moziban'),
('helyszinek', 'parkban'),
('helyszinek', 'étteremben'),
('helyszinek', 'bulin'),
('helyszinek', 'sétálva a városban'),
('helyszinek', 'a folyóparton'),
('helyszinek', 'egy koncerten'),
('helyszinek', 'a bevásárlóközpontban'),
('helyszinek', 'egy barátnál'),
('helyszinek', 'online, videóhívás közben'),
('helyszinek', 'az iskolában');

-- ============================================================
-- UTAZAS_HELY – Rövid helyszínnevek, ahogy valaki mondaná
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('utazas_hely', 'Párizs'),
('utazas_hely', 'Róma'),
('utazas_hely', 'Bali'),
('utazas_hely', 'Tokió'),
('utazas_hely', 'New York'),
('utazas_hely', 'Izland'),
('utazas_hely', 'Santorini'),
('utazas_hely', 'Maldív-szigetek'),
('utazas_hely', 'Barcelona'),
('utazas_hely', 'Dubaj'),
('utazas_hely', 'Prága'),
('utazas_hely', 'Amszterdam');

-- ============================================================
-- NAPSZAKOK – Napszakok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('napszakok', 'reggel'),
('napszakok', 'délelőtt'),
('napszakok', 'délben'),
('napszakok', 'délután'),
('napszakok', 'este'),
('napszakok', 'éjszaka'),
('napszakok', 'hajnalban'),
('napszakok', 'napkelte körül');

-- ============================================================
-- ITALOK – Italok, ahogy valaki mondaná
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('italok', 'kávé'),
('italok', 'tea'),
('italok', 'víz'),
('italok', 'narancslé'),
('italok', 'cappuccino'),
('italok', 'matcha'),
('italok', 'forró csokoládé'),
('italok', 'limonádé'),
('italok', 'zöld tea'),
('italok', 'hot dog'),
('italok', 'turmix'),
('italok', 'energiaital');

-- ============================================================
-- FILM_STILUS – Filmstílusok, röviden
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('film_stilus', 'vígjáték'),
('film_stilus', 'horror'),
('film_stilus', 'romantikus film'),
('film_stilus', 'akció'),
('film_stilus', 'sci-fi'),
('film_stilus', 'dráma'),
('film_stilus', 'thriller'),
('film_stilus', 'dokumentumfilm'),
('film_stilus', 'fantasy'),
('film_stilus', 'krimi');

-- ============================================================
-- SZINEK – Egyszerű színnevek
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('szinek', 'piros'),
('szinek', 'kék'),
('szinek', 'fehér'),
('szinek', 'fekete'),
('szinek', 'zöld'),
('szinek', 'sárga'),
('szinek', 'lila'),
('szinek', 'rózsaszín'),
('szinek', 'narancssárga'),
('szinek', 'bézs'),
('szinek', 'szürke'),
('szinek', 'barna');

-- ============================================================
-- HAZ_STILUS – Házstílusok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('haz_stilus', 'modern lakás'),
('haz_stilus', 'rönkház az erdőben'),
('haz_stilus', 'mediterrán villa'),
('haz_stilus', 'skandináv minimál'),
('haz_stilus', 'loft lakás'),
('haz_stilus', 'vidéki tanya'),
('haz_stilus', 'tengerparti ház'),
('haz_stilus', 'városközponti bérlet'),
('haz_stilus', 'kastélyszerű ház'),
('haz_stilus', 'kertváros');

-- ============================================================
-- BOSSZUSAG – Mi bosszant, röviden
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('bosszusag', 'ha lassú a net'),
('bosszusag', 'ha valaki hangosan rág'),
('bosszusag', 'ha késnek'),
('bosszusag', 'ha félbeszakítanak'),
('bosszusag', 'ha rendetlenség van'),
('bosszusag', 'ha hideg a kávé'),
('bosszusag', 'ha nincs parkolóhely'),
('bosszusag', 'ha elveszítem a kulcsom'),
('bosszusag', 'ha negatív valaki'),
('bosszusag', 'ha hosszú a sor'),
('bosszusag', 'ha rossz az időjárás'),
('bosszusag', 'ha megtelik a telefon tárhelye');

-- ============================================================
-- OLTOZKODES – Ruházkodási stílusok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('oltozkodes', 'kényelmes, laza'),
('oltozkodes', 'elegáns'),
('oltozkodes', 'sportos'),
('oltozkodes', 'klasszikus'),
('oltozkodes', 'streetwear'),
('oltozkodes', 'boho, színes'),
('oltozkodes', 'minimál, egyszerű'),
('oltozkodes', 'vintage'),
('oltozkodes', 'szinte mindig pizsamában'),
('oltozkodes', 'bármit, ami kényelmes');

-- ============================================================
-- KONYHA_TIPUS – Konyhák
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('konyha_tipus', 'magyar'),
('konyha_tipus', 'olasz'),
('konyha_tipus', 'ázsiai'),
('konyha_tipus', 'mexikói'),
('konyha_tipus', 'görög'),
('konyha_tipus', 'japán'),
('konyha_tipus', 'indiai'),
('konyha_tipus', 'koreai'),
('konyha_tipus', 'thai'),
('konyha_tipus', 'mediterrán'),
('konyha_tipus', 'american BBQ'),
('konyha_tipus', 'vegán');

-- ============================================================
-- HETVEGI_PROGRAM – Hétvégi tevékenységek
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('hetvegi_program', 'sorozatnézés'),
('hetvegi_program', 'túrázás'),
('hetvegi_program', 'főzés'),
('hetvegi_program', 'alvás'),
('hetvegi_program', 'wellness'),
('hetvegi_program', 'kirándulás'),
('hetvegi_program', 'barátokkal találkozni'),
('hetvegi_program', 'olvasás'),
('hetvegi_program', 'sport'),
('hetvegi_program', 'sütés'),
('hetvegi_program', 'pihenés otthon'),
('hetvegi_program', 'fesztivál vagy koncert');

-- ============================================================
-- ZENE_STILUS – Zenestílusok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('zene_stilus', 'pop'),
('zene_stilus', 'rock'),
('zene_stilus', 'jazz'),
('zene_stilus', 'elektronikus'),
('zene_stilus', 'hip-hop'),
('zene_stilus', 'klassszikus'),
('zene_stilus', 'R&B'),
('zene_stilus', 'indie'),
('zene_stilus', 'reggae'),
('zene_stilus', 'metal'),
('zene_stilus', 'K-pop'),
('zene_stilus', 'folk');

-- ============================================================
-- NASZUT_HELY – Nászút helyszínek
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('naszut_hely', 'Maldív-szigetek'),
('naszut_hely', 'Bali'),
('naszut_hely', 'Toszkána'),
('naszut_hely', 'Japán'),
('naszut_hely', 'Santorini'),
('naszut_hely', 'Karib-tenger'),
('naszut_hely', 'Izland'),
('naszut_hely', 'Marokkó'),
('naszut_hely', 'Thaiföld'),
('naszut_hely', 'Dubaj'),
('naszut_hely', 'Új-Zéland'),
('naszut_hely', 'Costa Rica');

-- ============================================================
-- GYEREK_SZAM – Gyerekszám
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('gyerek_szam', 'egyet sem'),
('gyerek_szam', 'egyet'),
('gyerek_szam', 'kettőt'),
('gyerek_szam', 'hármat'),
('gyerek_szam', 'minél többet'),
('gyerek_szam', 'még nem tudom'),
('gyerek_szam', 'az meg majd eldől'),
('gyerek_szam', 'inkább kutyát');

-- ============================================================
-- FUSZER – Fűszerek
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('fuszer', 'chili'),
('fuszer', 'fokhagyma'),
('fuszer', 'bazsalikom'),
('fuszer', 'fahéj'),
('fuszer', 'kurkuma'),
('fuszer', 'kömény'),
('fuszer', 'paprika'),
('fuszer', 'oregánó'),
('fuszer', 'gyömbér'),
('fuszer', 'kakukkfű'),
('fuszer', 'koriander'),
('fuszer', 'só és bors');

-- ============================================================
-- JATEKOK – Társasjátékok / játékok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('jatekok', 'Uno'),
('jatekok', 'Monopoly'),
('jatekok', 'Sakk'),
('jatekok', 'Dixit'),
('jatekok', 'Alias'),
('jatekok', 'Pictionary'),
('jatekok', 'Cluedo'),
('jatekok', 'Dobble'),
('jatekok', 'Kártyajáték'),
('jatekok', 'videójáték'),
('jatekok', 'DnD'),
('jatekok', 'Pandemic');

-- ============================================================
-- EKSZER – Ékszer típusok
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('ekszer', 'karóra'),
('ekszer', 'fülbevaló'),
('ekszer', 'nyaklánc'),
('ekszer', 'gyűrű'),
('ekszer', 'karkötő'),
('ekszer', 'medál'),
('ekszer', 'piercing'),
('ekszer', 'semmi – nem hordok');

-- ============================================================
-- FOTO_HELYSZIN – Közös fotók
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('foto_helyszin', 'a nyaraláson'),
('foto_helyszin', 'otthon, véletlenül'),
('foto_helyszin', 'az első közös képünk'),
('foto_helyszin', 'karácsonykor'),
('foto_helyszin', 'egy bulin'),
('foto_helyszin', 'naplementekor'),
('foto_helyszin', 'egy koncerten'),
('foto_helyszin', 'kávézóban'),
('foto_helyszin', 'egy séta közben');

-- ============================================================
-- TULAJDONSAG – Személyiségjegyek
-- ============================================================
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('tulajdonsag', 'a mosolyod'),
('tulajdonsag', 'a türelmed'),
('tulajdonsag', 'a humorod'),
('tulajdonsag', 'a kedvességed'),
('tulajdonsag', 'a magabiztosságod'),
('tulajdonsag', 'az empátiád'),
('tulajdonsag', 'a szemeid'),
('tulajdonsag', 'az okosságod'),
('tulajdonsag', 'a gondoskodásod'),
('tulajdonsag', 'a kreativitásod'),
('tulajdonsag', 'a bátorságod'),
('tulajdonsag', 'a határozottságod');

-- ============================================================
-- ÚJ KATEGÓRIÁK
-- ============================================================

-- ROMANTIKUS_GESZTUS
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('romantikus_gesztus', 'meglepetés vacsora'),
('romantikus_gesztus', 'szerelmes cetli'),
('romantikus_gesztus', 'reggeli az ágyba'),
('romantikus_gesztus', 'meglepetéskirándulás'),
('romantikus_gesztus', 'kézzel írott levél'),
('romantikus_gesztus', 'kedvenc étele elkészítve'),
('romantikus_gesztus', 'egy váratlan ölelés'),
('romantikus_gesztus', 'virágcsokor véletlenül');

-- HOBIK
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('hobik', 'olvasás'),
('hobik', 'festészet'),
('hobik', 'futás'),
('hobik', 'fotózás'),
('hobik', 'kézimunka'),
('hobik', 'növénygondozás'),
('hobik', 'horgászat'),
('hobik', 'podcast hallgatás'),
('hobik', 'kerékpározás'),
('hobik', 'programozás'),
('hobik', 'sorozatnézés'),
('hobik', 'zenélés');

-- KEDVENC_EVSZAK
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kedvenc_evszak', 'tavasz'),
('kedvenc_evszak', 'nyár'),
('kedvenc_evszak', 'ősz'),
('kedvenc_evszak', 'tél');

-- STRESSZ_OLDAS
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('stressz_oldas', 'séta'),
('stressz_oldas', 'zene'),
('stressz_oldas', 'alvás'),
('stressz_oldas', 'főzés'),
('stressz_oldas', 'sport'),
('stressz_oldas', 'panaszkodás'),
('stressz_oldas', 'meditáció'),
('stressz_oldas', 'fürdő'),
('stressz_oldas', 'videójáték'),
('stressz_oldas', 'barátokkal lenni');

-- SOROZAT_MUFAJ
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('sorozat_mufaj', 'krimi'),
('sorozat_mufaj', 'romantikus'),
('sorozat_mufaj', 'fantasy'),
('sorozat_mufaj', 'reality show'),
('sorozat_mufaj', 'dokumentumfilm'),
('sorozat_mufaj', 'dráma'),
('sorozat_mufaj', 'sci-fi'),
('sorozat_mufaj', 'anime'),
('sorozat_mufaj', 'thriller'),
('sorozat_mufaj', 'vígjáték');

-- KEDVENC_DESZER
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kedvenc_deszer', 'fagylalt'),
('kedvenc_deszer', 'tiramisu'),
('kedvenc_deszer', 'brownie'),
('kedvenc_deszer', 'sajttorta'),
('kedvenc_deszer', 'rétes'),
('kedvenc_deszer', 'palacsinta'),
('kedvenc_deszer', 'churros'),
('kedvenc_deszer', 'csokoládétorta'),
('kedvenc_deszer', 'mákos guba'),
('kedvenc_deszer', 'gyümölcssaláta');

-- REGGELI_RITUAL
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('reggeli_ritual', 'telefon nézés'),
('reggeli_ritual', 'kávézás'),
('reggeli_ritual', 'zuhanyozás'),
('reggeli_ritual', 'reggeli hírek'),
('reggeli_ritual', 'jóga'),
('reggeli_ritual', 'még tíz perc alvás'),
('reggeli_ritual', 'séta'),
('reggeli_ritual', 'napló írás');

-- SZEMELISEG
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('szemeliseg', 'introvertált'),
('szemeliseg', 'extrovertált'),
('szemeliseg', 'ambivertált'),
('szemeliseg', 'kalandvágyó'),
('szemeliseg', 'nyugodt'),
('szemeliseg', 'energikus'),
('szemeliseg', 'szervezett'),
('szemeliseg', 'spontán'),
('szemeliseg', 'álmodozó'),
('szemeliseg', 'empatikus');

-- AUTO_STILUS
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('auto_stilus', 'elektromos autó'),
('auto_stilus', 'kis városi autó'),
('auto_stilus', 'sportautó'),
('auto_stilus', 'SUV'),
('auto_stilus', 'kombi'),
('auto_stilus', 'pickup'),
('auto_stilus', 'vintage kabrió'),
('auto_stilus', 'minivan');

-- ETEL_TIPUS
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('etel_tipus', 'tükörtojás pirítóssal'),
('etel_tipus', 'müzli joghurttal'),
('etel_tipus', 'avocado toast'),
('etel_tipus', 'szendvics'),
('etel_tipus', 'palacsinta'),
('etel_tipus', 'omlett'),
('etel_tipus', 'smoothie'),
('etel_tipus', 'péksütemény');

-- AJANDEK
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('ajandek', 'közös élmény'),
('ajandek', 'könyv'),
('ajandek', 'ékszer'),
('ajandek', 'utazás'),
('ajandek', 'kézzel készített ajándék'),
('ajandek', 'wellness'),
('ajandek', 'technológia'),
('ajandek', 'ruha vagy cipő');

-- JOVOKEP
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('jovokep', 'vidéken, kerttel'),
('jovokep', 'városban'),
('jovokep', 'tengerparton'),
('jovokep', 'más országban'),
('jovokep', 'ahol most vagyunk'),
('jovokep', 'kis faluban'),
('jovokep', 'digitális nomádként');

-- KOZOS_EMLEKEK
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kozos_emlekek', 'az első közös nyaralásunk'),
('kozos_emlekek', 'az első randevúnk'),
('kozos_emlekek', 'amikor elvesztünk egy idegen városban'),
('kozos_emlekek', 'az a hosszú éjszakás buli'),
('kozos_emlekek', 'az első közös főzésünk'),
('kozos_emlekek', 'amikor megleptelek'),
('kozos_emlekek', 'a legjobb közös karácsonyunk');

-- MOZIS_SZOKASOK
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('mozis_szokasok', 'nagy vödrös popcorn'),
('mozis_szokasok', 'M&M s és kóla'),
('mozis_szokasok', 'nachos'),
('mozis_szokasok', 'semmi'),
('mozis_szokasok', 'csempészett szendvics'),
('mozis_szokasok', 'fagylalt'),
('mozis_szokasok', 'gumicukor'),
('mozis_szokasok', 'chips');

-- ALTALANOS – Általános tartalék válaszok (ha nincs kategória-egyezés)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('altalanos', 'az első'),
('altalanos', 'a második'),
('altalanos', 'talán'),
('altalanos', 'valami más'),
('altalanos', 'nem tudni'),
('altalanos', 'mindegyik'),
('altalanos', 'egyik sem'),
('altalanos', 'a szituációtól függ');

-- ============================================================
-- FUNNY_MESSAGES – Teljes csere, sokkal több és változatosabb
-- ============================================================

TRUNCATE TABLE `funny_messages`;

INSERT INTO `funny_messages` (`message_text`, `type`) VALUES
-- WRONG (elhibázott válasz)
('Ezt még a Google sem tudta volna ennyire elrontani... 🔍', 'wrong'),
('Biztos, hogy ismeritek egymást? Ezt illene tudnod! 😅', 'wrong'),
('Majdnem! (De tényleg csak majdnem.)', 'wrong'),
('Úgy tűnik, ma este te mosogatsz. 🍽️', 'wrong'),
('Ezt most úgy teszünk, mintha meg sem történt volna.', 'wrong'),
('Valakinek jobban oda kellett volna figyelni... 👀', 'wrong'),
('A jó hír: legalább próbálkoztál. 💪', 'wrong'),
('Ha ez egy vizsga lenne, most megbuktál. De nem az!', 'wrong'),
('Pszt... a helyes válasz a másik volt. 🤫', 'wrong'),
('Ez a tipp annyira meglepő, hogy szinte művészet.', 'wrong'),
('Legközelebb talán jobban megy! Kitartás ❤️', 'wrong'),
('Nem ez volt... de szeretünk így is! 😄', 'wrong'),
('Ajjaj. Ez fájt mindkettőtöknek. 💔', 'wrong'),
('Lehet, hogy kicsit többet kellene egymással beszélgetni? 😏', 'wrong'),
('Biztosan van magyarázatod erre a válaszra. Hallgatjuk...', 'wrong'),
('Hmmm. Nem ez volt. Próbálj meg jobban odafigyelni! 🤍', 'wrong'),
('Az optimizmus szép dolog, de ez sem volt jó. 😂', 'wrong'),
('Közel voltál! (Nem, nem voltál közel.)', 'wrong'),
('Érdekes választás. Merész. Rossz, de merész.', 'wrong'),
('A párod most valószínűleg csóválja a fejét.', 'wrong'),

-- GAME_OVER (elfogytak az életek)
('Elfogytak az életek! De a szerelem nem fogy el ennyire könnyen. ❤️', 'game_over'),
('Game Over – de a kvíz újraindítható, a kapcsolat nem törhet meg.', 'game_over'),
('Ez a vége... egyelőre. Próbáld újra, legközelebb biztosan sikerül! 💪', 'game_over'),
('A párod most nevet. Sokat. 😄 Próbáljátok meg újra!', 'game_over'),
('Nincs több élet, de azért még szeretnek. Valószínűleg.', 'game_over');
