# NFCGate v2.4.3 - Dark Theme Edition

## 🚀 Compilare Automată cu GitHub Actions (RECOMANDAT)

### Setup în 3 Pași:

#### 1️⃣ Creează Repository pe GitHub
```bash
# Pe GitHub.com, creează repo nou (ex: nfcgate-dark-theme)
# Clone-ul tău local:
git clone https://github.com/YOUR_USERNAME/nfcgate-dark-theme.git
cd nfcgate-dark-theme
```

#### 2️⃣ Copie fișierele din pachetul de modificări
```bash
# Copie toți fișierul din nfcgate_modifications/ în repo-ul tău:
cp -r nfcgate_modifications/* .

# Fișierele importante:
# ✓ .github/workflows/build.yml      ← GitHub Actions workflow
# ✓ apply-theme.sh                   ← Script de aplicare automată
# ✓ QUICK_START.md, etc.             ← Documentație
```

#### 3️⃣ Push pe GitHub
```bash
git add .
git commit -m "Add NFCGate Dark Theme with GitHub Actions"
git push origin main
```

### ✨ Compilare Automată va Porni Instant!

Merge în repo-ul tău pe GitHub:
- **Actions** tab → Vei vedea build-ul în progres
- Merge în **"Build NFCGate Dark Theme APK"** → Vede detalii
- După ~5-10 min → APK gata în **Artifacts**

---

## 📥 Descarcă APK-ul Compilat

### Opțiunea 1: Din GitHub UI (CEL MAI UȘOR)
1. Merge în repo-ul tău
2. Click pe **Actions** tab
3. Click pe cel mai recent workflow run
4. Scroll down la **Artifacts**
5. Click pe **nfcgate-dark-theme-debug**
6. Descarcă `app-debug.apk`

### Opțiunea 2: Din Command Line
```bash
# Descarcă ultimul artifact
gh run download -n nfcgate-dark-theme-debug -D ./downloads
```

---

## 📱 Instalează pe Telefon

### Metoda 1: Via ADB
```bash
adb install downloads/app-debug.apk
```

### Metoda 2: Direct pe Telefon
1. Descarcă APK-ul pe calculator
2. Copie pe telefon via USB
3. Deschide file manager
4. Navighează la Download folder
5. Tap pe APK și instalează

### Metoda 3: Via Termux (pe telefon)
```bash
# În Termux pe telefon
cd /sdcard/Download/
pm install app-debug.apk
```

---

## 🔧 Opțional: Compilare Locală (Termux / Linux)

Dacă vrei să compilezi pe computer-ul tău:

### Prerequisite
```bash
# Linux / Mac
sudo apt install openjdk-11-jdk android-sdk gradle
export ANDROID_HOME=/path/to/android-sdk

# Termux
apt install openjdk-11-jdk android-sdk gradle
```

### Build
```bash
# Clone repo-ul
git clone https://github.com/YOUR_USERNAME/nfcgate-dark-theme.git
cd nfcgate-dark-theme

# Clone NFCGate v2.4.3
git clone --branch v2.4.3 https://github.com/nfcgate/nfcgate.git

# Aplica theme
cd nfcgate
bash ../apply-theme.sh

# Compilează
./gradlew assembleDebug

# APK-ul va fi în: app/build/outputs/apk/debug/app-debug.apk
```

---

## 📋 Cum Funcționează GitHub Actions

### Workflow File: `.github/workflows/build.yml`

Când faci push pe GitHub:

```
┌─────────────────────────────────────────┐
│  1. GitHub detectează noul push         │
├─────────────────────────────────────────┤
│  2. Pornește o mașină virtuală Linux    │
├─────────────────────────────────────────┤
│  3. Clonează NFCGate v2.4.3             │
├─────────────────────────────────────────┤
│  4. Aplică tema dark (apply-theme.sh)   │
├─────────────────────────────────────────┤
│  5. Instalează Java + Android SDK       │
├─────────────────────────────────────────┤
│  6. Compilează: ./gradlew assembleDebug │
├─────────────────────────────────────────┤
│  7. Salvează APK în Artifacts           │
├─────────────────────────────────────────┤
│  8. Tu descarci APK → Instalezi pe tel  │
└─────────────────────────────────────────┘
```

