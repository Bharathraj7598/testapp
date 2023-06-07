import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CustomComponents/drawer.dart';
import 'package:dio/dio.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var data;
  var form_data = {"pageUrl":"/mutual-fund/calculator"};
  getData() async {
    print("Get Data");
    var response =await http.post(
      Uri.http('192.168.1.129:5001','/api/funds/get_sub_menu_url'), body: form_data
    );
    var rslt = response.body;
    print(rslt);
    setState(() {
      data = rslt;
    });
    return response;
  }

  handle_fetch(){
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('Calculator Page'),
        actions: [
          IconButton(onPressed: (){print("search");}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: CustomDrawer(
        drawer_list: ["Explore Funds","Calculator","NFO","Settings"],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: handle_fetch,child: Text('Fetch'),),
            Text('${data!=[]?'$data':null }'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          )
        ],
      ),
    );
  }
}

// Uri.http('jsonplaceholder.typicode.com','users'),
// body: {"title":"Bharath"}
// Uri.http('http://192.168.1.129:5001/api/funds/get_sub_menu_url'),
// body: {"pageUrl":"/mutual-fund/calculator"}






