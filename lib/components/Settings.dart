import 'package:flutter/material.dart';
import 'CustomComponents/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('Settings'),
        actions: [
          IconButton(onPressed: (){print("search");}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: CustomDrawer(
        drawer_list: ["Explore Funds","Calculator","NFO","Settings"],
      ),
      body: Center(
          child: Text('Settings')
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


