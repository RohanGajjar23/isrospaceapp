import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/loginapi.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Pages/AuthPage.dart';
import 'package:isrospaceapp/Pages/DetailedPage.dart';
import 'package:isrospaceapp/Pages/EventsPage.dart';
import 'package:isrospaceapp/Pages/NewsPage.dart';
import 'package:isrospaceapp/Pages/PlanetPage.dart';
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
    Spaceapi.shared.getNasaPictureofDay().then((value) {
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
        actions: [
          InkWell(
            onTap: () {
              Loginapi.shared.signOut(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthPage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.white),
                Text("Logout",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 177, 167, 167))),
                Padding(padding: EdgeInsets.only(right: 20)),
              ],
            ),
          ),
        ],
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
          Container(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    // heading for the picture of the day...

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Picture of the Day',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: size.height / 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),

                    (isPODLoaded && imgURL != null)
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),
                            child: Center(
                                child: CachedNetworkImage(
                              width: size.width / 1.125,
                              height: size.height / 3,
                              imageUrl: imgURL!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )),
                          )
                        : Center(child: CircularProgressIndicator()),

                    Spaceapi.shared.events.isNotEmpty
                        ? Column(
                            children: [
                              // heading for the upcoming events...

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Upcoming Events',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: size.height / 20,
                                        color: Colors.white,
                                      ),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailedPage(
                                          launch: Spaceapi.shared.events[0]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: size.width / 1.2,
                                  height: size.height / 10,
                                  decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(1.0, 1.0),
                                        )
                                      ]),
                                  child: ListTile(
                                    title: Text(
                                      Spaceapi.shared.events[0].name != null
                                          ? Spaceapi.shared.events[0].name!
                                          : "Name Unavailable",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: size.height / 40,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        Spaceapi.shared.events[0].windowStart !=
                                                null
                                            ? Spaceapi
                                                .shared.events[0].windowStart!
                                                .toString()
                                            : "Date Unavailable",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: size.height / 65,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    leading: Container(
                                      width: size.width / 4,
                                      height: size.height / 20,
                                      child: Spaceapi.shared.events[0].image !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl: Spaceapi
                                                  .shared.events[0].image!,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            )
                                          : Icon(Icons.error),
                                    ),
                                    // trailing: InkWell(
                                    //     onTap: () {},
                                    //     child: Icon(Icons.arrow_forward_ios_outlined)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(8.0),
                        childAspectRatio: size.width / (size.height / 3),
                        children: [
                          GridItem(
                            icon: Icons.article,
                            title: 'News',
                            onTap: () {
                              // Handle News tap
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NewsPage()));
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PlanetPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
