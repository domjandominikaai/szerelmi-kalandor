# ❤️ Szerelmi Kalandor
### *Interaktív Párkapcsolati Kvíz & Digitális Meglepetés*

![Angular](https://img.shields.io/badge/Frontend-Angular%2017-red?style=for-the-badge&logo=angular)
![PHP](https://img.shields.io/badge/Backend-PHP%208-777BB4?style=for-the-badge&logo=php)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql)

A **Szerelmi Kalandor** egy egyedi, webalapú alkalmazás, amivel **személyre szabott kvízeket** készíthetsz a párodnak. A cél az egymás jobb megismerése és a közös szórakozás: ha a párod kitalálja a válaszaidat, egy **digitális kaparós sorsjeggyel** "lekaparhatja" a megérdemelt jutalmát.

---

## ✨ Főbb Funkciók

* **🎨 Egyedi Kvíz Szerkesztő:** Adj meg saját címet és válaszokat a véletlenszerűen generált kérdésekhez.
* **🧠 Intelligens Opciók:** Te csak a **helyes választ** adod meg, a rendszer automatikusan generál mellé rossz válaszokat az adatbázisból.
* **🏁 Kétfázisú Játékmenet:**
    1. **Válaszadás:** Te rögzíted a titkos válaszaidat.
    2. **Kitalálás:** A párod megpróbálja eltalálni őket.
* **🎁 Kaparós Sorsjegy:** Sikeres kvíz után egy interaktív, **Canvas-alapú** felületen kaparható ki a nyeremény (pl. vacsora, masszázs).
* **📱 Mobil-optimalizált Design:** Hosszúkás, elegáns kártya-alapú elrendezés, **lebegő szívek** és retro postai stílus.

---

## 🛠️ Telepítés és Beállítás
```bash
npm install
ng serve --host 0.0.0.0

## 🗄️ Adatbázis Beállítása

A projekt tartalmaz egy kiexportált adatbázis fájlt a gyökérmappában (pl. `szerelmi_kalandor(1).sql`).

**Telepítés lépései:**
1. Hozz létre egy `szerelmi_kalandor` nevű adatbázist a phpMyAdmin-ban.
2. Kattints az **Importálás** fülre.
3. Válaszd ki a projektben található `.sql` fájlt és nyomj az **Indítás** gombra.

---

### Táblák szerkezete (Referencia)
*Csak tájékoztató jelleggel, ha manuálisan ellenőriznéd:*

**1. Kérdések (questions)** - Alapértelmezett kérdések tárolása.
**2. Jutalmak (rewards)** - Sorsolható kuponok listája.
... (stb.)

### 2. Backend konfiguráció
1. Másold a `backend` mappát a webszervered (pl. XAMPP/MAMP) `htdocs` könyvtárába.
2. Állítsd be a hozzáférést a `backend/api/db.php` fájlban:
    * **$servername**: "localhost"
    * **$username**: "root"
    * **$password**: "root" (vagy "")
    * **$dbname**: "szerelmi_kalandor"

### 3. Frontend indítása
Nyiss egy terminált az Angular projekt mappájában:
Fontos: A --host opció szükséges a mobilról való teszteléshez! Ehhez a parancssorba (CMD) írd be, hogy ipconfig, keresd meg az IPv4-címet, és a telefonodon írd a böngészőbe: http://192.168.x.x:4200.

### 🗄️ Adatbázis Struktúra (MySQL)
A projekt futtatásához hozd létre az alábbi táblákat:

**1. Kérdések (questions)**
SQL
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(255) NOT NULL,
    category VARCHAR(50) DEFAULT 'altalanos'
);

**2. Jutalmak (rewards)**
SQL
CREATE TABLE rewards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

**3. Kvízek (quizzes)**
SQL
CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unique_code VARCHAR(10) UNIQUE NOT NULL,
    title VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

**🔧 Beállítási tipp az IP címhez (Mobil tesztelés)**
Mivel a projektet telefonról is teszteljük, ne felejtsd el:

**Backend URL:** A quiz-editor-component.ts és player-component.ts fájlokban a http://localhost/... címeket cseréld le a géped belső IP címére (pl. http://192.168.1.XX/...).

**CORS:** A PHP fájlok fejlécében engedélyezve van az Access-Control-Allow-Origin: *, így a telefonod nem fogja blokkolni a kéréseket.

**No-Select:** A kaparós felületen a CSS user-select: none beállítást használ, hogy a kaparás ne indítson el véletlen szövegkijelölést.

### 📝 Fejlesztői Megjegyzés
A projekt folyamatos fejlesztés alatt áll. A legutóbbi frissítések tartalmazzák:

✅ Központosított db.php (mysqli) használata.

✅ Hosszúkás, mobil-fókuszú kártya design.

✅ Dinamikus jutalom-sorsolás (ORDER BY RAND()).

Készült ❤️-tel, kifejezetten pároknak.

