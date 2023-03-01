
import 'plugin_example_platform_interface.dart';

class PluginExample {
  Future<String?> getPlatformVersion() {
    return PluginExamplePlatform.instance.getPlatformVersion();
  }
}
