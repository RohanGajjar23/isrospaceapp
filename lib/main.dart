import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Models/Launch.dart';
import 'package:isrospaceapp/Pages/AuthPage.dart';
import 'package:isrospaceapp/Pages/homepage.dart';
import 'package:isrospaceapp/Providers/EventsProvider.dart';
import 'package:isrospaceapp/Providers/NewsLoadingProvider.dart';
import 'package:isrospaceapp/Providers/loadingprovider.dart';
import 'package:isrospaceapp/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('nasaBox');
  // Register the adapter for your model
  Hive.registerAdapter(LaunchAdapter());
  Hive.registerAdapter(StatusAdapter());
  Hive.registerAdapter(NetPrecisionAdapter());
  Hive.registerAdapter(UpdateAdapter());
  Hive.registerAdapter(LaunchServiceProviderAdapter());
  Hive.registerAdapter(RocketAdapter());
  Hive.registerAdapter(RocketConfigurationAdapter());
  Hive.registerAdapter(MissionAdapter());
  Hive.registerAdapter(OrbitAdapter());
  Hive.registerAdapter(AgencyAdapter());
  Hive.registerAdapter(InfoUrlAdapter());
  Hive.registerAdapter(InfoUrlTypeAdapter());
  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter(VideoUrlAdapter());
  Hive.registerAdapter(PadAdapter());
  Hive.registerAdapter(PadLocationAdapter());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Loadingprovider>(
        create: (context) => Loadingprovider(),
      ),
      ChangeNotifierProvider<Newsloadingprovider>(
        create: (context) => Newsloadingprovider(),
      ),
      ChangeNotifierProvider<Eventsprovider>(
        create: (context) => Eventsprovider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return AuthPage();
            } else {
              return HomePage(); // Directly return HomePage here
            }
          }
          return CircularProgressIndicator(); // Loading
        },
      ),
    ),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
