# NFCGate v2.4.3 - Dark Theme (Black + Green) Modification Guide

## Overview
Această ghid te va ajuta să aplici o temă dark cu text verde la NFCGate v2.4.3, păstrând aplicația **complet vizibilă** cu nume și iconiță.

---

## IMPORTANT - Ce Rămâne Nemodificat ✓
- ✓ **Numele aplicației**: "NFCGate" (vizibil în launcher)
- ✓ **Iconul**: Vizibil în drawer (nu e ascuns)
- ✓ **Funcționalitatea**: ZERO modificări la cod functional
- ✓ **Compatibilitate**: Android 5+ (API 21+) păstrată

---

## Prerequisites
- Android Studio 4.0+
- Android SDK (API 21+)
- Java 11+
- Git (pentru clonare repo)

---

## Pasul 1: Clonează Repo-ul

```bash
git clone https://github.com/nfcgate/nfcgate.git
cd nfcgate
git checkout v2.4.3
```

---

## Pasul 2: Deschide Proiectul în Android Studio

1. Deschide Android Studio
2. File → Open
3. Selectează folderul nfcgate
4. Așteaptă ca Gradle să sync-uiască

---

## Pasul 3: Înlocuiește Fișierele de Culori și Tema

### 3.1 - Fișierul `colors.xml`
- Locație: `app/src/main/res/values/colors.xml`
- Acțiune: **ÎNLOCUIEȘTE COMPLET** cu fișierul `colors.xml` din pachetul de modificări
- Culori principale:
  - Background: #000000 (negru pur)
  - Text Primary: #00ff41 (verde neon)
  - Accent: #00ff41 (verde neon)
  - Surface: #1a1a1a (negru ușor deschis)

### 3.2 - Fișierul `styles.xml`
- Locație: `app/src/main/res/values/styles.xml`
- Acțiune: **ÎNLOCUIEȘTE COMPLET** cu fișierul `styles.xml` din pachetul de modificări
- Configurează tema pentru Material Design cu culori dark

### 3.3 - Fișierul `styles.xml` pentru Android 5.0+
- Locație: `app/src/main/res/values-v21/styles.xml`
- Acțiune: **ÎNLOCUIEȘTE** dacă există, sau **CREEAZĂ NOUL** cu fișierul din pachet
- Aplică culori specifice pentru API 21+

### 3.4 - Fișierul `strings.xml`
- Locație: `app/src/main/res/values/strings.xml`
- Acțiune: **EDITARE SELECTIVĂ** - NU ÎNLOCUI COMPLET
- Verifică doar că:
  ```xml
  <string name="app_name">NFCGate</string>
  ```
  rămâne EXACT așa

---

## Pasul 4: Verifică AndroidManifest.xml

Navighează la: `app/src/main/AndroidManifest.xml`

Verifică că tag-ul `<application>` conține:

```xml
android:icon="@mipmap/ic_launcher"
android:label="@string/app_name"
android:theme="@style/AppTheme"
```

⚠️ **CRITICAL**: 
- Nu ELIMINA `android:icon`
- Nu SCHIMBA `android:label` din `@string/app_name`
- Asigură-te că tema este `@style/AppTheme` pentru fiecare Activity

---

## Pasul 5: Compilează Aplicația

### Opțiune A: Din Android Studio (Recomandată)
1. Build → Build Bundle(s)/APK(s) → Build APK(s)
2. Așteaptă compilarea
3. APK-ul gata va fi la:
   ```
   app/build/outputs/apk/debug/app-debug.apk
   ```

### Opțiune B: Din Command Line
```bash
./gradlew assembleDebug
```

Rezultat: `app/build/outputs/apk/debug/app-debug.apk`

---

## Pasul 6: Instalează pe Telefon

### Metoda 1: Via Android Studio
1. Conectează telefonul prin USB cu Developer Mode activ
2. Run → Run 'app'
3. Selectează dispozitivul
4. Aplicația se instalează și lansează automat

