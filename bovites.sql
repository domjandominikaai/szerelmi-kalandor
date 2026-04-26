-- ============================================================
-- SZERELMI KALANDOR – Adatbázis bővítés
-- Importálás: phpMyAdmin → Importálás → ezt a fájlt töltsd fel
-- ============================================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- ============================================================
-- 1. TEMPLATE_QUESTIONS – Új kérdések (id 24-től)
-- ============================================================

INSERT INTO `template_questions` (`question_text`, `category`) VALUES

-- Személyiség és szokások
('Mi az első dolog, amit reggel csinálok?', 'reggeli_ritual'),
('Hogyan töltöm el az időmet, ha egyedül vagyok otthon?', 'hetvegi_program'),
('Milyen típusú ember vagyok: introvertált vagy extrovertált?', 'szemeliseg'),
('Mit csinálok, ha stresszes vagyok?', 'stressz_oldas'),
('Melyik hobbim veszi el a legtöbb időmet?', 'hobik'),
('Mi volt az álmom gyerekként – mi szerettem volna lenni?', 'alomszakma'),
('Melyik évszakban érzem magam a legjobban?', 'kedvenc_evszak'),

-- Pár-specifikus
('Mi volt az, ami miatt először feltűntél nekem?', 'tulajdonsag'),
('Mi az a szokásod, amit a legjobban imádok?', 'tulajdonsag'),
('Mi az, amit mindig te csinálsz meg kettőnk közül?', 'szerepek'),
('Mi volt az első film, amit együtt néztük?', 'kozos_emlekek'),
('Hol volt az első csókunk?', 'helyszinek'),
('Mi az a dal, ami minket juttat eszembe?', 'zene_stilus'),
('Mi az a dolog, ami miatt mindig mosolyra derít?', 'tulajdonsag'),
('Mi a legviccesebb közös emlékünk?', 'kozos_emlekek'),
('Ha most azonnal el tudnánk utazni valahová, hová mennénk?', 'utazas_hely'),
('Mi az a szó, ami legjobban jellemez téged?', 'szemeliseg'),
('Mit vennék neked ajándékba, ha bármit választhatnék?', 'ajandek'),

-- Jövő és álmok
('Hol képzelem el magunkat 10 év múlva?', 'jovokep'),
('Mi az a vödrös listás dolog, amit feltétlenül együtt akarunk megcsinálni?', 'jovokep'),
('Milyen állatot tartanánk, ha lehetne?', 'allatok'),
('Milyen autóban képzelem el magunkat 5 év múlva?', 'auto_stilus'),

-- Ételek és ízlés
('Melyik a kedvenc desszertem?', 'kedvenc_deszer'),
('Mit rendelek mindig, ha pizzát eszünk?', 'etel_tipus'),
('Mi a kedvenc reggelim?', 'etel_tipus'),
('Melyik a kedvenc éttermünk/ételtípusunk?', 'konyha_tipus'),

-- Szórakozás
('Melyik sorozattípust nézem a legszívesebben?', 'sorozat_mufaj'),
('Melyik volt a legjobb közös élményünk eddig?', 'kozos_emlekek'),
('Mi az, amit sosem unok meg csinálni veled?', 'kozos_emlekek'),
('Melyik a kedvenc romantikus gesztus, amit kaphatok?', 'romantikus_gesztus'),
('Mi az, amit sosem hagynék ki, ha moziba megyek?', 'mozis_szokasok'),
('Melyik a kedvenc évszakom az utazáshoz?', 'kedvenc_evszak');


-- ============================================================
-- 2. ANSWER_POOL – Bővítések meglévő kategóriákhoz
-- ============================================================

