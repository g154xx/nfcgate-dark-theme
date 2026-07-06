# NFCGate v2.4.3 Dark Theme - Quick Start (5 Steps)

## 🎯 Ce vei obține:
- ✓ Fundal NEGRU (#000000)
- ✓ Text VERDE NEON (#00ff41)
- ✓ Acente verzi pe butoane
- ✓ Material Design dark theme
- ✓ Nume "NFCGate" vizibil (NU ascuns)
- ✓ Iconiță vizibilă în launcher (NU ascuns)
- ✓ ZERO modificări la funcționalitate

---

## 📋 5 Pași Rapidi:

### 1️⃣ Clone și Setup
```bash
git clone https://github.com/nfcgate/nfcgate.git
cd nfcgate
git checkout v2.4.3
```

### 2️⃣ Deschide în Android Studio
- File → Open → selectează folderul nfcgate
- Așteaptă Gradle sync

### 3️⃣ Înlocuiește Fișierele (3 fișiere CRITICAL):

**Fișier 1**: `app/src/main/res/values/colors.xml`
→ Copie conținutul din `colors.xml` din pachetul de modificări

**Fișier 2**: `app/src/main/res/values/styles.xml`
→ Copie conținutul din `styles.xml` din pachetul de modificări

**Fișier 3**: `app/src/main/res/values-v21/styles.xml`
→ Copie conținutul din fișierul de Android 5.0+

### 4️⃣ Compilează
```bash
# Opție A: Android Studio UI
Build → Build Bundle(s)/APK(s) → Build APK(s)

# Opție B: Command Line
./gradlew assembleDebug
```

### 5️⃣ Instalează pe Telefon
```bash
# Opție A: Via Android Studio
Run → Run 'app'

# Opție B: Via ADB
adb install app/build/outputs/apk/debug/app-debug.apk
```

---

## ✅ Verificare Finală

După instalare, deschide app și verific:

- [ ] Launcher icon VIZIBIL cu label "NFCGate"
- [ ] Fundal NEGRU (#000000)
- [ ] Text VERDE (#00ff41) - citibil perfect
- [ ] Butoane cu accente verzi
- [ ] Toolbar negru cu text verde
- [ ] Cards cu fundal #1a1a1a pe negru

---

## 🚨 IMPORTANT - Verify:

❌ **NU FACE ASTA:**
- NU șterge `android:icon` din AndroidManifest
- NU schimbi `<string name="app_name">` din "NFCGate"
- NU ascunzi iconiță din launcher

✓ **VERIFIC ÎN AndroidManifest.xml:**
```xml
android:icon="@mipmap/ic_launcher"
android:label="@string/app_name"
android:theme="@style/AppTheme"
```

---

## 📁 Fișierele din Pachet:

```
nfcgate_modifications/
├── colors.xml                      ← Paleta de culori (CRITICAL)
├── styles.xml                      ← Tema main (CRITICAL)
├── values-v21/styles.xml          ← Tema Android 5.0+ (CRITICAL)
├── strings.xml                     ← Texturile (INFO ONLY - NU ÎNLOCUI)
├── INSTALLATION_GUIDE.md           ← Ghid complet
├── QUICK_START.md                 ← Asta e! 😎
├── MANIFEST_MODIFICATIONS.txt     ← Info AndroidManifest
└── activity_main_example.xml      ← Exemplu layout
```

---

## ⏱️ Timp Total: ~15 minute

1. Clone + Setup: 2 min
2. Copiere fișiere: 1 min
3. Compilare: 8 min (primă dată)
4. Instalare: 2 min
5. Testare: 2 min

---

## 🆘 Dacă Ceva Nu Merge:

**Problema: App nu pornește**
→ Verifică Logcat (View → Tool Windows → Logcat)
→ Caută erori roșii → Probabil XML syntax error

**Problema: Culori nu se aplică**
→ Build → Clean Project
→ Build → Build Project
→ Reinstalează APK

**Problema: Iconul dispărut**
→ ⚠️ Ai șters din AndroidManifest
→ Restaurează: `android:icon="@mipmap/ic_launcher"`

---

## 📖 Documente:

- 📘 **INSTALLATION_GUIDE.md** - Ghid COMPLET (15+ pagini)
- ⚡ **QUICK_START.md** - ASTA! (pași rapizi)
- 📝 **MANIFEST_MODIFICATIONS.txt** - Info AndroidManifest
- 🎨 **colors.xml** - Paleta de culori (COPY-PASTE)
- 🎭 **styles.xml** - Tema Material Design
- 📐 **activity_main_example.xml** - Exemplu layout

---

## 🎨 Paleta de Culori Utilizată:

```
Negru pur:        #000000
Negru deschis:    #1a1a1a
Verde neon:       #00ff41 ← Text + Accente
Verde deschis:    #66ff88
Verde închis:     #1a4d1a
Roșu error:       #ff4444
```

---

## 🚀 Ești Gata?

1. Copy fișierele din `nfcgate_modifications/`
2. Paste în proiectul NFCGate
3. Compilează
4. Instalează
5. Enjoy! 🎉

---

**Status**: ✅ Gata pentru release
**Versiune**: NFCGate 2.4.3 Dark Theme v1.0
**Data**: 2024
