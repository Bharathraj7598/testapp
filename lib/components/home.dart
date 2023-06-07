import 'package:flutter/material.dart';
import 'CustomComponents/drawer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: (){print("search");}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: CustomDrawer(
        drawer_list: ["Explore Funds","Calculator","NFO","Settings"],
      ),
      body: Center(
        child: Text('Home Page')
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


