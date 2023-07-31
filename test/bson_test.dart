import 'package:flutter_test/flutter_test.dart';
import 'package:bson/bson.dart';
import 'package:bson/bson_platform_interface.dart';
import 'package:bson/bson_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBsonPlatform
    with MockPlatformInterfaceMixin
    implements BsonPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BsonPlatform initialPlatform = BsonPlatform.instance;

  test('$MethodChannelBson is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBson>());
  });

  test('getPlatformVersion', () async {
    Bson bsonPlugin = Bson();
    MockBsonPlatform fakePlatform = MockBsonPlatform();
    BsonPlatform.instance = fakePlatform;

    expect(await bsonPlugin.getPlatformVersion(), '42');
  });
}
