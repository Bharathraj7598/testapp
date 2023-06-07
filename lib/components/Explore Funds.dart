import 'package:flutter/material.dart';
import 'CustomComponents/drawer.dart';

class ExploreFunds extends StatefulWidget {
  const ExploreFunds({Key? key}) : super(key: key);
  @override
  State<ExploreFunds> createState() => _ExploreFundsState();
}

class _ExploreFundsState extends State<ExploreFunds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('Explore Funds'),
        actions: [
          IconButton(onPressed: (){print("search");}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: CustomDrawer(
        drawer_list: ["Explore Funds","Calculator","NFO","Settings"],
      ),
      body: Center(
          child: Image(
            image: AssetImage('assets/explore_funds.png'),
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


