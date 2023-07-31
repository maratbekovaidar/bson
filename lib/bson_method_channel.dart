import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bson_platform_interface.dart';

/// An implementation of [BsonPlatform] that uses method channels.
class MethodChannelBson extends BsonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bson');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
