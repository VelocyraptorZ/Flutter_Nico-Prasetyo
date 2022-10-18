import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_view_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Provider.of<MenuViewModel>(context, listen: false).getAllMenus();
      var menuViewModel = Provider.of<MenuViewModel>(context, listen: false);
      await menuViewModel.getAllMenus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuViewModel = Provider.of<MenuViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
        ),
        body: body(menuViewModel));
  }

  Widget listView(MenuViewModel menuViewModel) {
    return ListView.builder(
        itemCount: menuViewModel.menus.length,
        itemBuilder: (context, index) {
          final menu = menuViewModel.menus[index];
          return ListTile(
            title: Text(menu.name),
          );
        });
  }

  Widget body(MenuViewModel menuViewModel) {
    final isLoading = menuViewModel.state == MenuViewState.loading;
    final isError = menuViewModel.state == MenuViewState.error;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Error Loaded'),
      );
    }

    return listView(menuViewModel);
  }
}
