import 'package:careerguidancepaths_app/Extra/Theme/ThemeProvider.dart';
import 'package:careerguidancepaths_app/auth/auth_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          theme: Provider.of<ThemeProvider>(context).themeData,
          initialRoute: '/',
          routes: {
            '/': (context) => AuthPage(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
