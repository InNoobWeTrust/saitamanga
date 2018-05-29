abstract class ConfigHelper {
  Map<String, String> configs;
  final List<String> requiredConfigKeys;

  Set<dynamic> checkConfig(Map<String, String> configs) {
    if (configs == null || configs.isEmpty)
      return new Set<dynamic>()
        ..add(false)
        ..add('config is either null or empty!');
    final Map<String, String> filteredConfig = configs.entries
        .takeWhile((entry) => requiredConfigKeys.contains(entry.key))
        .fold(new Map<String, String>(),
            (acc, curr) => acc..[curr.key] = curr.value);
    if (filteredConfig == null || filteredConfig.isEmpty)
      return new Set<dynamic>()
        ..add(false)
        ..add('config does not contains all the required keys '
            '(after filtered found null or empty map)!');
    return new Set<dynamic>()..add(true)..add(filteredConfig);
  }
}
