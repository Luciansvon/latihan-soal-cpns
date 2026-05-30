// React Native provides a global WebSocket. @supabase/realtime-js falls back to
// requiring the Node 'ws' package (which pulls in 'stream' and other Node core
// modules unavailable in RN). Aliasing 'ws' to the global WebSocket via
// metro.config.js avoids that resolution chain entirely.
module.exports = global.WebSocket;
module.exports.WebSocket = global.WebSocket;
