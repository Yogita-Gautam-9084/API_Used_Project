import 'package:api_used_project/services/remote_services.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Details details;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    details = (await RemoteServices().getDetails())!;
    if (details != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  children: [
                    Text(details.name),
                    Text(details.films.toString()),
                    Text(details.height),
                    Text(details.hairColor),
                    Text(details.eyeColor),
                    Text(details.edited.toString()),
                    Text(details.gender),
                    Text(details.birthYear),
                    Text(details.homeworld),
                    Text(details.url),
                    Text(details.species.toString()),
                    Text(details.starships.toString()),
                    Text(details.created.toString()),
                    Text(details.vehicles.toString()),
                  ],
                ),
              ),
            ),
          )

          //
          // ListView.builder(
          //   itemCount: details?.length,
          //   itemBuilder: (context, int index) {
          //     return Card(
          //       child: Wrap(
          //         children: [
          //           const CircleAvatar(
          //             radius: 30,
          //             backgroundColor: Colors.black12,
          //           ),
          //           Text(details![index].toString()),
          //         ],
          //       ),
          //     );
          //   },
          // ),

          ),
    );
  }
}
