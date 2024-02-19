import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:lottie/lottie.dart";
import "package:satset/module/login/login_page.dart";
import "package:satset/module/splash%20screen/splash_bloc.dart";
import "package:satset/module/splash%20screen/splash_state.dart";

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({
    super.key,
  });

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver {
  TextEditingController tecSearch = TextEditingController();

  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    // Add a delay of 5 seconds using Future.delayed
    Timer(Duration(seconds: 3), () {
      // Navigate to login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoadLoading) {
          setState(() {
            loading = true;
          });
        } else if (state is SplashScreenLoadSuccess) {
          // Handle success if needed
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lottie/loker.json"),
                  Text(
                    "CARI LOKER",
                    style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
