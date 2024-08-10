import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/loginapi.dart';
import 'package:isrospaceapp/Apis/space_api.dart';
import 'package:isrospaceapp/Models/Launch.dart';

class Eventspage extends StatefulWidget {
  const Eventspage({super.key});

  @override
  State<Eventspage> createState() => _EventspageState();
}

class _EventspageState extends State<Eventspage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Events', style: TextStyle(color: Colors.white)),
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
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "Upcoming Events",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: size.height / 20,
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: size.height / 90,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: Spaceapi.shared.events.length,
                    itemBuilder: (context, index) {
                      Launch launch = Spaceapi.shared.events[index];

                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        width: size.width / 1.2,
                        height: size.height / 10,
                        decoration: const BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            launch.name != null ? launch.name! : "Name Unavailable",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: size.height / 40,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              launch.windowStart != null ? launch.windowStart!.toString() : "Date Unavailable",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: size.height / 50,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          leading: Container(
                            width: size.width / 4,
                            height: size.height / 20,
                            child: launch.image != null ?CachedNetworkImage(
                              imageUrl: launch.image!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ) : Icon(Icons.error),
                          ),
                          // trailing: InkWell(
                          //     onTap: () {},
                          //     child: Icon(Icons.arrow_forward_ios_outlined)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
