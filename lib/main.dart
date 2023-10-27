import 'package:careerguidancepaths_app/Extra/Theme/ThemeProvider.dart';
import 'package:careerguidancepaths_app/auth/auth_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'app/account/Provider/CPIprovider.dart';
import 'app/account/Provider/careerPointsDataProvider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>ThemeProvider()),
            ChangeNotifierProvider(create: (context) => cpiProvider()),
            ChangeNotifierProvider(create: (context)=>cpdProvider())
          ],
          child: Consumer<ThemeProvider>(
            builder:(BuildContext context,value,Widget? child)=> MaterialApp(
              theme: value.themeData,
              home: const AuthPage(),
              debugShowCheckedModeBanner: false,
            ),
          ),
        );
      },
    );
  }
}
