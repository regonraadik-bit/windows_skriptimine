# 1. Küsime kasutajalt ees- ja perenime
$Eesnimi = Read-Host "Sisesta kustutatava kasutaja eesnimi"
$Perenimi = Read-Host "Sisesta kustutatava kasutaja perenimi"

# 2. Moodustame kasutajanime (eesnimi.perenimi) ja teeme väikesteks tähtedeks
# See on vajalik, et nimi klapiks täpselt loomise loogikaga
$KasutajaNimi = "$Eesnimi.$Perenimi".ToLower()

# 3. Kustutame kasutaja
# Kasutame käsku Remove-LocalUser (mitte ADUser, kuna teeme seda kohalikus arvutis)
# -ErrorAction SilentlyContinue peidab punase veateate, kui kasutajat ei leita
Remove-LocalUser -Name $KasutajaNimi -ErrorAction SilentlyContinue

# 4. Kontrollime, kas käsk õnnestus või mitte ($? muutuja abil)
if ($?) {
    # Kui $? on True, siis kustutamine õnnestus
    Write-Host "Edukas: Kasutaja '$KasutajaNimi' on süsteemist kustutatud." -ForegroundColor Green
} else {
    # Kui $? on False, siis tekkis viga (nt kasutajat polnud olemas)
    Write-Host "Viga: Kasutaja '$KasutajaNimi' kustutamine ebaõnnestus. Kontrolli nime või kas kasutaja on olemas." -ForegroundColor Red
}