---

## 🎯 Flux Complet: Push → Build → Download

### 1. Schimbă ceva (opțional)
```bash
# Opțional: editează colori în apply-theme.sh
nano apply-theme.sh

git add .
git commit -m "Update theme colors"
git push
```

### 2. GitHub Actions compilează automat
- Merge în Actions tab
- Vede build progress în real-time
- ~5-10 minute de compilare

### 3. Descarcă APK din Artifacts
- Build finished → click pe Artifacts
- Download `app-debug.apk`

### 4. Instalează pe telefon
```bash
adb install app-debug.apk
# sau
# Manual: file manager → tap APK → install
```

---

## ⚙️ Customizare Avansată

### Schimbă Versiunea Android
Edit `.github/workflows/build.yml`:
```yaml
- name: Setup Android SDK
  with:
    target-api-level: 34  # Schimbă aici
    ndk-version: 21.4.7075529
```

### Schimbă Culori
Edit `apply-theme.sh` - secția cu colors.xml:
```bash
<color name="accent">#00ff41</color>  ← Schimbă verde (#00ff41) cu alta
```

Apoi push și GitHub Actions va recompila automat cu noile culori!

### Creează Releases Automate
Schimbă versiunea în tag:
```bash
git tag v1.0.0
git push --tags
```

→ GitHub Actions va crea Release automat cu APK-ul!

---

## 📊 Status Pagina

Merge în GitHub repo → **Actions** tab

Vei vedea:
- ✅ Successful builds (verde)
- ❌ Failed builds (roșu) + error log
- ⏳ Running builds (galben)
- ⏱️ Build time
- 📦 Artifacts ready for download

---

## 🐛 Troubleshooting

### Build falează cu "NDK not found"
→ GitHub Actions va instala automat, nu te îngrijora

### "Gradle sync failed"
→ Verifică că `apply-theme.sh` e executable
```bash
chmod +x apply-theme.sh
git add apply-theme.sh
git commit -m "Make script executable"
git push
```

### APK nu apare în Artifacts
→ Merge în Actions, click pe workflow run
→ Scroll down la "Build" step
→ Vede error în log

### Artefactul expiră
GitHub ține artifacts 90 de zile implicit
→ Creează Release (push tag) pentru storage permanent

---

## 📦 Fișierele din Pachet

```
nfcgate-dark-theme/
├── .github/
│   └── workflows/
│       └── build.yml                  ← GitHub Actions workflow ⭐
├── apply-theme.sh                     ← Auto-patch script
├── QUICK_START.md                     ← Ghid rapid
├── INSTALLATION_GUIDE.md              ← Ghid complet
├── TERMUX_BUILD.sh                    ← Build pe Termux
├── 05_colors.xml                      ← Culori (referință)
├── 06_styles_main.xml                 ← Tema (referință)
├── 07_styles_v21.xml                  ← Tema Android 5+ (referință)
└── README.md                          ← Asta!
```

---

## 🎨 Tema Inclusă

- **Background**: #000000 (Negru pur)
- **Text Primary**: #00ff41 (Verde neon)
- **Accents**: #00ff41 (Verde neon)
- **Material Design 3**: ✓
- **Android 5+ Support**: ✓

---

## 📖 Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Gradle Build System](https://gradle.org)
- [Android Build Docs](https://developer.android.com/build)
- [NFCGate Original Repo](https://github.com/nfcgate/nfcgate)

---

## 🚀 Next Steps

1. ✅ Crează repo pe GitHub
2. ✅ Copie fișierele din pachet
3. ✅ Push pe GitHub
4. ✅ Merge în Actions tab - vede build-ul
5. ✅ Download APK din Artifacts
6. ✅ Instalează pe telefon
7. ✅ Enjoy NFCGate dark theme! 🎉

---

**Status**: ✅ Gata pentru deployment  
**Versiune**: NFCGate 2.4.3 Dark Theme  
**Data**: 2024  
**Metoda**: GitHub Actions (CI/CD)
