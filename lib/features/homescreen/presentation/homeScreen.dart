import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/features/homescreen/presentation/widgets/imageswidgets.dart';
import 'package:pixelsapp/features/homescreen/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  // HomeProvider _provider = HomeProvider();
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _provider.getHomeGallery();
    // });
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      ImagesWidgets(),
      ImagesWidgets(),
      ImagesWidgets(),
      ImagesWidgets(),
      ImagesWidgets(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          size: 20,
        ),
        activeColorPrimary: ColorsRes.white,
        inactiveColorPrimary: ColorsRes.darktext,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          size: 30,
          Icons.search,
          weight: 900,
        ),
        activeColorPrimary: ColorsRes.white,
        inactiveColorPrimary: ColorsRes.darktext,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add,
          size: 40,
          weight: 5000,
        ), // This is not visible, as it will be covered by the FAB
        activeColorPrimary: ColorsRes.white,
        inactiveColorPrimary: ColorsRes.darktext,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message),
        activeColorPrimary: ColorsRes.white,
        inactiveColorPrimary: ColorsRes.darktext,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: ColorsRes.white,
        inactiveColorPrimary: ColorsRes.darktext,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // _provider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: PersistentTabView(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.black, // Default color of the nav bar
        handleAndroidBackButtonPress: true, // Handle back button behavior
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : 60.0,

        navBarStyle: NavBarStyle.style6, // Choose the nav bar style
      ),
    );
  }
}
