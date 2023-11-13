import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class sharedprefs extends ChangeNotifier{
    bool isDark=false;
    // bool get isDark=>_isDark;
    Future changeMode()async{
      final prefs=await SharedPreferences.getInstance();
      prefs.setBool('isDark',true);
      notifyListeners();
    }
    Future getMode()async{
      final prefs=await SharedPreferences.getInstance();
      final mode=prefs.getBool('isDark');
       if(mode!=null){
         isDark=mode;
       }
      notifyListeners();
    }
    Future revertMode()async{
      final prefs=await SharedPreferences.getInstance();
      prefs.setBool('isDark',false);
      notifyListeners();
    }

}