import 'dart:convert';

import 'package:apiexample/models/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;


// by using a array json use a http request and make a listview

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  // future use
  
  List<PostsModel> postList =[]; //store in this list


  //here list describe as an array and PostsModel
  
  Future<List<PostsModel>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));// api response
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      postList.clear();

      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Example"),),
      body:Column(
        children: [
          
          
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),//call
              builder: (context, snapshot){
              if(!snapshot.hasData){
                return Text('Loading..');
              }else{

                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Title',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold),),
                         Text(postList[index].title.toString()),
                            SizedBox(height: 5,),
                            Text('Description',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold),),

                            Text(postList[index].body.toString()),

                          ],
                        ),
                      );



                });

              }
            },),
          )



        ],
      ),
    );
  }
}
