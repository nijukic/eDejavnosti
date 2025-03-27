# Aplikacija za vodenje prijav na dejavnosti v šoli

To je zaključna naloga, izdelana v okviru poklicne mature na Srednji tehnični in poklicni šoli Trbovlje. Aplikacija omogoča organizacijo in vodenje prijav dijakov na različne dejavnosti v šoli (npr. športni dnevi, projektni dnevi ipd.). Projekt je zasnovan z mislijo na lažje upravljanje dejavnosti in beleženje prisotnosti ter nudi različne funkcionalnosti glede na tip uporabnika.

## Povzetek

Namen naloge je izdelati spletno aplikacijo, ki omogoča prijavo dijakov na dejavnosti. V aplikaciji so implementirani trije tipi uporabnikov:
- **Dijak:** Lahko se prijavi na dejavnosti in spremlja svoje prijave (potekajoče in zaključene).
- **Profesor:** Ustvarja dejavnosti, potrjuje ali zavrača prijave dijakov ter vodi beleženje prisotnosti.
- **Administrator:** Poleg funkcij dijaka in profesorja upravlja tudi z uporabniškimi računi, avtomatsko razvršča dijake in izvaja uvoz/izvoz podatkov (PDF/CSV).

## Uporabljena orodja in tehnologije

- **Ogrodje CodeIgniter:** Osnova aplikacije, ki sledi model-view-controller (MVC) arhitekturi.
- **PHP:** Spletni programski jezik za strežniško logiko.
- **HTML5:** Standardiziran označevalni jezik za strukturiranje vsebine.
- **CSS:** Oblikovanje in stilizacija spletnih strani.
- **JavaScript:** Skriptni jezik za interaktivnost uporabniškega vmesnika.
- **MySQL in phpMyAdmin:** Upravljanje z relacijskimi podatkovnimi bazami.
- **APACHE:** Spletni strežnik, ki omogoča delovanje aplikacije.
- **Bootstrap:** Okvir za odzivno oblikovanje strani, ki omogoča prilagodljivost na različnih napravah.

**Zagon aplikacije:**
   - Zaženite program **usbwebserver.exe**.
   - Kliknite na tipko **localhost** znotraj usbwebserver programa.
   - V brskalniku se odpre aplikacija, kjer se lahko prijavite v testni račun:
     - **E-pošta:** `admin@mail.com`
     - **Geslo:** `testtest`
