import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myappbr/components/CustomComponents/textField.dart';
import 'package:myappbr/components/home.dart';
import 'package:http/http.dart' as http;

createAlbum() async {
  print("Create Album");
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: {'charset':'utf-8',},
    body: {"title":"Bharath"}
  );

  if (response.statusCode == 201) {
    var rslt = (response.body);
    print(rslt);
    return jsonDecode(response.body);
  } else {
    print("Error");
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;
  const Album({required this.id, required this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Future<Album>? _futureAlbum;
  @override
  String name = "";
  String password = "";

  getUserData() async {
    print("Api Data");
    // print(await http.post(Uri.parse('https://jsonplaceholder.typicode.com/albums')));
    var api = "/mutual-fund/calculator";
    final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': "Bharathraj",
        })
    );
    if(response.statusCode==200){
      print("Fetch data");
    }else{
      print("Error in data");
    }
    print(response.body);
  }

  handle_login(){
    print('login');
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home(),),);
  }

  handle_fetch(){
    print('fetch');
    // getUserData();
    createAlbum();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextField(input: "Name",),
          CustomTextField(input: "Password",),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(onPressed: handle_fetch, child: Text('Fetch')),
                Spacer(),
                ElevatedButton(onPressed: handle_login, child: Text('Login')),
              ],
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    print("buildFutureBuilder");
    createAlbum();
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}







