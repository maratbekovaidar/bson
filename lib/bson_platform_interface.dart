import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bson_method_channel.dart';

abstract class BsonPlatform extends PlatformInterface {
  /// Constructs a BsonPlatform.
  BsonPlatform() : super(token: _token);

  static final Object _token = Object();

  static BsonPlatform _instance = MethodChannelBson();

  /// The default instance of [BsonPlatform] to use.
  ///
  /// Defaults to [MethodChannelBson].
  static BsonPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BsonPlatform] when
  /// they register themselves.
  static set instance(BsonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
