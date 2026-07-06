#!/bin/bash
# NFCGate v2.4.3 - Dark Theme Auto-Patcher
# Script pentru clone și aplicare automată a modificărilor
# Compatibil cu GitHub Actions și Termux

set -e  # Exit on error

echo "=========================================="
echo "NFCGate v2.4.3 Dark Theme Patcher"
echo "=========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Clone NFCGate repository
echo -e "${YELLOW}[1/5]${NC} Cloneing NFCGate v2.4.3..."
if [ -d "nfcgate" ]; then
    echo "    NFCGate folder already exists, skipping clone"
else
    git clone --depth 1 --branch v2.4.3 https://github.com/nfcgate/nfcgate.git
    echo -e "${GREEN}✓ Clone completed${NC}"
fi

cd nfcgate

# Step 2: Create necessary directories
echo -e "${YELLOW}[2/5]${NC} Creating resource directories..."
mkdir -p app/src/main/res/values
mkdir -p app/src/main/res/values-v21
mkdir -p app/src/main/res/layout
echo -e "${GREEN}✓ Directories created${NC}"

# Step 3: Apply color modifications
echo -e "${YELLOW}[3/5]${NC} Applying dark theme (colors.xml)..."
cat > app/src/main/res/values/colors.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Dark Theme Colors -->
    <color name="primary">#1a1a1a</color>
    <color name="primary_dark">#0d0d0d</color>
    <color name="primary_light">#2a2a2a</color>
    
    <!-- Accent - Green -->
    <color name="accent">#00ff41</color>
    <color name="accent_light">#66ff88</color>
    <color name="accent_dark">#00cc33</color>
    
    <!-- Text Colors -->
    <color name="text_primary">#00ff41</color>
    <color name="text_secondary">#66ff88</color>
    <color name="text_tertiary">#339944</color>
    <color name="text_hint">#1a4d1a</color>
    
    <!-- Background -->
    <color name="background">#000000</color>
    <color name="surface">#1a1a1a</color>
    <color name="surface_variant">#2a2a2a</color>
    
    <!-- Status Colors -->
    <color name="success">#00ff41</color>
    <color name="error">#ff4444</color>
    <color name="warning">#ffbb33</color>
    <color name="info">#00ff41</color>
    
    <!-- UI Elements -->
    <color name="divider">#1a4d1a</color>
    <color name="button_background">#1a4d1a</color>
    <color name="button_pressed">#0d3d0d</color>
    <color name="card_background">#1a1a1a</color>
    
    <!-- Legacy compatibility -->
    <color name="white">#ffffff</color>
    <color name="black">#000000</color>
</resources>
EOF
echo -e "${GREEN}✓ colors.xml applied${NC}"

# Step 4: Apply styles.xml
echo -e "${YELLOW}[4/5]${NC} Applying Material Design theme (styles.xml)..."

# Backup original styles if exists
if [ -f "app/src/main/res/values/styles.xml" ]; then
    cp app/src/main/res/values/styles.xml app/src/main/res/values/styles.xml.bak
fi

