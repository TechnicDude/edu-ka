import 'dart:math';
import 'package:edukaapp/model/menu.dart';
import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/provider/favorite_Provider.dart';
import 'package:edukaapp/provider/profile_Provider.dart';
import 'package:edukaapp/screens/MyAccount/account/accountscreen.dart';
import 'package:edukaapp/screens/favorite/favoritescreen.dart';

import 'package:edukaapp/screens/profilepage/profilescreen.dart';

import 'package:edukaapp/screens/home/components/allcourses/allcourses_screen.dart';
import 'package:edukaapp/screens/home/components/categories/allcategoriesscreen.dart';
import 'package:edukaapp/screens/home/home_screen.dart';
import 'package:edukaapp/screens/myCourses/components/AllCoursesWidgets/courselist.dart';
import 'package:edukaapp/screens/myCourses/mycourse.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/customBottomNavigationBar.dart';
import 'package:edukaapp/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import '../myCourses/components/FavoritedCourse/favoritedCourse.dart';
import 'components/btm_nav_item.dart';
import 'components/menu_btn.dart';
import 'components/side_bar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  int _selectedItem = 0;

  Menu selectedBottonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  List pages = [
    ChangeNotifierProvider<DashBoradProvider>(
        create: (BuildContext context) => DashBoradProvider(),
        child: HomePage()),
    ChangeNotifierProvider<DashBoradProvider>(
        create: (BuildContext context) => DashBoradProvider(),
        child: AllCategoriesScreen()),
    MyCoursesScreen(),
    ChangeNotifierProvider<FavoriteProvider>(
        create: (BuildContext context) => FavoriteProvider(),
        child: FavoriteScreen()),
    ChangeNotifierProvider<ProfileUserProvider>(
        create: (BuildContext context) => ProfileUserProvider(),
        child: AccountScreen()),
  ];

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appPrimarycolor,
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: const SideBar(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: pages[_selectedItem],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 220 : 0,
            top: 16,
            child: MenuBtn(
              press: () {
                isMenuOpenInput.value = !isMenuOpenInput.value;

                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(
                  () {
                    isSideBarOpen = !isSideBarOpen;
                  },
                );
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");

                artboard.addController(controller!);

                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.appPrimarycolor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.view_comfy_alt_outlined,
            Icons.play_circle_outline_rounded,
            Icons.favorite_sharp,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
      ),
    );
  }
}
