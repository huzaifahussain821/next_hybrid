import 'dart:io';
import 'package:purpose_payment/screens/dashboard/controller/dashboard_controller.dart';
import 'package:purpose_payment/screens/edit_profile/edit_profile.dart';
import 'package:purpose_payment/screens/home/autolist_home.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/screens/settings/settings_view.dart';

import '../../../../utilities/app_exports.dart';
import '../../../../widgets/custom_bottombar.dart';

class DashboardView extends StatefulWidget {
  final int? currentIndex;

  const DashboardView({super.key, this.currentIndex});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // int _selectedIndex = 0;
  static final List<NavBarItem> _navBarItems = [
    const NavBarItem(
      iconFilled: AssetsPath.homeIcon,
    ),
    const NavBarItem(
      iconFilled: AssetsPath.searchIcon,
    ),
    const NavBarItem(
      iconFilled: AssetsPath.settingsIcon,
    ),
  ];
  static final List<Widget> _widgetOptions = <Widget>[
    const AutoListHome(),
    MyProfileScreen(),
    const SettingsView(),
  ];

  @override
  void initState() {
    Get.put(DashboardController());

    DashboardController.to.currentIndex = widget.currentIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardController.to,
        builder: (dashboardController) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, dynamic) async {
              if (didPop) return;
              bool shouldExit = await showExitDialog(context);
              if (shouldExit) {
                exit(0);
              }
            },
            child: Scaffold(
              backgroundColor: AppThemes.primaryColor,
              drawerEnableOpenDragGesture: true,
              // appBar: AppBarWidget.mainAppBar("asd"),
              // drawer: const Drawer(child: CustomDrawerWidget()),
              body: Center(
                child: _widgetOptions.elementAt(widget.currentIndex ??
                    dashboardController.currentIndex ??
                    0),
              ),
              bottomNavigationBar: BottomNavBar(
                items: _navBarItems,
                currentIndex: dashboardController.currentIndex ?? 0,
                onTap: (index) {
                  setState(() {
                    DashboardController.to.currentIndex = index;
                  });
                  DashboardController.to.update();
                },
              ),
            ),
          );
        });
  }

  Future<bool> showExitDialog(BuildContext context) async {
    return await showGeneralDialog<bool>(
          context: context,
          barrierDismissible: true,
          barrierLabel: "Exit",
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation1, animation2) {
            return Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppThemes.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextWidget(
                        text: "Exit",
                        textSize: AppThemes.headingSize(),
                        textColor: AppThemes.black,
                      ),
                      const SizedBox(height: 10),
                      CustomTextWidget(
                        text: "Are you sure, you want to exit this app?",
                        textSize: AppThemes.subHeadingSize(),
                        textColor: AppThemes.black,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              isEnabled: true,
                              textColor: Colors.black,
                              width: double.infinity,
                              text: "Cancel",
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: CustomElevatedButton(
                              isEnabled: true,
                              width: double.infinity,
                              textColor: Colors.black,
                              text: "Exit",
                              onTap: () {
                                SystemNavigator.pop();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ) ??
        false;
  }
}
