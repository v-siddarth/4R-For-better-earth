// import 'package:four_r/features/home/screens/home_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:uri/uri.dart';

// import 'package:four_r/constants/error_handling.dart';
// import 'package:four_r/constants/utils.dart';
// import 'package:four_r/models/user.dart';
// import 'package:four_r/providers/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     try {
//       User user = User(
//         id: '',
//         name: name,
//         email: '',
//         password: password,
//         address: '',
//         type: '',
//         token: '',
//         cart: [],
//       );
//       http.Response res = await http.post(
//         Uri.parse('$Uri/api/signup'), //uri may be though error
//         body: user.toJson(),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           showSnackBar(
//             context,
//             "Account has been created",
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   void signInUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('$Uri/api/signin'), //uri may be though error
//         body: jsonEncode({'email': email, 'password': password}),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       print(res.body);
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           Provider.of<UserProvider>(context, listen: false);
//           await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
//           Navigator.pushNamedAndRemoveUntil(
//               context, HomeScreen.routeName, (route) => false);
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   void getUserData(BuildContext context) {}
//   // get user data
//   void getUserDataa(
//     //Use this function where "getUserData"
//     BuildContext context,
//   ) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('x-auth-token');

//       if (token == null) {
//         prefs.setString('x-auth-token', '');
//       }

//       var tokenRes = await http.post(
//         Uri.parse('$Uri/tokenIsValid'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'x-auth-token': token!
//         },
//       );

//       var response = jsonDecode(tokenRes.body);

//       if (response == true) {
//         http.Response userRes = await http.get(
//           Uri.parse('$Uri/'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'x-auth-token': token
//           },
//         );

//         var userProvider = Provider.of<UserProvider>(context, listen: false);
//         userProvider.setUser(userRes.body);
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }

//new
import 'dart:convert';

import 'package:four_r/common/widgets/bottom_bar.dart';
import 'package:four_r/constants/error_handling.dart';
import 'package:four_r/constants/global_var.dart';
import 'package:four_r/constants/utils.dart';
import 'package:four_r/models/user.dart';
import 'package:four_r/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
