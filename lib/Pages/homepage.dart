import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Pages/EventsPage.dart';
import 'package:isrospaceapp/Pages/SpaceCraftPage.dart';
import 'package:isrospaceapp/Pages/Utilities/GridItem.dart';
import 'package:isrospaceapp/Providers/loadingprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imgURL;

  @override
  void initState() {
    super.initState();
    Spaceapi.shared.FetchDataFromApi(context);
    // Spaceapi.shared.FetchDataFromFirestore();
    // Spaceapi.shared.uploadDataToFirestore();
    Spaceapi.shared.fetchNasaPictureofDay().then((value) {
      setState(() {
        imgURL = Spaceapi.shared.nasaPictureofDay!;
        Provider.of<Loadingprovider>(context, listen: false).updatePOD(true);
        log(imgURL!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPODLoaded = context.watch<Loadingprovider>().isPODLoaded;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Explorer', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 4, 36, 63),
                const Color.fromARGB(255, 60, 4, 71),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 2, 34, 61),
                  const Color.fromARGB(255, 93, 5, 110),
                  const Color.fromARGB(255, 109, 13, 126),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              isPODLoaded
                  ? Center(
                      child: Image.network(
                        imgURL!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(8.0),
                  childAspectRatio: size.width / (size.height / 2.5),
                  children: [
                    GridItem(
                      icon: Icons.article,
                      title: 'News',
                      onTap: () {
                        // Handle News tap
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => SpaceCraftPage()));
                      },
                    ),
                    GridItem(
                      icon: Icons.event,
                      title: 'Events',
                      onTap: () {
                        // Handle Events tap
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Eventspage()));
                      },
                    ),
                    GridItem(
                      icon: Icons.satellite,
                      title: 'Satellite',
                      onTap: () {
                        // Handle Satellite tap
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SpaceCraftPage()));
                      },
                    ),
                    GridItem(
                      icon: Icons.public,
                      title: 'Planets',
                      onTap: () {
                        // Handle Planets tap
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
