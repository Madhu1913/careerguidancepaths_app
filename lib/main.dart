// import 'package:careerguidancepaths_app/app/appdata.dart';
import 'package:careerguidancepaths_app/app/Categories.dart';
import 'package:careerguidancepaths_app/auth/auth_Page.dart';
// import 'package:careerguidancepaths_app/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

// import 'auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
          ),
          initialRoute: '/',
          routes: {
            '/':(context)=>AuthPage(),
            // 'login': (context) => LoginScreen(),
            // 'appdata': (context) => Appdata(),
            // 'signup': (context) => SignUp(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}


