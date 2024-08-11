import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Models/satelliteModel.dart';
import 'package:isrospaceapp/Models/spacecraft.dart';
import 'package:isrospaceapp/Pages/SatellitesDetailedPage.dart';

class SpaceCraftPage extends StatefulWidget {
  SpaceCraftPage({super.key});

  @override
  State<SpaceCraftPage> createState() => _SpaceCraftPageState();
}

class _SpaceCraftPageState extends State<SpaceCraftPage> {
  List<SatelliteModel> models = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Crafts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,

        iconTheme: IconThemeData(
          color: Colors.red, // Set your desired color here
        ),
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
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 2, 34, 61),
                const Color.fromARGB(255, 93, 5, 110),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // use events from spaceapi get all the events from it and display it here with a card format.
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Satellites")
                .where('Country of Contractor', isEqualTo: "India")
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.data == null) {
                    return Center(
                      child: Text(
                        "No Data Yet",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: size.width / 10),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  models = data.docs
                      .map((e) => SatelliteModel.fromJson(e.data()))
                      .toList();

                  return SafeArea(
                    child: Column(
                      children: [
                        Text(
                          "Satellites",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 60,
                                    color: Colors.white,
                                  ),
                        ),
                        SizedBox(
                          height: size.height / 90,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: models.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SatellitesDetailedPage(
                                        satelliteModel: models[index],
                                      ),
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
                                      models[index].name,
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
                                        models[index].country.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: size.height / 50,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    // leading: Container(
                                    //   width: size.width / 4,
                                    //   height: size.height / 20,
                                    //   child: Image.memory(Spaceapi.shared.spacecrafts[indexageUrl),
                                    // child: CachedNetworkImage(
                                    //   imageUrl: Spaceapi.shared.spacecrafts[index].imageUrl,
                                    //   fit: BoxFit.cover,
                                    //   placeholder: (context, url) => Center(
                                    //       child: CircularProgressIndicator()),
                                    //   errorWidget: (context, url, error) =>
                                    //       Icon(Icons.error),
                                    // ),
                                    // ),
                                    // trailing: InkWell(
                                    //     onTap: () {},
                                    //     child: Icon(Icons.arrow_forward_ios_outlined)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          )),
    );
  }
}
