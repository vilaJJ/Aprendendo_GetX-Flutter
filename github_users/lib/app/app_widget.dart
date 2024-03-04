import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:github_users/app/data/pages/home/home_page.dart';
import 'package:github_users/app/data/pages/user_details/user_details_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return GetMaterialApp(
      title: 'GitHub Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/users', 
          page: () => const HomePage()),
        GetPage(
          name: '/users/details', 
          page: () => const UserDetailsPage(), 
          transition: Transition.cupertino)
      ],
      home: const HomePage(),
    );
  }
}