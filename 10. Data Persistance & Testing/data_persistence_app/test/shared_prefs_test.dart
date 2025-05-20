import 'package:data_persistence_app/services/shared_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPrefsService', () {
    late SharedPrefsService prefsService;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefsService = SharedPrefsService();
      await prefsService.init();
    });

    test('should save and retrieve a string value', () async {
      await prefsService.setString('user_name', 'Alice');

      final name = prefsService.getString('user_name');

      expect(name, equals('Alice'));
    });

    test('should return null for non-existent key', () {
      final result = prefsService.getString('non_existent_key');

      expect(result, isNull);
    });

    test('should save and retrieve a bool value', () async {
      await prefsService.setThemeMode(true);

      final theme = prefsService.getThemeMode();

      expect(theme, equals(true));
    });
  });
}
