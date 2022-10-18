import 'package:flutter/material.dart';
import '../../api/menu_api.dart';
import '../../model/menu_model.dart';

enum MenuViewState {
  none,
  loading,
  error,
}

class MenuViewModel with ChangeNotifier {
  List<Menu> _menus = [];
  List<Menu> get menus => _menus;
  MenuViewState _state = MenuViewState.none;
  MenuViewState get state => _state;

  changeState(MenuViewState s) {
    _state = s;
    notifyListeners();
  }

  // getAllMenus() async {
  //   final c = await MenuAPI.getMenu();
  //   _menus = c;
  //   notifyListeners();
  // }

  getAllMenus() async {
    changeState(MenuViewState.loading);

    try {
      MenuAPI menuAPI = MenuAPI();
      final c = await menuAPI.getMenu();
      _menus = c;
      notifyListeners();
      changeState(MenuViewState.none);
    } catch (e) {
      changeState(MenuViewState.error);
    }
  }
}
