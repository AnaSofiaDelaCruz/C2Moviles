
import 'dart:html';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class MyApp extends State<DatosUsuarios> {
  
  // This widget is the root of your application.
  Future getRequest() async{
    var url = Uri.parse('https://randomuser.me/api/?results=100');
    final response =  await http.get(url);
    //var newData = jsondecode(snapshot.data.toString());
    final Map<String, dynamic> decodedData = convert.jsonDecode(response.body);

    for(var user in decodedData['results']){
      String info = user['name']['title']+' ';
      info += user['name']['first']+' ';
      info +=user['name']['last'];
      setState(() {
        listasUsuarios.add(info);
      });
    }


  }
  //late final List<String> response;
  List<String> listasUsuarios = [];

  @override
  void initState() {
    super.initState();
    getRequest();
    //listasUsuarios= getRequest() as List<String>;
  }

  //MyApp({Key? key, required this.response}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('183389 ANA SOFIA DE LA CRUZ NAVARRO'),
        ),
        body: Container(
           child: ListView.builder(
             itemCount: listasUsuarios.length,
             itemBuilder: (context, index) {
               return Card(
                 child: ListTile(
                  title: new Text('${index}  ${listasUsuarios[index]}'),
                ),
               );
             }
           ),
         )
      
      ),
      
    );

  }

  
}

class DatosUsuarios extends StatefulWidget{
  @override
  MyApp createState() => MyApp();
}