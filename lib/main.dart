// ignore_for_file: unused_element

import 'package:coures_app/Drawer_Widget/custom_aboutus_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_coach_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_contactus_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_course_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_dashboard_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_image_slider_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_terms_of_condition_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_user_widget.dart';
import 'package:coures_app/Router/app_page.dart';
import 'package:coures_app/Router/routes.dart';
import 'package:coures_app/Screen/Authetication/login_screen.dart';
import 'package:coures_app/Screen/Home/admin_home_screen.dart';
import 'package:coures_app/Services/adminhome_services.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/string_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
 var isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
      isLogin = WebStorage.instance.sessionId != null;
      print('islogin ----------------------------> $isLogin');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    // return isLogin ? const AdminHomePage() : const LoginScreen();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Web Demo',

          theme: ThemeData.light().copyWith(
            // scaffoldBackgroundColor: App.backgroundColor,
            colorScheme:
                const ColorScheme.light().copyWith(primary: AppColor.blueColor),
            // dividerColor: Pallete.dividerColor,
            // dividerTheme: DividerThemeData(color: Pallete.dividerColor,),
          ),

          // home: const AdminHomePage(),
          // home: const LoginScreen(),
          // home: isLogin ? const AdminHomePage() : const LoginScreen(),
          home: GetStorage().read(userData) != null ? const AdminHomePage() : const LoginScreen(),
          builder: EasyLoading.init(),
          // getPages: AppPages.routes,
          // initialRoute: isLogin ? AppPages.ADMIN_HOME_ROUTE : AppPages.LOGIN_ROUTE ,

        );
        // return MaterialApp.router(
        //   debugShowCheckedModeBanner: false,
        //   title: 'Web Demo',
        //   theme: ThemeData.light().copyWith(
        //     colorScheme:
        //         const ColorScheme.light().copyWith(primary: AppColor.blueColor),
        //   ),
        //   routerConfig: _router,
        // );
      },
    );
  
  }
}

// GoRouter root navigator key.
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Navigation router.
final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/admin",
  routes: <RouteBase>[
    GoRoute(
        name: "admin",
        path: "/admin",
        pageBuilder: (_, routerState) {
          return NoTransitionPage<void>(
            key: routerState.pageKey,
            child: const AdminHomePage(),
          );
        }),
    GoRoute(
      name: "dashboard",
      path: "/dashboard",
      pageBuilder: (_, routerState) {
        return NoTransitionPage<void>(
          key: routerState.pageKey,
          child: const CustomDashboardWidget(),
        );
      },
    ),
    GoRoute(
      name: "course",
      path: "/course",
      pageBuilder: (_, routerState) {
        return NoTransitionPage<void>(
          key: routerState.pageKey,
          child: const CustomCourseWidget(),
        );
      },
    ),
    GoRoute(
      name: "coach",
      path: "/coach",
      pageBuilder: (_, routerState) {
        return NoTransitionPage<void>(
          key: routerState.pageKey,
          child: const CustomCoachWidget(),
        );
      },
    ),
    // Authentication page.
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "user",
      path: "/user",
      pageBuilder: (_, routerState) {
        return NoTransitionPage<void>(
          key: routerState.pageKey,
          child: const CustomUserWidget(),
        );
      },
    ),
    // User profile settings page.
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "imageslider",
      path: "/imageslider",
      builder: (_, routerState) {
        return const CustomImageSliderWidget();
      },
    ),
    // User profile settings page.
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "contactus",
      path: "/contactus",
      builder: (_, routerState) {
        return const CustomContactUsWidget();
      },
    ),
    // User profile settings page.
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "aboutus",
      path: "/aboutus",
      builder: (_, routerState) {
        return const CustomAboutUsWidget();
      },
    ),
    // User profile settings page.
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "termaofuse",
      path: "/termaofuse",
      builder: (_, routerState) {
        return const CustomTermsOfUseWidget();
      },
    ),
  ],
  // refreshListenable: refreshabler, // This ChangeNotifier shall implement any custom routing refresh, for example on user login.
  // // Refresh router on redux routing actions.
  // redirect: routerRedirect, // This function shall implement your redirection logic.
);