cat > app/src/main/res/values/styles.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Main Application Theme - Dark with Green Accents -->
    <style name="AppTheme" parent="Theme.MaterialComponents.NoActionBar.Bridge">
        <!-- Primary Colors -->
        <item name="colorPrimary">@color/primary</item>
        <item name="colorPrimaryVariant">@color/primary_dark</item>
        
        <!-- Accent/Secondary Colors - Green -->
        <item name="colorSecondary">@color/accent</item>
        <item name="colorSecondaryVariant">@color/accent_dark</item>
        
        <!-- Text Colors -->
        <item name="android:textColorPrimary">@color/text_primary</item>
        <item name="android:textColorSecondary">@color/text_secondary</item>
        <item name="android:textColorHint">@color/text_hint</item>
        
        <!-- Background -->
        <item name="android:windowBackground">@color/background</item>
        <item name="colorSurface">@color/surface</item>
        
        <!-- Window/Status Bar -->
        <item name="android:windowLightStatusBar">false</item>
        <item name="android:statusBarColor">@color/primary_dark</item>
        <item name="android:navigationBarColor">@color/primary_dark</item>
        
        <!-- Component Colors -->
        <item name="buttonStyle">@style/CustomButton</item>
        <item name="materialButtonOutlinedStyle">@style/CustomOutlinedButton</item>
    </style>
    
    <!-- Custom Button Style -->
    <style name="CustomButton" parent="Widget.MaterialComponents.Button">
        <item name="android:textColor">@color/text_primary</item>
        <item name="backgroundTint">@color/button_background</item>
        <item name="android:textStyle">bold</item>
    </style>
    
    <!-- Custom Outlined Button -->
    <style name="CustomOutlinedButton" parent="Widget.MaterialComponents.Button.OutlinedButton">
        <item name="android:textColor">@color/accent</item>
        <item name="strokeColor">@color/accent</item>
    </style>
    
    <!-- Toolbar Style -->
    <style name="AppToolbar" parent="Widget.MaterialComponents.AppBarLayoutPrimary">
        <item name="android:background">@color/primary</item>
        <item name="android:elevation">4dp</item>
    </style>
    
    <!-- Card View Style -->
    <style name="AppCard" parent="Widget.MaterialComponents.CardView">
        <item name="cardBackgroundColor">@color/surface</item>
        <item name="cardElevation">2dp</item>
    </style>
    
    <!-- Text Input Field Style -->
    <style name="AppEditText" parent="Widget.MaterialComponents.TextInputEditText">
        <item name="android:textColor">@color/text_primary</item>
        <item name="android:textColorHint">@color/text_hint</item>
    </style>
    
    <!-- Settings Activity Theme -->
    <style name="SettingsTheme" parent="AppTheme">
        <item name="preferenceTheme">@style/PreferenceThemeOverlay.v14.Material</item>
    </style>
    
    <!-- Dialog Theme -->
    <style name="AppDialog" parent="Theme.MaterialComponents.Dialog">
        <item name="colorPrimary">@color/primary</item>
        <item name="colorSecondary">@color/accent</item>
        <item name="android:windowBackground">@color/surface</item>
        <item name="android:textColorPrimary">@color/text_primary</item>
    </style>
</resources>
EOF
echo -e "${GREEN}✓ styles.xml applied${NC}"

# Step 5: Apply styles-v21.xml for Android 5.0+
echo -e "${YELLOW}[5/5]${NC} Applying Android 5.0+ theme (styles-v21.xml)..."

cat > app/src/main/res/values-v21/styles.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Main Theme for Android 5.0+ -->
    <style name="AppTheme" parent="Theme.MaterialComponents.NoActionBar.Bridge">
        <!-- Primary Colors -->
        <item name="colorPrimary">@color/primary</item>
        <item name="colorPrimaryVariant">@color/primary_dark</item>
        
        <!-- Accent/Secondary Colors - Green -->
        <item name="colorSecondary">@color/accent</item>
        <item name="colorSecondaryVariant">@color/accent_dark</item>
        
        <!-- Text Colors -->
        <item name="android:textColorPrimary">@color/text_primary</item>
        <item name="android:textColorSecondary">@color/text_secondary</item>
        <item name="android:textColorHint">@color/text_hint</item>
        
        <!-- Background -->
        <item name="android:windowBackground">@color/background</item>
        <item name="colorSurface">@color/surface</item>
        
        <!-- Material Design 3 colors (if available) -->
        <item name="colorTertiary">@color/accent_light</item>
        <item name="colorTertiaryContainer">@color/button_background</item>
        
        <!-- System UI Colors -->
        <item name="android:windowLightStatusBar">false</item>
        <item name="android:statusBarColor">@color/primary_dark</item>
        <item name="android:navigationBarColor">@color/primary_dark</item>
        <item name="android:windowNavigationBarColor">@color/primary_dark</item>
        <item name="android:navigationBarDividerColor">@color/divider</item>
        
        <!-- Elevation Overlay -->
        <item name="elevationOverlayEnabled">true</item>
        <item name="elevationOverlayColor">@color/accent</item>
    </style>
</resources>
EOF
echo -e "${GREEN}✓ styles-v21.xml applied${NC}"

# Final summary
echo ""
echo "=========================================="
echo -e "${GREEN}✓ All modifications applied!${NC}"
echo "=========================================="
echo ""
echo "NFCGate v2.4.3 is ready with:"
echo "  ✓ Dark background (#000000)"
echo "  ✓ Neon green text (#00ff41)"
echo "  ✓ Material Design 3 dark theme"
echo "  ✓ Android 5.0+ support (API 21+)"
echo ""
echo "Next steps:"
echo "  1. ./gradlew clean"
echo "  2. ./gradlew assembleDebug"
echo ""
