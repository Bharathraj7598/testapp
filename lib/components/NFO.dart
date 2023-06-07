import 'package:flutter/material.dart';
import 'CustomComponents/drawer.dart';

class NFO extends StatefulWidget {
  const NFO({Key? key}) : super(key: key);
  @override
  State<NFO> createState() => _NFOState();
}

class _NFOState extends State<NFO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('NFO Page'),
        actions: [
          IconButton(onPressed: (){print("search");}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: CustomDrawer(
        drawer_list: ["Explore Funds","Calculator","NFO","Settings"],
      ),
      body: Center(
          child: Image(
            image: AssetImage('assets/nfo.png'),
          )
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


