// Generate icon variants dari logo_apk.png (Wirago Academy)
// Source: 2816x1536 PNG
// Output:
//   assets/icon.png              — 1024x1024 main icon (eagle focused, square)
//   assets/android-icon-foreground.png — 1024x1024 adaptive foreground
//   assets/android-icon-background.png — 1024x1024 solid cream background
//   assets/splash-icon.png       — 1024x1024 full logo padded square
//   assets/wirago-logo.png       — 1024xAUTO untuk in-app use

import sharp from 'sharp';
import path from 'node:path';

const root = path.join(import.meta.dirname, '..');
const SRC = path.join(root, 'logo_apk.png');
const ASSETS = path.join(root, 'assets');

// Background color dari original logo (krem off-white)
const BG = { r: 250, g: 247, b: 240, alpha: 1 };

// Eagle head bounding box di source image (estimasi visual):
// Source 2816x1536, eagle roughly centered horizontally, upper 2/3
// Crop tighter agar text "Wirago Academy" tidak ke-include
const EAGLE_CROP = { left: 1000, top: 180, width: 820, height: 820 };

async function main() {
  console.log(`Source: ${SRC}`);
  const meta = await sharp(SRC).metadata();
  console.log(`Source size: ${meta.width}x${meta.height}, ${meta.format}, ${meta.hasAlpha ? 'alpha' : 'no alpha'}`);

  // 1. icon.png — 1024x1024, eagle head focused
  await sharp(SRC)
    .extract(EAGLE_CROP)
    .resize(1024, 1024, { fit: 'cover' })
    .flatten({ background: BG })
    .png({ quality: 100 })
    .toFile(path.join(ASSETS, 'icon.png'));
  console.log('✓ icon.png (1024x1024, eagle focused)');

  // 2. android-icon-foreground.png — 1024x1024, eagle dalam safe zone (inner 66%)
  // Resize eagle ke 660x660, padding 182px tiap sisi, background TRANSPARENT
  const eagleBuf = await sharp(SRC)
    .extract(EAGLE_CROP)
    .resize(660, 660, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .png()
    .toBuffer();
  await sharp({
    create: { width: 1024, height: 1024, channels: 4, background: { r: 0, g: 0, b: 0, alpha: 0 } },
  })
    .composite([{ input: eagleBuf, left: 182, top: 182 }])
    .png({ quality: 100 })
    .toFile(path.join(ASSETS, 'android-icon-foreground.png'));
  console.log('✓ android-icon-foreground.png (1024x1024, eagle 660px safe zone)');

  // 3. android-icon-background.png — solid cream
  await sharp({
    create: { width: 1024, height: 1024, channels: 4, background: BG },
  })
    .png({ quality: 100 })
    .toFile(path.join(ASSETS, 'android-icon-background.png'));
  console.log('✓ android-icon-background.png (solid cream)');

  // 4. splash-icon.png — 1024x1024 dengan eagle DOMINAN + nama di bawah
  // Strategi: eagle besar di tengah (800x800), wordmark "Wirago Academy" di bawahnya
  // supaya tetap recognizable di HP tinggi (contain mode di splash gak ke-pad jelek)
  const SPLASH_EAGLE_SIZE = 700;
  const SPLASH_EAGLE_TOP = 60;
  const eagleSplash = await sharp(SRC)
    .extract(EAGLE_CROP)
    .resize(SPLASH_EAGLE_SIZE, SPLASH_EAGLE_SIZE, { fit: 'contain', background: BG })
    .png()
    .toBuffer();
  const WORDMARK_CROP = { left: 500, top: 980, width: 1816, height: 350 };
  const wordmarkSplash = await sharp(SRC)
    .extract(WORDMARK_CROP)
    .resize({ width: 760, fit: 'inside' })
    .png()
    .toBuffer();
  const wordmarkMeta = await sharp(wordmarkSplash).metadata();
  const eagleLeft = Math.floor((1024 - SPLASH_EAGLE_SIZE) / 2);
  const wordmarkLeft = Math.floor((1024 - wordmarkMeta.width) / 2);
  const wordmarkTop = SPLASH_EAGLE_TOP + SPLASH_EAGLE_SIZE + 40;
  await sharp({
    create: { width: 1024, height: 1024, channels: 4, background: BG },
  })
    .composite([
      { input: eagleSplash, left: eagleLeft, top: SPLASH_EAGLE_TOP },
      { input: wordmarkSplash, left: wordmarkLeft, top: wordmarkTop },
    ])
    .png({ quality: 100 })
    .toFile(path.join(ASSETS, 'splash-icon.png'));
  console.log(`✓ splash-icon.png (1024x1024, eagle ${SPLASH_EAGLE_SIZE} + wordmark ${wordmarkMeta.width}x${wordmarkMeta.height})`);

  // 5. wirago-logo.png — full original aspect, 1024 wide untuk in-app
  await sharp(SRC)
    .resize({ width: 1024, fit: 'inside' })
    .png({ quality: 100 })
    .toFile(path.join(ASSETS, 'wirago-logo.png'));
  const wiragoMeta = await sharp(path.join(ASSETS, 'wirago-logo.png')).metadata();
  console.log(`✓ wirago-logo.png (${wiragoMeta.width}x${wiragoMeta.height}, full aspect)`);

  // 6. favicon.png — 48x48 web favicon
  await sharp(SRC)
    .extract(EAGLE_CROP)
    .resize(48, 48, { fit: 'cover' })
    .flatten({ background: BG })
    .png()
    .toFile(path.join(ASSETS, 'favicon.png'));
  console.log('✓ favicon.png (48x48)');

  console.log('\nAll icon variants generated.');
}

main().catch((e) => {
  console.error('Error:', e.message);
  process.exit(1);
});
