import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:isrospaceapp/Models/Launch.dart';
// import 'package:isrospaceapp/Models/Launch.dart';
import 'package:isrospaceapp/Models/satelliteMission.dart';
import 'package:isrospaceapp/Models/spacecraft.dart';
import 'package:http/http.dart' as http;
import 'package:isrospaceapp/Providers/EventsProvider.dart';
import 'package:isrospaceapp/Providers/loadingprovider.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'package:shared_preferences/shared_preferences.dart';

class Spaceapi {
  static Spaceapi shared = Spaceapi();

  final textToImageBase = Uri.parse('https://clipdrop-api.co/text-to-image/v1');
  final textToImageAPI =
      "6988183e156450615e6e955ef3ad43c588839b9c2c4254ece94aab903be65835463e77e2174a7724c741c56d2b1baa21";
  static const String geminiAPI = "AIzaSyAoIK6XzIul2eKRYs7ww444WtTsn0U2zxE";
  static const String nasaPictureofDayURL =
      'https://api.nasa.gov/planetary/apod?api_key=jVjcvM2s0fKNUyjcNqpI9na89NkMDbGWTldCcBkX';
  static const String baseUrl = 'https://services.isrostats.in/api/spacecraft';
  static const String baseEventsURL =
      "https://lldev.thespacedevs.com/2.2.0/launch/";

  String? nasaPictureofDay;

  List<Spacecraft> spacecrafts = [];
  List<Launch> events = [];

