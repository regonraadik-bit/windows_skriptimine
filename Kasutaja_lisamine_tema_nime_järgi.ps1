# 1. Küsime kasutajalt ees- ja perenime
$Eesnimi = Read-Host "Sisesta eesnimi"
$Perenimi = Read-Host "Sisesta perenimi"

# Kontrollime igaks juhuks, et väljad poleks tühjad
if (-not $Eesnimi -or -not $Perenimi) {
    Write-Host "Viga: Ees- ja perenimi peavad olema sisestatud!" -ForegroundColor Red
    exit
}

# 2. Loome kasutajanime (eesnimi.perenimi) ja teeme väikesteks tähtedeks (.ToLower())
$KasutajaNimi = "$Eesnimi.$Perenimi".ToLower()
$TaisNimi = "$Eesnimi $Perenimi"

# 3. Valmistame parooli ette (SecureString)
$Parool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

# 4. Loome kasutaja
# -ErrorAction SilentlyContinue peidab punase süsteemse vea, kui kasutaja on juba olemas
New-LocalUser -Name $KasutajaNimi `
              -FullName $TaisNimi `
              -Description "Loodud skripti poolt: $TaisNimi" `
              -Password $Parool `
              -ErrorAction SilentlyContinue

# Kontrollime tulemust muutujaga $? (True = õnnestus, False = ebaõnnestus)
if ($?) {
    Write-Host "Edukas: Kasutaja '$KasutajaNimi' loodi edukalt!" -ForegroundColor Green
} else {
    Write-Host "Viga: Kasutaja loomine ebaõnnestus! Tõenäoliselt on kasutaja '$KasutajaNimi' juba süsteemis olemas." -ForegroundColor Red
}