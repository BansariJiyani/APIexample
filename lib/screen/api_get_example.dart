
// in this example the json is start with a object - nested json not with an array


import 'dart:convert';

import 'package:apiexample/models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;


class ApiGetExample extends StatefulWidget {
  const ApiGetExample({super.key});

  @override
  State<ApiGetExample> createState() => _ApiGetExampleState();
}

class _ApiGetExampleState extends State<ApiGetExample> {





  Future<ProductsModel> getProductsApi() async{
    final response = await http.get(Uri.parse('https://webhook.site/2d03f458-283b-4ff3-8b63-ef8cb017518b'));

    var data =  jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {

      return ProductsModel.fromJson(data);
    }
    else{
      return ProductsModel.fromJson(data);

    }
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Get example"),),

      body: Column(
        children: [


          Expanded(
            child: FutureBuilder<ProductsModel>(
              future: getProductsApi (),
              builder: (context , snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(snapshot.data!.data![index].shop!.name.toString()),
                              subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height *.3,
                              width: MediaQuery.of(context).size.width * 1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data![index].images!.length,
                                  itemBuilder: (context, position){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height *.25,
                                        width: MediaQuery.of(context).size.width * .5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
                                            )
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
                          ],
                        );
                      });
                }else {
                  return Text('Loading');
                }
              },
            ),
          )

        ],
      ),
    );
  }
}
