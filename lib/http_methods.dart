import 'package:api_used_project/constants/colors_constants.dart';
import 'package:api_used_project/constants/string_constants.dart';
import 'package:api_used_project/services/post_services.dart';
import 'package:flutter/material.dart';

class HttpMethods extends StatefulWidget {
  const HttpMethods({Key? key}) : super(key: key);

  @override
  State<HttpMethods> createState() => _HttpMethodsState();
}

class _HttpMethodsState extends State<HttpMethods> {
  PostServices postServices = PostServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.appbar),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          String? title;
          String? slug;
          String? content;
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              content: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: ColorsConstants.white30,
                        labelText: StringConstants.title,
                      ),
                      onChanged: (_var) {
                        title = _var;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        fillColor: ColorsConstants.white30,
                        filled: true,
                        labelText: StringConstants.slug,
                      ),
                      onChanged: (_var) {
                        slug = _var;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        fillColor: ColorsConstants.white30,
                        filled: true,
                        labelText: StringConstants.content,
                      ),
                      onChanged: (_var) {
                        content = _var;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(StringConstants.add),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: postServices.getPosted(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Center(
              child: Text('DATA'),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
