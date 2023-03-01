import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_example_platform_interface.dart';

/// An implementation of [PluginExamplePlatform] that uses method channels.
class MethodChannelPluginExample extends PluginExamplePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_example');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