-- ALLATOK (volt: 4, +10 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('allatok', 'Nyuszi'),
('allatok', 'Kutya – Golden Retriever'),
('allatok', 'Macska – Maine Coon'),
('allatok', 'Teknős'),
('allatok', 'Sün'),
('allatok', 'Mókus'),
('allatok', 'Lama'),
('allatok', 'Pingvin'),
('allatok', 'Róka'),
('allatok', 'Delfin');

-- GYUMOLCS (volt: 4, +8 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('gyumolcs', 'Cseresznye'),
('gyumolcs', 'Görögdinnye'),
('gyumolcs', 'Barack'),
('gyumolcs', 'Áfonya'),
('gyumolcs', 'Gránátalma'),
('gyumolcs', 'Lime'),
('gyumolcs', 'Papaya'),
('gyumolcs', 'Málna');

-- DATUMOK (volt: 4, +8 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('datumok', 'Február 14.'),
('datumok', 'Október 23.'),
('datumok', 'Április 4.'),
('datumok', 'December 6.'),
('datumok', 'Augusztus 20.'),
('datumok', 'Július 1.'),
('datumok', 'November 11.'),
('datumok', 'Május 1.');

-- HELYSZINEK (volt: 6, +8 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('helyszinek', 'Egy csendes könyvtárban'),
('helyszinek', 'A kedvenc padunkon a parkban'),
('helyszinek', 'Egy borkóstolón'),
('helyszinek', 'Közös főzőkurzuson'),
('helyszinek', 'Egy koncerten a tömegben'),
('helyszinek', 'Az egyik szüleim vacsoráján'),
('helyszinek', 'Egy szabadtéri fesztiválon'),
('helyszinek', 'Online – videóhívás közben');

-- NAPSZAKOK (volt: 4, +5 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('napszakok', 'Reggel, első kávé előtt'),
('napszakok', 'Éjfél után, amikor csend van'),
('napszakok', 'Déli napsütésben'),
('napszakok', 'Esti szürkületkor'),
('napszakok', 'Vasárnap délután, semmittevés közben');

-- ITALOK (volt: 6, +7 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('italok', 'Hab nélküli cappuccino'),
('italok', 'Jeges citromos limonádé'),
('italok', 'Gyömbéres tea mézzel'),
('italok', 'Matcha latte'),
('italok', 'Csokoládés turmix'),
('italok', 'Sima szódavíz'),
('italok', 'Friss mentás víz');

-- FILM_STILUS (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('film_stilus', 'Izgalmas krimi-thriller'),
('film_stilus', 'Animációs mesefilm'),
('film_stilus', 'Igaz történeten alapuló életrajzi film'),
('film_stilus', 'Kalandos fantasy'),
('film_stilus', 'Csavaros noir dráma'),
('film_stilus', 'Önfejlesztő dokumentumfilm');

-- SZINEK (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('szinek', 'Melegséget árasztó terrakotta'),
('szinek', 'Frissítő menta zöld'),
('szinek', 'Nyugodt lavendula lila'),
('szinek', 'Természetes homokbézs'),
('szinek', 'Mélységet adó fekete'),
('szinek', 'Derűs égkék');

-- HAZ_STILUS (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('haz_stilus', 'Bohém, növényekkel teli otthon'),
('haz_stilus', 'Japán wabi-sabi stílusú lakás'),
('haz_stilus', 'Vidéki tanya, nagy kerttel'),
('haz_stilus', 'Franciás, zsúfolt könyvespolcos lakás'),
('haz_stilus', 'Tengerparti házikó, fehér falakkal'),
('haz_stilus', 'Modern, teljesen okosotthon');

-- BOSSZUSAG (volt: 6, +7 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('bosszusag', 'Ha valaki nem kapcsolja le a villanyt'),
('bosszusag', 'Ha nem tudok parkolni'),
('bosszusag', 'Ha megszakítanak mesélés közben'),
('bosszusag', 'Ha valaki elkési a megbeszélt időpontot'),
('bosszusag', 'Ha rossz az étel a rendelésemnél'),
('bosszusag', 'Ha elveszítem a telefonomat'),
('bosszusag', 'Ha valaki negatív mindenkire');

-- OLTOZKODES (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('oltozkodes', 'Letisztult fehér ing és chino'),
('oltozkodes', 'Vagány, fekete bőrdzseki'),
('oltozkodes', 'Virágmintás nyári ruha'),
('oltozkodes', 'Kényelmes oversized pulóver'),
('oltozkodes', 'Trendi streetwear szett'),
('oltozkodes', 'Elegáns kosztüm vagy öltöny');

-- KONYHA_TIPUS (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('konyha_tipus', 'Illatos indiai curry'),
('konyha_tipus', 'Friss libanoni meze'),
('konyha_tipus', 'Gazdag vietnami pho'),
('konyha_tipus', 'Hagyományos olasz tészta'),
('konyha_tipus', 'Könnyű vegán tál'),
('konyha_tipus', 'Fúziós koreai ételek');

-- HETVEGI_PROGRAM (volt: 6, +7 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('hetvegi_program', 'Közös sütés-főzés új recepttel'),
('hetvegi_program', 'Piacozás és lassú reggeli'),
('hetvegi_program', 'Könyvklub vagy filmmaraton'),
('hetvegi_program', 'Kerékpározás a városban'),
('hetvegi_program', 'Kézimunka vagy festészet'),
('hetvegi_program', 'Spontán útra kelés autóval'),
('hetvegi_program', 'Wellnessnap otthon, fürdőkád és gyertyák');

-- ZENE_STILUS (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('zene_stilus', 'Fülbemászó K-pop slágerek'),
('zene_stilus', 'Lelket simogató soul és R&B'),
('zene_stilus', 'Vidám reggae ritmusok'),
('zene_stilus', 'Klasszikus barokk zene'),
('zene_stilus', 'Hangulatos indie folk'),
('zene_stilus', 'Energikus latin ritmus');

-- NASZUT_HELY (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('naszut_hely', 'Romantikus Santorini'),
('naszut_hely', 'Egzotikus Bali'),
('naszut_hely', 'Varázslatos Prága'),
('naszut_hely', 'Kalandos Costa Rica'),
('naszut_hely', 'Lenyűgöző Új-Zéland'),
('naszut_hely', 'Kulturális Marokkó');

-- FUSZER (volt: 6, +5 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('fuszer', 'Édes paprika'),
('fuszer', 'Illatos kömény'),
('fuszer', 'Mediterrán oregánó'),
('fuszer', 'Egzotikus kurkuma'),
('fuszer', 'Friss koriander');

-- JATEKOK (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('jatekok', 'Kooperatív Pandemic'),
('jatekok', 'Kreatív Pictionary'),
('jatekok', 'Vicces Alias'),
('jatekok', 'Misztikus Cluedo'),
('jatekok', 'Agyalós Nyomkereső'),
('jatekok', 'Szórakoztató Dobble');

-- EKSZER (volt: 6, +4 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('ekszer', 'Finom ezüst karkötő'),
('ekszer', 'Charm-os nyaklánc'),
('ekszer', 'Minimál arany karikagyűrű'),
('ekszer', 'Különleges köves medál');

-- FOTO_HELYSZIN (volt: 6, +6 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('foto_helyszin', 'Egy spontán selfie az utcán'),
('foto_helyszin', 'A legjobb bulinkon éjfél után'),
('foto_helyszin', 'Egy romantikus naplementekor'),
('foto_helyszin', 'Egy közös főzés közben'),
('foto_helyszin', 'Az első közös karácsonyon'),
('foto_helyszin', 'Egy vidám állatkertben');

-- TULAJDONSAG (volt: 6, +8 új)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('tulajdonsag', 'A határozottságod'),
('tulajdonsag', 'A kreativitásod'),
('tulajdonsag', 'A gondoskodó természeted'),
('tulajdonsag', 'A lelkesedésed minden iránt'),
('tulajdonsag', 'Az, hogy mindig megtalálod a pozitívumot'),
('tulajdonsag', 'A bátorságod kimondani, amit gondolsz'),
('tulajdonsag', 'A szorgalmad és kitartásod'),
('tulajdonsag', 'Az, hogy sosem ítélsz meg mások döntéseit');

-- ============================================================
-- 3. ÚJ KATEGÓRIÁK AZ ANSWER_POOL-BAN
-- ============================================================

-- ROMANTIKUS_GESZTUS (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('romantikus_gesztus', 'Meglepetés vacsora főzve otthon'),
('romantikus_gesztus', 'Apró szerelmes cetlik a lakásban'),
('romantikus_gesztus', 'Közös tánc a nappaliban zene nélkül'),
('romantikus_gesztus', 'Egy váratlan ölelés hátulról'),
('romantikus_gesztus', 'Reggeli a kedvenc kávéjával az ágyba hozva'),
('romantikus_gesztus', 'Egy handwritten levél a postaládában'),
('romantikus_gesztus', 'Meglepetés kirándulás ismeretlen helyre'),
('romantikus_gesztus', 'Kedvenc filmje előkészítve popcornnal');

-- HOBIK (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('hobik', 'Festészet vagy rajzolás'),
('hobik', 'Növények gondozása'),
('hobik', 'Fotózás'),
('hobik', 'Horgászat'),
('hobik', 'Olvasás'),
('hobik', 'Podcast hallgatás'),
('hobik', 'Kézimunka és varrás'),
('hobik', 'Futás vagy kerékpározás');

-- KEDVENC_EVSZAK (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kedvenc_evszak', 'Tavasz – virágzás és megújulás'),
('kedvenc_evszak', 'Nyár – napsütés és lazítás'),
('kedvenc_evszak', 'Ősz – kabátok és forró tea'),
('kedvenc_evszak', 'Tél – hó és meleg otthon');

-- STRESSZ_OLDAS (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('stressz_oldas', 'Hosszú séta a friss levegőn'),
('stressz_oldas', 'Meditáció vagy jóga'),
('stressz_oldas', 'Zenehallgatás teljes hangerőn'),
('stressz_oldas', 'Forró fürdő gyertyafénynél'),
('stressz_oldas', 'Főzés vagy sütés'),
('stressz_oldas', 'Videójáték egyedül'),
('stressz_oldas', 'Panaszkodás a legjobb barátomnak'),
('stressz_oldas', 'Alvás – sokat és mélyen');

-- SOROZAT_MUFAJ (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('sorozat_mufaj', 'Krimi és mystery thriller'),
('sorozat_mufaj', 'Romantikus vígjáték'),
('sorozat_mufaj', 'Fantasy és sci-fi kaland'),
('sorozat_mufaj', 'Valóságshow és reality'),
('sorozat_mufaj', 'Dokumentumfilm és true crime'),
('sorozat_mufaj', 'Dráma és életrajz'),
('sorozat_mufaj', 'Animáció vagy anime'),
('sorozat_mufaj', 'Természettudományos ismeretterjesztő');

-- KEDVENC_DESZER (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kedvenc_deszer', 'Csokoládétorta tejszínhabbal'),
('kedvenc_deszer', 'Fagylalt – kettős gombóc'),
('kedvenc_deszer', 'Tiramisu'),
('kedvenc_deszer', 'Friss gyümölcssaláta'),
('kedvenc_deszer', 'Brownie meleg szósszal'),
('kedvenc_deszer', 'Sajttorta'),
('kedvenc_deszer', 'Rétes almával és fahéjjal'),
('kedvenc_deszer', 'Churros csokikrémmel');

-- REGGELI_RITUAL (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('reggeli_ritual', 'Telefon – azonnal megnyitom'),
('reggeli_ritual', 'Kávé – előbb nem vagyok ember'),
('reggeli_ritual', 'Zuhany – csak utána élek'),
('reggeli_ritual', 'Jóga vagy nyújtás'),
('reggeli_ritual', 'Reggeli hír és podcast'),
('reggeli_ritual', 'Tíz percig csak fekszem csendben'),
('reggeli_ritual', 'Napló írás vagy tervek'),
('reggeli_ritual', 'Séta a kutyával vagy friss levegőn');

-- SZEMELISEG (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('szemeliseg', 'Határozott és céltudatos'),
('szemeliseg', 'Kalandvágyó és spontán'),
('szemeliseg', 'Nyugodt és megfontolt'),
('szemeliseg', 'Kreatív és álmodozó'),
('szemeliseg', 'Empatikus és gondoskodó'),
('szemeliseg', 'Vidám és energia-bomba'),
('szemeliseg', 'Elvonult és introspektív'),
('szemeliseg', 'Szervezett és precíz');

-- AUTO_STILUS (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('auto_stilus', 'Elektromos SUV – csendes és modern'),
('auto_stilus', 'Kis városi autó – könnyű parkolás'),
('auto_stilus', 'Vintage kabrió – romantika az úton'),
('auto_stilus', 'Sportautó – egyszer élünk'),
('auto_stilus', 'Luxus limuzin – csak a legjobb'),
('auto_stilus', 'Kombi – praktikus és kényelmes'),
('auto_stilus', 'Pickup – kaland és természet'),
('auto_stilus', 'Minibusz – nagy család, nagy álom');

-- ETEL_TIPUS (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('etel_tipus', 'Tejföl és metélttészta'),
('etel_tipus', 'Avocado toast tojással'),
('etel_tipus', 'Granola joghurttal és mézzel'),
('etel_tipus', 'Szendvics – minden van benne'),
('etel_tipus', 'Tükörtojás pirítóssal'),
('etel_tipus', 'Smoothie tál'),
('etel_tipus', 'Sajtos omlett'),
('etel_tipus', 'Pancake mézzel');

-- AJANDEK (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('ajandek', 'Közös élményt – kirándulás vagy koncert'),
('ajandek', 'Könyvet – amit tudtam, hogy szeretnéd'),
('ajandek', 'Kézzel készített ajándékot'),
('ajandek', 'Wellness hétvégét'),
('ajandek', 'Kedvenc ételből készült kosarat'),
('ajandek', 'Meglepetésutazást'),
('ajandek', 'Egy különleges ékszert'),
('ajandek', 'Az álmai gadgetet vagy technológiát');

-- JOVOKEP (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('jovokep', 'Vidéken, nagy kertben és csendben'),
('jovokep', 'Városban, pörgős élettel'),
('jovokep', 'Tengerparton, meleg égöv alatt'),
('jovokep', 'Más országban, kalandos életet élve'),
('jovokep', 'Ott ahol most vagyunk, csak boldogabban'),
('jovokep', 'Egy kis faluban, egyszerűen'),
('jovokep', 'Felváltva mindenhol – digitális nomádok');

-- KOZOS_EMLEKEK (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('kozos_emlekek', 'Az első közös nyaralásunk'),
('kozos_emlekek', 'Az a buli, ahonnan hajnalban értünk haza'),
('kozos_emlekek', 'Amikor elveszítettük magunkat egy idegen városban'),
('kozos_emlekek', 'A legjobb közös főzésünk eredménye'),
('kozos_emlekek', 'Az első vitánk és kibékülésünk'),
('kozos_emlekek', 'Amikor együtt néztük a kedvenc sorozatunkat'),
('kozos_emlekek', 'Az a csöndes este, ami valahogy tökéletes volt');

-- MOZIS_SZOKASOK (új kategória)
INSERT INTO `answer_pool` (`category`, `answer_text`) VALUES
('mozis_szokasok', 'Óriási vödrös popcorn vajjal'),
('mozis_szokasok', 'M&M s csokoládé és Coca-Cola'),
('mozis_szokasok', 'Csak víz – diétázom'),
('mozis_szokasok', 'Csempészett szendvics a táskából'),
('mozis_szokasok', 'Nachos salsa szósszal'),
('mozis_szokasok', 'Fagylalt az előtérből'),
('mozis_szokasok', 'Semmi – a film elég'),
('mozis_szokasok', 'Gumicukor és chips kombinálva');


-- ============================================================
-- 4. FUNNY_MESSAGES – Több vicces üzenet
-- ============================================================

INSERT INTO `funny_messages` (`message_text`, `type`) VALUES
-- wrong típus (elhibázott válasz)
('Valakinek figyelnie kellett volna a páros estéken... 🕵️', 'wrong'),
('Tipp: a helyes válasz nem az volt, amit választottál.', 'wrong'),
('Ez nem az a válasz. Ez határozottan nem az a válasz.', 'wrong'),
('Megpróbálhatod megmagyarázni, de nem fog menni.', 'wrong'),
('A párod valahol most sóhajt egyet. Biztos.', 'wrong'),
('Ez volt a legrosszabb tipp az egész kvíz alatt. Szeretünk!', 'wrong'),
('Újabb bizonyíték, hogy a szerelem vak. ❤️', 'wrong'),
('Ha ez egy vizsga lenne, most megbuktál. De nem az – szóval rendben!', 'wrong'),
('Pszt... a helyes válasz lett volna a másik.', 'wrong'),
('Ez a tipp annyira rossz, hogy szinte művészet.', 'wrong'),
('Emlékszel a párod születésnapjára? Mert most kicsit aggódunk.', 'wrong'),
('Lehet, hogy kicsit jobban oda kéne figyelni egymásra? Csak ötlet.', 'wrong'),
('Ez a válasz ugyanolyan meglepő volt, mint egy kedd.', 'wrong'),
('Hmmm. Nem ez volt. Próbálj meg jobban odafigyelni. 🤍', 'wrong'),
('A jó hír: szeretjük, hogy próbálkozol. A rossz hír: ez sem jó volt.', 'wrong'),

-- game_over típus (elfogyott az élet)
('Elfogytak az életek! De a szerelem nem fogy el ennyire könnyen. ❤️', 'game_over'),
('Game Over – de a kvíz újraindítható, a szív nem törhet meg.', 'game_over'),
('Ez a vége... egyelőre. Próbáld újra, hátha jobban megy! 💪', 'game_over'),
('A párod most valószínűleg nevet. Sokat. 😄', 'game_over');
