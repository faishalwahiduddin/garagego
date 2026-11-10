/// Store-screenshot demo mode (`--dart-define=STORE_DEMO=true`).
const bool kStoreDemo = bool.fromEnvironment('STORE_DEMO');

/// Language forced for the seed + UI during store captures (`--dart-define=STORE_DEMO_LOCALE=en`).
const String kStoreDemoLocale = String.fromEnvironment('STORE_DEMO_LOCALE');