### Metoda 2: Via Linie de Comandă
```bash
adb install app/build/outputs/apk/debug/app-debug.apk
```

### Metoda 3: Instalare Manuală
1. Copie `app-debug.apk` pe telefon
2. Deschide Fisierul Manager
3. Apasă pe APK-ul descărcat
4. Permite instalare din surse necunoscute (dacă se cere)
5. Completează instalarea

---

## Pasul 7: Verificare

După instalare, verifică pe telefon:

✓ **Iconul**: Vizibil în Application Drawer (NU ASCUNS)
✓ **Numele**: "NFCGate" (NU schimbat în generic)
✓ **Culori UI**: 
   - Background: NEGRU (#000000)
   - Text: VERDE NEON (#00ff41)
   - Butoane: Acente verzi
✓ **Funcționalitate**: Capture, Relay, Replay, Clone - toate FUNCȚIONALE

---

## Paleta de Culori Utilizate

```
Fundal principal:      #000000 (Negru pur)
Surface (Carduri):     #1a1a1a (Negru deschis 10%)
Text Primar:           #00ff41 (Verde neon)
Text Secundar:         #66ff88 (Verde deschis)
Text Hint:             #1a4d1a (Verde închis)
Accent/Butoane:        #00ff41 (Verde neon)
Status Succes:         #00ff41 (Verde neon)
Status Eroare:         #ff4444 (Roșu)
Divider:               #1a4d1a (Verde închis)
```

---

## Troubleshooting

### Problema: "Tema nu se aplică"
**Soluție**: 
- Fă Clean Build: Build → Clean Project
- Apoi Build → Build Project
- Reinstalează APK-ul

### Problema: "Text nu se vede bine"
**Soluție**:
- Verifică că fișierul `colors.xml` e correct
- Asigură-te că `styles.xml` referențiază culorile corecte
- Rebuild și reinstalează

### Problema: "App-ul nu pornește"
**Soluție**:
- Verifică Logcat în Android Studio: View → Tool Windows → Logcat
- Caută erori roșii
- Probabil: reference gresit la culori în XML
- Verifică sintaxa XML (spații, comillas, etc.)

### Problema: "Iconul dispărut din Launcher"
**Soluție - NU face asta!**
- Iconul trebuie să rămână vizibil
- Dacă dispare, probabil ai șters din AndroidManifest
- Restaurează: `android:icon="@mipmap/ic_launcher"`

---

## Modificări Avansate (Opțional)

### Schimbă Iconul Aplicației
Dacă vrei o altă iconiță (dar totuși VIZIBILĂ):

1. Pregătește imagini:
   - 192x192px pentru xxhdpi
   - 144x144px pentru xhdpi
   - 96x96px pentru hdpi
   - 72x72px pentru mdpi

2. Pune în: `app/src/main/res/mipmap-*/ic_launcher.png`

3. Rebuild și instalează

### Personalizează Font
Adaugă în `styles.xml`:
```xml
<item name="android:fontFamily">@font/your_custom_font</item>
```

---

## Revenire la Original

Dacă vrei să revii la tema originală:

```bash
git checkout app/src/main/res/values/
git checkout app/src/main/res/values-v21/
./gradlew clean
./gradlew assembleDebug
```

---

## Note Finale

- ✓ Modificări PURE UI - funcționalitatea intactă
- ✓ Compatibil cu Android 5.0+ (API 21+)
- ✓ Material Design 3 ready
- ✓ Dark theme profesional cu accente verzi
- ✓ Aplicația RĂMÂNE identificabilă ca "NFCGate"

**Status**: Gata pentru compilare și instalare!

---

## Support

Dacă întâmpini probleme:

1. Verifică [NFCGate GitHub Issues](https://github.com/nfcgate/nfcgate/issues)
2. Caută eroare în Logcat: `adb logcat | grep NFCGate`
3. Verifică că Android SDK este up-to-date

---

Last Updated: 2024
NFCGate Theme Modification Guide v1.0
