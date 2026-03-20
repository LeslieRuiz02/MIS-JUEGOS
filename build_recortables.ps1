$html = [System.IO.File]::ReadAllText("c:\Users\cipatli\Documents\MIS JUEGOS\recortables.html", [System.Text.Encoding]::UTF8)

# embed CSS
$css = [System.IO.File]::ReadAllText("c:\Users\cipatli\Documents\MIS JUEGOS\style-recortables.css", [System.Text.Encoding]::UTF8)
$html = $html -replace '<link rel="stylesheet" href="style-recortables.css">', "<style>$css</style>"

# embed JS
$js = [System.IO.File]::ReadAllText("c:\Users\cipatli\Documents\MIS JUEGOS\app-recortables.js", [System.Text.Encoding]::UTF8)
$html = $html -replace '<script src="app-recortables.js"></script>', "<script>$js</script>"

# embed Images
$images = @(
    "C:\Users\cipatli\.gemini\antigravity\brain\33547fb6-b4d6-4aea-8629-d9f3f48bbd76\perrito_recortable_1_1773775420311.png",
    "C:\Users\cipatli\.gemini\antigravity\brain\33547fb6-b4d6-4aea-8629-d9f3f48bbd76\perrito_recortable_2_1773775448170.png",
    "C:\Users\cipatli\.gemini\antigravity\brain\33547fb6-b4d6-4aea-8629-d9f3f48bbd76\perrito_recortable_dalmata_1773775752595.png",
    "C:\Users\cipatli\.gemini\antigravity\brain\33547fb6-b4d6-4aea-8629-d9f3f48bbd76\perrito_recortable_golden_1773775783899.png"
)

foreach ($img in $images) {
    if (Test-Path $img) {
        $bytes = [System.IO.File]::ReadAllBytes($img)
        $b64 = [System.Convert]::ToBase64String($bytes)
        # Escape path for regex
        $regexPath = [regex]::Escape($img)
        $html = $html -replace $regexPath, "data:image/png;base64,$b64"
    } else {
        Write-Host "Warning: $img not found"
    }
}

