import 'package:careerguidancepaths_app/Extra/Theme/theme.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step%202.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step%203.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step%204.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step1.dart';
import 'package:careerguidancepaths_app/app/account/Provider/MyPathsProvider.dart';
import 'package:careerguidancepaths_app/app/account/Provider/sharedPreferenceProvider.dart';
import 'package:careerguidancepaths_app/auth/auth_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app/account/Provider/CPIprovider.dart';
import 'app/account/Provider/careerPointsDataProvider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => cpiProvider()),
            ChangeNotifierProvider(create: (context)=>cpdProvider()),
            ChangeNotifierProvider(create: (context)=>myPathsProvider()),
            ChangeNotifierProvider(create: (context)=>sharedprefs()..getMode())
          ],
          child: Consumer<sharedprefs>(
            builder:(BuildContext context,value2,Widget? child)=> MaterialApp(
              theme: !value2.isDark? lightMode:darkMode,
              title: 'Career Catalyst',
              home: const AuthPage(),
              debugShowCheckedModeBanner: false,

            ),
          ),
        );
      },
    );
  }
}
