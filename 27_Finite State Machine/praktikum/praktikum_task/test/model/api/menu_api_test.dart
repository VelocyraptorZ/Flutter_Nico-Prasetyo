import 'package:mockito/annotations.dart';
import 'package:praktikum_task/api/menu_api.dart';
import 'package:praktikum_task/model/menu_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'menu_api_test.mocks.dart';

@GenerateMocks([MenuAPI])
void main() {
  group('MenuAPI', () {
    MenuAPI menuAPI = MockMenuAPI();
    test('Get All Data Menu', () async {
      when(menuAPI.getMenu()).thenAnswer(
        (_) async => <Menu>[
          Menu(id: 1, name: 'A'),
        ],
      );

      var menus = await menuAPI.getMenu();
      expect(menus.isNotEmpty, true);
    });
  });
}
