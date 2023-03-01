import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/data_repository.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  DataRepository repository = DataRepository();

  // Future<List<String>> fetchCities() async {
  //   var data = await db.collection("cities").get();
  //   var cities = data.docs.map((e) => e["name"] as String).toList();
  //   return Future(() => cities);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: StreamBuilder(
        stream: repository.getStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var data = snapshot.data?.docs ?? [];
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].get("name")),
                  onLongPress: () {
                    repository.delete(data[index].reference.id);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          repository.add();
        },
        child: Text("Add"),
      ),
    );
  }
}
