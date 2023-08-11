import 'env_config.dart';
import 'environment.dart';

class BuildConfig {
  static final BuildConfig instance = BuildConfig._internal();
  late final Environment environment;
  late final EnvConfig config;

  bool _lock = false;

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }

  BuildConfig._internal();
}
