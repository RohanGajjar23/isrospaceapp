import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/loginapi.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Pages/homepage.dart';
import 'package:isrospaceapp/Providers/loadingprovider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Future<void> displayBottomModalSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: false,
      backgroundColor: const Color.fromARGB(255, 2, 31, 54),
      builder: (context) {
        final isSignedIn = context.watch<Loadingprovider>().isSignedIn;
        return Stack(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isSignedIn
                          ? Icon(
                              Icons.check_circle_outlined,
                              color: Colors.green,
                              size: size.height / 20,
                            )
                          : CircularProgressIndicator(),
                      SizedBox(width: 20),
                      Text(
                        isSignedIn
                            ? "Signed In Successfully\nWelcome, ${Loginapi.shared.user!.displayName}"
                            : 'We are signing you in, Please wait...',
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height / 50),
                      ),
                    ],
                  ),
                  SizedBox(
                      // height: size.height/50,
                      ),
                ],
              ),
            ),
            isSignedIn ? Positioned(
              bottom: 15, // Adjust this to control the button's position from the bottom
              right: 15, // Center the button
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 4, 46, 82)),
                ),
                onPressed: () {
                  // Navigator.pop(context); // This will close the modal
                  Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ) : SizedBox(),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            'assets/bg.jpg',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        SizedBox(
            width: size.width,
            height: size.height,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: size.width / 1.5,
              height: size.height / 3,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 2, 31, 54)),
                ),
                onPressed: () {
                  displayBottomModalSheet(context, size);
                  Loginapi.shared.signInWithGoogle(context);
                },
                child: Container(
                  width: size.width / 1.5,
                  height: size.height / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage('assets/google.png'),
                        height: size.height / 20,
                      ),
                      Text(
                        'Login With Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
