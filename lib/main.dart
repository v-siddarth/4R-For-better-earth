// //import 'dart:js';

// import 'package:four_r/constants/global_var.dart';
// import 'package:four_r/features/address/screens/address_screen.dart';
// import 'package:four_r/features/auth/screens/auth_screen.dart';
// // import 'package:four_r/features/auth/screens/sevices/auth_service.dart';
// import 'package:four_r/features/auth/sevices/auth_service.dart';
// import 'package:four_r/features/home/screens/home_screen.dart';
// import 'package:four_r/features/product_details/screens/product_details_screen.dart';
// import 'package:four_r/providers/user_provider.dart';
// import 'package:four_r/router.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:four_r/common/widgets/bottom_bar.dart';

// import 'features/admin/screens/admin_screen.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(
//       create: (context) => UserProvider(),
//     ),
//   ], child: const MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final AuthService authService = AuthService();

//   @override
//   void initState() {
//     super.initState();
//     authService.getUserData(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Amezon Clone',
//         theme: ThemeData(
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//           colorScheme: const ColorScheme.light(),
//           primaryColor: GlobalVariables.secondaryColor,
//           appBarTheme: const AppBarTheme(
//             elevation: 0,
//             iconTheme: IconThemeData(
//               color: Colors.black,
//             ),
//           ),
//           // useMaterial3: true,
//         ),
//         onGenerateRoute: (settings) => generateRoute(settings),
//         home: const BottomBar());
//   }

//   // @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

//new code

import 'package:four_r/common/widgets/bottom_bar.dart';
import 'package:four_r/constants/global_var.dart';
import 'package:four_r/features/admin/screens/admin_screen.dart';
import 'package:four_r/features/auth/screens/auth_screen.dart';
import 'package:four_r/features/auth/services/auth_service.dart';
import 'package:four_r/providers/user_provider.dart';
import 'package:four_r/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4R',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen() //bottom_bar replace with authscreen
          : const AuthScreen(),
    );
  }
}
