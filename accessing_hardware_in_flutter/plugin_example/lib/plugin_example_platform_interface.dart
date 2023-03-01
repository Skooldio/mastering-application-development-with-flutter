import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_example_method_channel.dart';

abstract class PluginExamplePlatform extends PlatformInterface {
  /// Constructs a PluginExamplePlatform.
  PluginExamplePlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginExamplePlatform _instance = MethodChannelPluginExample();

  /// The default instance of [PluginExamplePlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginExample].
  static PluginExamplePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginExamplePlatform] when
  /// they register themselves.
  static set instance(PluginExamplePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
