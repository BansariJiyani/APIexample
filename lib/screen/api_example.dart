
//example about photo list view  with GET API and future builder with a null safety

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';




class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {


  List<Photos> photosList =[]; //store in this list



  Future<List<Photos>> getPhotos() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));// api response
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      photosList.clear();

      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'], id:i['id']);      // describe value
        photosList.add(photos);
      }
      return photosList;
    }
    else{
      return photosList;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Photo ListView"),
      ),

      body: Column(
        children: [

          //future builder

          Expanded(
            child: FutureBuilder(future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot){

              return ListView.builder(
                itemCount: photosList.length,


                  itemBuilder: (context, index){

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        snapshot.data![index].url.toString(),
                      ),
                    ),
                    title: Text( snapshot.data![index].id.toString()),

                    subtitle: Text(snapshot.data![index].title.toString()),

                  );

                  });
                }),
          ),
        ],
      ),
    );
  }
}

//model

class Photos{
  String title;
  String url;
  int id;


  Photos({required this.title,
    required this.url,
    required this.id, });

}