  final apiKey = Platform.environment[geminiAPI];
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: geminiAPI);

  Future<void> FetchAllEvents(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastFetchTime = prefs.getString('lastFetchTime');

    if (lastFetchTime != null) {
      DateTime lastFetch = DateTime.parse(lastFetchTime);
      if (DateTime.now().difference(lastFetch).inHours < 24) {
        // Use cached data if fetched within the last 24 hours
        log('Using cached data');
        List<Launch> cachedEvents = await getCachedEvents();
        // Process cached events as needed
        // for (var eventName in cachedEvents) {
        // log('Cached Event: ${eventName.name} at ${eventName.net}');
        // }
        events = cachedEvents
            .where((event) =>
                event.net != null && event.net!.isAfter(DateTime.now()))
            .toList()
          ..sort((a, b) => a.net!.compareTo(b.net!));
        log("Done Loading from Cached");
        Provider.of<Eventsprovider>(context, listen: false).setLoading(false);
        return;
      }
    }
    log("No cached data found, fetching from API");
    // Otherwise, fetch the data from the API
    String? nextUrl = baseEventsURL;
    List<Launch> allEvents = [];

    while (nextUrl != null) {
      http.Response r = await http.get(Uri.parse(nextUrl));
      final jsonEventsData = jsonDecode(r.body);

      final eventResults = jsonEventsData['results'];
      if (eventResults is List) {
        allEvents
            .addAll(eventResults.map((data) => Launch.fromJson(data)).toList());
      } else {
        log('Expected a list of events, but got: ${eventResults.runtimeType}');
      }

      nextUrl = jsonEventsData['next'];

      if (nextUrl == null) {
        log('No more pages to fetch.');
      }
    }

    // Cache the fetched events
    await cacheEvents(allEvents);

    // Store the fetch time
    await prefs.setString('lastFetchTime', DateTime.now().toIso8601String());
    Provider.of<Eventsprovider>(context, listen: false).setLoading(false);
  }
  // Future<void> FetchAllEvents() async {
  //   String? nextUrl = baseEventsURL;

  //   List<Launch> allEvents = [];

  //   while (nextUrl != null) {
  //     http.Response r = await http.get(Uri.parse(nextUrl));
  //     final jsonEventsData = jsonDecode(r.body);

  //     final eventResults = jsonEventsData['results'];
  //     if (eventResults is List) {
  //       allEvents
  //           .addAll(eventResults.map((data) => Launch.fromJson(data)).toList());
  //     } else {
  //       log('Expected a list of events, but got: ${eventResults.runtimeType}');
  //     }
  //     await cacheEvents(
  //         eventResults.map((data) => Launch.fromJson(data)).toList());
  //     nextUrl = jsonEventsData['next'];

  //     if (nextUrl == null) {
  //       log('No more pages to fetch.');
  //     }
  //   }

  //   // Filter and sort the events
  //   final DateTime now = DateTime.now();
  //   events = allEvents
  //       .where((event) => event.net != null && event.net!.isAfter(now))
  //       .toList()
  //     ..sort((a, b) => a.net!.compareTo(b.net!));

  //   // Log sorted events
  //   for (var eventName in events) {
  //     log('Upcoming Event: ${eventName.name} at ${eventName.net}');
  //   }

  //   // Log the total number of upcoming events
  //   log('Total upcoming events: ${events.length}');
  // }

  Future<void> FetchDataFromApi(BuildContext context) async {
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (!context.mounted) {
      return;
    }
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      spacecrafts = jsonData.map((data) => Spacecraft.fromJson(data)).toList();
      for (var spacecraft in spacecrafts) {
        // var request = http.MultipartRequest('POST', textToImageBase)
        //   ..headers['x-api-key'] = textToImageAPI
        //   ..fields['prompt'] =
        //       spacecraft.name! + " " + spacecraft.launchVehicle!;

        // final gresponse = await request.send();
        // final bytes = await gresponse.stream.toBytes();
        // spacecraft.imageUrl = bytes;
        log(spacecraft.name.toString() + "  " + spacecraft.link.toString());
      }
      await FetchAllEvents(context);
      Provider.of<Loadingprovider>(context, listen: false).updateLoading(false);
    } else {
      throw Exception('Failed to fetch spacecrafts: ${response.statusCode}');
    }
  }

  Future<String> getNasaPictureofDay() async {
    var box = Hive.box<String>('nasaBox');

    // Check if the image URL is in cache
    String? cachedUrl = box.get('nasaPictureUrl');

    if (cachedUrl != null) {
      // Return the cached URL if available
      log('Returning cached URL');
      nasaPictureofDay = cachedUrl;
      return cachedUrl;
    } else {
      // Fetch the image URL from the API
      log('Fetching from API');
      http.Response response = await http.get(Uri.parse(nasaPictureofDayURL));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final imageUrl = jsonData['url'];

        // Cache the URL using Hive
        await box.put('nasaPictureUrl', imageUrl);
        nasaPictureofDay = imageUrl;
        return imageUrl;
      } else {
        throw Exception(
            'Failed to fetch picture of the day: ${response.statusCode}');
      }
    }
  }

  String jsonFormat =
      '{"satellite_name":"INS-2TD","mission_name":"INS-2TD with launch vehicle PSLV-C52/EOS-04","launch_date":"February 14, 2022","launch_vehicle":"PSLV-C52","launch_vehicle_mission_number":54,"purpose":"Technology demonstrator satellite, precursor to India-Bhutan Joint Satellite (INS-2B)","satellite_weight":1710,"satellite_power":2280,"satellite_mission_life":"6 months","payload_thermal_imaging_camera_land_surface_temperature_assessment":true,"payload_thermal_imaging_camera_water_surface_temperature_assessment":true,"payload_thermal_imaging_camera_vegetation_demarcation":true,"payload_thermal_imaging_camera_thermal_inertia":true,"related_website_1":"https://www.isro.gov.in/mission_PSLV_C52_INS_2TD.html","related_website_2":"https://en.wikipedia.org/wiki/PSLV-C52","related_website_3":"https://www.isro.gov.in/mission_PSLV_C52.html"}';

  Future<String> generateText(String spaceCraft, String launcher) async {
    String prompt =
        "The $spaceCraft was launched by $launcher get me all the data like what was the purpose for that in this given JSON FORMAT ONLY -> json : [$jsonFormat] \n no other description regarding that only json and strictly follow all the keys for that";
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    String result = response.text!
        .toString()
        .replaceAll('`', '')
        .replaceAll('json', '')
        .replaceFirst('\n', '')
        .replaceAll('[', '')
        .replaceAll(']', '');
    log(result);
    return result;
  }

  Future<String> fetchImageFromWeb(String link) async {
    final url = Uri.parse(link);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the HTML content
      var document = html_parser.parse(response.body);

      // Find the first image element
      dom.Element? imgElement = document.querySelector('img');

      if (imgElement != null &&
          !imgElement.attributes['src'].toString().contains("pdficons.gif")) {
        log("https://www.isro.gov.in/${imgElement.attributes['src']}");
        return "https://www.isro.gov.in/${imgElement.attributes['src']}";
      }
      return "null";
    } else {
      print('No image found on the page.');
      return "null";
    }
  }

  Future<void> uploadDataToFirestore() async {
    // 1. Read and parse the JSON file
    String jsonString = await rootBundle.loadString('assets/Sat.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    // print(jsonData.);

    // Reference to Firestore collection
    CollectionReference satellites =
        FirebaseFirestore.instance.collection('Satellites');

    // 2. Iterate through each satellite entry
    // print(jsonData['Sheet1'].length);
    for (dynamic satellite in jsonData['Sheet1']) {
      // 3. Upload each satellite to Firestore
      print(satellite["Current Official Name of Satellite"]
          .toString()
          .replaceAll('/', '-'));
      await satellites
          .doc(satellite["Current Official Name of Satellite"]
              .toString()
              .replaceAll('/', '-'))
          .set(satellite);
      print("Uploading....");
    }
  }

  Future<void> FetchDataFromFirestore() async {
    CollectionReference satellites =
        FirebaseFirestore.instance.collection('Satellites');

    // 1. Get all satellites from Firestore
    final snapshot = await satellites.get();

    // 2. Iterate through each document
    snapshot.docs.forEach((doc) {
      print(doc.data());
    });
  }
}
