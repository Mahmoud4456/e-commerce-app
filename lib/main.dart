import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';
import 'package:untitled1/screens/update_screen.dart';
import 'package:untitled1/screens/user_screen.dart';


void main(){
  runApp( const StoreApp());
}

class StoreApp extends StatelessWidget {
   const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        routes: {
          HomePage.id : (context)=> HomePage(),
          UserScreen.id : (context)=> UserScreen(),
          UpdateScreen.id :(context) => UpdateScreen(),
        },
      initialRoute: UserScreen.id ,

    );
  }
}