# Kasutajate_loomine.ps1

$KasutajaNimi = Read-Host "Kirjuta kasutajanimi"
$TäisNimi = Read-Host "Kirjuta täisnimi"

# 1. Kui kasutaja on juba olemas, kustutame ta (katsetamiseks)
if (Get-LocalUser -Name $KasutajaNimi -ErrorAction SilentlyContinue) {
    Remove-LocalUser -Name $KasutajaNimi
    Write-Host "Vana kasutaja $KasutajaNimi eemaldatud." -ForegroundColor Yellow
}

# 2. Parooli ettevalmistamine (turvaline tekst)
$ParoolTekstina = "qwerty" 
$KasutajaParool = ConvertTo-SecureString $ParoolTekstina -AsPlainText -Force

# 3. Uue kasutaja loomine
New-LocalUser -Name $KasutajaNimi `
              -FullName $TäisNimi `
              -Password $KasutajaParool `
              -Description "Skriptiga loodud kasutaja"

Write-Host "Kasutaja $KasutajaNimi on edukalt loodud!" -ForegroundColor Green