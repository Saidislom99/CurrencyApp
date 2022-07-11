
import 'package:flutter/material.dart';
import 'package:new_project/model/user.dart';
import 'package:new_project/service/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work with difficult API"),
      ),
      body: FutureBuilder(
       future: CurrencyService.getData(),
        builder: (context, AsyncSnapshot<List<Welcome>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title:
                        Text(snapshot.data![index].title!),
                        subtitle: Text(snapshot.data![index].cbPrice!),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}