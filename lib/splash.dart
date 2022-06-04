import 'package:flutter/material.dart';
import 'package:restapi_provider/Utils/routers.dart';
import './Screens/Authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(child: FlutterLogo(size: 25,)),
      ),
    );
  }
  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
   PageNavigator(ctx: context).nextPage(page: const LoginPage());
    });
  }
}