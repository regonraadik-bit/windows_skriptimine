# =======================================================
# Ülesanne: Practice 14 - System Report
# Faili nimi: system_report.ps1
# =======================================================

# Määra väljundfaili nimi
$failiNimi = "report.txt"

# 1. KASUTAJA SISEND
# Küsime kasutajalt nime ja korduste arvu
$nimi = Read-Host "Palun sisesta oma nimi"
$kordused = Read-Host "Mitu korda soovid tervitust kuvada? (Sisesta number)"

# Konverteerime sisendi numbriks (integer)
try {
    [int]$kordusteArv = $kordused
}
catch {
    Write-Host "Viga: Palun sisesta korrektne number!" -ForegroundColor Red
    exit
}

# Alustame väljundi suunamist faili.
# Kasutame ScriptBlocki (& { ... }), et kogu sisu läheks korraga faili.
& {
    # 2. TSÜKKEL
    # Kuvab tervituse vastavalt sisestatud arvule
    Write-Output "`n--- Tervitused ---"
    for ($i = 1; $i -le $kordusteArv; $i++) {
        "Tere, $nimi! ($i)"
    }

    Write-Output "`n========================================"

    # 3. SÜSTEEMIINFO
    Write-Output "--- Süsteemi informatsioon ---"
    Write-Output "Arvuti nimi: $env:COMPUTERNAME"
    Write-Output "Sisselogitud kasutaja: $env:USERNAME"
    Write-Output "PowerShelli täisversioon: $($PSVersionTable.PSVersion)"

    Write-Output "`n========================================"

    # 4. CMDLET'IDE KASUTAMINE
    # 3 töötavat protsessi
    Write-Output "--- 3 Töötavat protsessi ---"
    Get-Process | Select-Object -First 3

    Write-Output "`n" # Tühi rida loetavuse huvides

    # 3 teenust koos olekuga
    Write-Output "--- 3 Teenust ---"
    Get-Service | Select-Object -First 3

    Write-Output "`n========================================"

    # 5. TINGIMUSLAUSE (IF)
    # Kontrollime versiooni numbrit
    Write-Output "--- Versiooni kontroll ---"
    if ($PSVersionTable.PSVersion.Major -lt 5) {
        Write-Output "HOIATUS: Teie PowerShelli versioon on vana (alla 5.0)."
    }
    else {
        Write-Output "OK: PowerShelli versioon on sobiv."
    }

} | Out-File -FilePath $failiNimi -Encoding UTF8

# 6. VÄLJUNDI SALVESTAMINE (tehtud ülalpool toruga | Out-File)

# 7. VORMINDATUD LÕPPTEADE
# See kuvatakse ainult ekraanile, et kasutaja teaks, et skript lõpetas.
Write-Host "===========================" -ForegroundColor Green
Write-Host "Script finished successfully" -ForegroundColor Green
Write-Host "Raport on salvestatud faili: $failiNimi" -ForegroundColor Gray
Write-Host "===========================" -ForegroundColor Green