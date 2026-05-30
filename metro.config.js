const { getDefaultConfig } = require('expo/metro-config');
const path = require('path');

const config = getDefaultConfig(__dirname);

// @supabase/realtime-js requires the Node 'ws' package, which in turn requires
// Node core modules ('stream', etc.) that don't exist in React Native. We only
// use Supabase auth + REST (no realtime), so we alias 'ws' to a shim that
// exports React Native's global WebSocket.
const wsShim = path.resolve(__dirname, 'src/shims/ws.js');
const originalResolveRequest = config.resolver.resolveRequest;

config.resolver.resolveRequest = (context, moduleName, platform) => {
  if (moduleName === 'ws' || moduleName.startsWith('ws/')) {
    return { type: 'sourceFile', filePath: wsShim };
  }
  if (originalResolveRequest) {
    return originalResolveRequest(context, moduleName, platform);
  }
  return context.resolveRequest(context, moduleName, platform);
};

module.exports = config;
