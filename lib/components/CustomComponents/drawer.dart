import 'package:flutter/material.dart';
import 'package:myappbr/components/NFO.dart';
import 'package:myappbr/components/Explore Funds.dart';
import 'package:myappbr/components/Calculator.dart';
import 'package:myappbr/components/Settings.dart';
import 'package:myappbr/components/home.dart';

class CustomDrawer extends StatefulWidget {
  var drawer_list;
  CustomDrawer({Key? mykey,this.drawer_list}) : super(key: mykey);
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Bharath'),
                accountEmail: Text('bharath@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text('BR',style: TextStyle(color: Colors.blue),),
                ),
              ),
              ...widget.drawer_list.map((drawer_list){
                return ListTile(
                  title: Text(drawer_list),
                    onTap: (){
                      print(drawer_list);
                      if(drawer_list=="Calculator"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Calculator(),),);
                      }else if(drawer_list=="Explore Funds"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExploreFunds(),),);
                      }else if(drawer_list=="NFO"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NFO(),),);
                      }else if(drawer_list=="Settings"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings(),),);
                      }
                    },
                );
              })
            ],
          ),
        );
  }
}
