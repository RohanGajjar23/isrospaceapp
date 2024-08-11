import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Models/SolarModel.dart';
import 'package:isrospaceapp/Pages/PlanetTile.dart';
import 'package:isrospaceapp/Pages/PlanetsPage.dart';
import 'package:page_transition/page_transition.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({super.key});

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  List<SolarModel> model = [];
  late SolarModel planet;
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
                Color.fromARGB(255, 4, 36, 63),
                Color.fromARGB(255, 60, 4, 71),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 34, 61),
                Color.fromARGB(255, 93, 5, 110),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Milky_Way').snapshots(),
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
                  model = data.docs
                      .map((e) => SolarModel.fromJson(e.data()))
                      .toList();
                  return Container(
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width / 90),
                          height: size.height/1.2,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            
                            itemCount: model.length,
                            itemBuilder: (context, index) {
                              print(model.length);
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        Navigator.of(context).push(PageTransition(
                                            child: planetUI(model: model[index]),
                                            type: PageTransitionType.fade));
                                      });
                                    },
                                    child: PlanetTile(
                                      model: model[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height / 90,
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
