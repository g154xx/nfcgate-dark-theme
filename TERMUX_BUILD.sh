#!/bin/bash
# TERMUX Installation & Build Guide for NFCGate Dark Theme
# Fără Android Studio - compilare direct din terminal

# ============================================================================
# SETUP INITIAL (RUL O SINGURĂ DATĂ)
# ============================================================================

echo "=========================================="
echo "NFCGate Dark Theme - Termux Setup"
echo "=========================================="

# Step 1: Update packages
echo "[1/6] Updating packages..."
apt update -y
apt upgrade -y

# Step 2: Install dependencies
echo "[2/6] Installing dependencies..."
apt install -y \
    git \
    openjdk-11-jdk \
    android-sdk \
    android-ndk \
    gradle

# Step 3: Set environment variables
echo "[3/6] Setting environment variables..."
export JAVA_HOME="/system/app/java"
export ANDROID_HOME="$PREFIX/opt/android-sdk"
export ANDROID_NDK_HOME="$PREFIX/opt/android-ndk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# Add to .bashrc for persistence
echo 'export JAVA_HOME="/system/app/java"' >> ~/.bashrc
echo 'export ANDROID_HOME="$PREFIX/opt/android-sdk"' >> ~/.bashrc
echo 'export ANDROID_NDK_HOME="$PREFIX/opt/android-ndk"' >> ~/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"' >> ~/.bashrc

# Step 4: Accept Android SDK licenses
echo "[4/6] Accepting Android SDK licenses..."
yes | sdkmanager --licenses

# Step 5: Install SDK components
echo "[5/6] Installing SDK components..."
sdkmanager "platforms;android-34" \
           "platforms;android-21" \
           "build-tools;34.0.0" \
           "ndk;21.4.7075529"

# Step 6: Verify installation
echo "[6/6] Verifying installation..."
echo "Java version:"
java -version
echo "Android SDK:"
ls -la $ANDROID_HOME/
echo ""
echo "✓ Setup completed! You can now build NFCGate."

# ============================================================================
# BUILD PROCESS (RUL DUPĂ SETUP)
# ============================================================================

echo ""
echo "=========================================="
echo "Building NFCGate Dark Theme"
echo "=========================================="

# Clone if not exists
if [ ! -d "nfcgate" ]; then
    echo "[1/4] Cloning NFCGate v2.4.3..."
    git clone --depth 1 --branch v2.4.3 https://github.com/nfcgate/nfcgate.git
else
    echo "[1/4] NFCGate already cloned, skipping..."
fi

cd nfcgate

# Apply theme
echo "[2/4] Applying dark theme..."
if [ -f "../apply-theme.sh" ]; then
    bash ../apply-theme.sh
else
    echo "ERROR: apply-theme.sh not found!"
    exit 1
fi

# Build
echo "[3/4] Building APK (this may take 5-10 minutes)..."
chmod +x gradlew
./gradlew clean
./gradlew assembleDebug

# Check result
if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
    echo "[4/4] Build successful! ✓"
    echo ""
    echo "=========================================="
    echo "APK READY FOR INSTALLATION"
    echo "=========================================="
    ls -lh app/build/outputs/apk/debug/app-debug.apk
    echo ""
    echo "Install with:"
    echo "  adb install app/build/outputs/apk/debug/app-debug.apk"
    echo ""
else
    echo "[4/4] Build FAILED! ✗"
    echo "Check errors above."
    exit 1
fi

# ============================================================================
# INSTALLATION ON DEVICE
# ============================================================================

echo ""
echo "=========================================="
echo "Installation Instructions"
echo "=========================================="
echo ""
echo "Option 1: Via ADB (if you have adb installed)"
echo "  adb install app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "Option 2: Via file transfer"
echo "  1. Copy app-debug.apk to /sdcard/Download/"
echo "  2. Open file manager on phone"
echo "  3. Navigate to Downloads"
echo "  4. Tap on app-debug.apk"
echo "  5. Install"
echo ""
echo "Option 3: From Termux"
echo "  am start -n com.android.packageinstaller/.PackageInstallerActivity -d file://$(pwd)/app/build/outputs/apk/debug/app-debug.apk"
echo ""
