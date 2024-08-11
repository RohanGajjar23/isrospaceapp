import 'package:flutter/material.dart';
import 'package:isrospaceapp/Apis/NewsApiClient.dart';
import 'package:isrospaceapp/Apis/loginapi.dart';
import 'package:isrospaceapp/Providers/NewsLoadingProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsApiClient newsApiClient = NewsApiClient();

  @override
  void initState() {
    super.initState();
    fetchSpaceNews(context);
  }

  void fetchSpaceNews(BuildContext context) async {
    await newsApiClient.getSpaceNews();
    Provider.of<Newsloadingprovider>(context, listen: false).setLoading(false);
  }

  Future<void> launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<Newsloadingprovider>().isLoading;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Space News', style: TextStyle(color: Colors.white)),
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
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Space News',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: size.height / 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      Container(
                        height: size.height / 1.2,
                        child: ListView.builder(
                          itemCount: newsApiClient.news.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // open http link regarding that article
                                try {
                                  launchURL(newsApiClient.newsLink[index]);
                                } catch (e) {}
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          newsApiClient.news[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: size.height / 30,
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          newsApiClient.newsBody[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: size.height / 40,
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