# Add NEW dogs!
$newDogs = @"
        <div class="recortable">
            <svg viewBox="0 0 200 200" width="100%" height="auto">
                <rect x="0" y="0" width="200" height="200" fill="white" />
                <path d="M50 100 Q100 50 150 100 Q150 150 100 150 Q50 150 50 100 Z" fill="#F4A460" stroke="black" stroke-width="4"/>
                <circle cx="80" cy="90" r="10" fill="black"/>
                <circle cx="120" cy="90" r="10" fill="black"/>
                <ellipse cx="100" cy="115" rx="15" ry="10" fill="white" stroke="black" stroke-width="2"/>
                <ellipse cx="100" cy="112" rx="5" ry="3" fill="black"/>
                <path d="M40 80 Q20 120 40 160 Z" fill="#8B4513" stroke="black" stroke-width="3"/>
                <path d="M160 80 Q180 120 160 160 Z" fill="#8B4513" stroke="black" stroke-width="3"/>
                <path d="M95 120 Q100 125 105 120" fill="none" stroke="black" stroke-width="2"/>
            </svg>
            <p class="nombre">Canelo</p>
            <p class="tipo">Raza: Mestizo Orejón</p>
        </div>
        <div class="recortable">
            <svg viewBox="0 0 200 200" width="100%" height="auto">
                <!-- Salchicha -->
                <rect x="0" y="0" width="200" height="200" fill="white" />
                <rect x="30" y="90" width="130" height="35" rx="17" fill="#D2691E" stroke="black" stroke-width="4"/>
                <circle cx="160" cy="80" r="25" fill="#D2691E" stroke="black" stroke-width="4"/>
                <ellipse cx="165" cy="80" r="15" fill="#D2691E" stroke="none"/>
                <!-- patas -->
                <rect x="50" y="125" width="15" height="25" rx="5" fill="#D2691E" stroke="black" stroke-width="4"/>
                <rect x="130" y="125" width="15" height="25" rx="5" fill="#D2691E" stroke="black" stroke-width="4"/>
                <rect x="70" y="125" width="15" height="25" rx="5" fill="#A0522D" stroke="black" stroke-width="4"/>
                <rect x="145" y="125" width="15" height="25" rx="5" fill="#A0522D" stroke="black" stroke-width="4"/>
                <!-- cara -->
                <circle cx="178" cy="70" r="6" fill="black"/>
                <circle cx="160" cy="65" r="4" fill="black"/>
                <circle cx="185" cy="72" r="3" fill="white"/> <!-- brillo nariz -->
                <!-- oreja -->
                <ellipse cx="145" cy="85" rx="10" ry="25" fill="#8B4513" stroke="black" stroke-width="3"/>
                <!-- cola -->
                <path d="M35 100 Q15 80 5 70" fill="none" stroke="black" stroke-width="4" stroke-linecap="round"/>
            </svg>
            <p class="nombre">Salchicha</p>
            <p class="tipo">Raza: Dachshund</p>
        </div>
        <div class="recortable">
            <svg viewBox="0 0 200 200" width="100%" height="auto">
                <rect x="0" y="0" width="200" height="200" fill="white" />
                <!-- Corgi -->
                <ellipse cx="100" cy="115" rx="45" ry="35" fill="#F4A460" stroke="black" stroke-width="4"/>
                <ellipse cx="100" cy="125" rx="30" ry="20" fill="white" stroke="none"/>
                <!-- cabeza -->
                <circle cx="100" cy="70" r="35" fill="#F4A460" stroke="black" stroke-width="4"/>
                <path d="M100 50 L100 85 L75 80 Z" fill="white"/>
                <path d="M100 50 L100 85 L125 80 Z" fill="white"/>
                <polygon points="75,45 60,15 90,40" fill="#F4A460" stroke="black" stroke-width="3"/>
                <polygon points="125,45 140,15 110,40" fill="#F4A460" stroke="black" stroke-width="3"/>
                <polygon points="73,43 62,18 88,38" fill="#FFC0CB" stroke="none"/>
                <polygon points="127,43 138,18 112,38" fill="#FFC0CB" stroke="none"/>
                <circle cx="85" cy="65" r="5" fill="black"/>
                <circle cx="115" cy="65" r="5" fill="black"/>
                <circle cx="100" cy="80" r="7" fill="black"/>
                <path d="M92 90 Q100 100 108 90" fill="none" stroke="black" stroke-width="2"/>
                <!-- patas cortas -->
                <rect x="70" y="145" width="15" height="15" rx="5" fill="white" stroke="black" stroke-width="4"/>
                <rect x="115" y="145" width="15" height="15" rx="5" fill="white" stroke="black" stroke-width="4"/>
            </svg>
            <p class="nombre">Cheddar</p>
            <p class="tipo">Raza: Corgi</p>
        </div>
        <div class="recortable">
            <svg viewBox="0 0 200 200" width="100%" height="auto">
                <!-- Poodle -->
                <rect x="0" y="0" width="200" height="200" fill="white" />
                <circle cx="100" cy="95" r="38" fill="#FFF0F5" stroke="black" stroke-width="4" stroke-dasharray="8,4"/>
                <circle cx="65" cy="80" r="22" fill="#FFF0F5" stroke="black" stroke-width="4" stroke-dasharray="8,4"/>
                <circle cx="135" cy="80" r="22" fill="#FFF0F5" stroke="black" stroke-width="4" stroke-dasharray="8,4"/>
                <circle cx="100" cy="140" r="28" fill="#FFF0F5" stroke="black" stroke-width="4" stroke-dasharray="8,4"/>
                <circle cx="100" cy="100" r="35" fill="#FFF0F5" stroke="none"/>
                
                <ellipse cx="100" cy="110" rx="16" ry="11" fill="white" stroke="black" stroke-width="2"/>
                <circle cx="90" cy="92" r="4" fill="black"/>
                <circle cx="110" cy="92" r="4" fill="black"/>
                <ellipse cx="100" cy="107" rx="6" ry="4" fill="black"/>
                <path d="M95 113 Q100 118 105 113" fill="none" stroke="black" stroke-width="2"/>
                
                <circle cx="60" cy="150" r="14" fill="#FFF0F5" stroke="black" stroke-width="3" stroke-dasharray="6,3"/>
                <circle cx="140" cy="150" r="14" fill="#FFF0F5" stroke="black" stroke-width="3" stroke-dasharray="6,3"/>
                <circle cx="85" cy="150" r="14" fill="#FFF0F5" stroke="black" stroke-width="3" stroke-dasharray="6,3"/>
                <circle cx="115" cy="150" r="14" fill="#FFF0F5" stroke="black" stroke-width="3" stroke-dasharray="6,3"/>
                
            </svg>
            <p class="nombre">Copito</p>
            <p class="tipo">Raza: Poodle</p>
        </div>
"@

$html = $html -replace '</main>', "`n$newDogs`n    </main>"

[System.IO.File]::WriteAllText("c:\Users\cipatli\Documents\MIS JUEGOS\recortables_para_imprimir.html", $html, [System.Text.Encoding]::UTF8)
Write-Host "Success: Generated recortables_para_imprimir.html"
