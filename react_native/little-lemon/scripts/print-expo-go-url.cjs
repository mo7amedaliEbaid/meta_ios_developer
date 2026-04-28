#!/usr/bin/env node
/**
 * Prints exp:// URL for Expo Go "Enter URL manually" when the CLI can't draw a QR
 * (non-TTY terminals, Cursor Agent terminal, CI).
 */
const os = require("os");

function lanIPv4() {
  try {
    const nets = os.networkInterfaces();
    for (const name of Object.keys(nets)) {
      for (const net of nets[name] || []) {
        if (net.family === "IPv4" && !net.internal) {
          return net.address;
        }
      }
    }
  } catch {
    // Sandboxed or restricted environments may throw on networkInterfaces().
  }
  return "127.0.0.1";
}

// Expo CLI usually prints Metro as exp://LAN_IP:8081 (SDK 54+). Override if your terminal shows another port.
const port = process.argv[2] || process.env.EXPO_PORT || "8081";
const ip = lanIPv4();
console.log("");
console.log("Expo Go → Projects → Enter URL manually, then paste:");
console.log("");
console.log(`  exp://${ip}:${port}`);
console.log("");
if (ip === "127.0.0.1") {
  console.log(
    "WARNING: This machine’s LAN IP could not be detected. 127.0.0.1 on your PHONE",
  );
  console.log(
    "points at the phone itself → Expo Go shows errors like “Failed to download remote update”.",
  );
  console.log(
    "Run this script on your Mac with Metro running, or use ipconfig/ifconfig to get your Wi‑Fi IP.",
  );
  console.log("");
}
console.log("(Phone must be on the same Wi‑Fi as this machine.)");
console.log("");
