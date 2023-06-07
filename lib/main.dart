import 'package:flutter/material.dart';
import 'package:myappbr/components/login.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
 List<login>;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  int count = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if(state == AppLifecycleState.resumed){
        print('Resume');
        showInformationDialog(context);
      }else
      if(state == AppLifecycleState.inactive){
        print('Inactive');
      }else
      if(state == AppLifecycleState.paused){
        print('Paused');
      }
      // print(state);
    });
  }

  // //ADD FUNCTION
  // void handle_add(){
  //   setState(() {
  //     count = count + 10;
  //   });
  // }
  //
  // //SUB FUNCTION
  // void handle_sub(){
  //   setState(() {
  //     count = count - 10;
  //   });
  //   if(count < 0 ){
  //     setState(() {
  //       count = 0;
  //     });
  //   }
  // }

  //HANDLE CHANGE
  void handle_change(e){
    print(e);
  }

  Future<void> showInformationDialog(BuildContext context) {
      return showDialog(context: context,
          builder: (context){
            return AlertDialog(
                content: Text("App Resumed",),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'),
                  ),
                ],
            );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){print('Menu Button');}, icon: Icon(Icons.menu)),
        title: Text('App Bar'),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FloatingActionButton(onPressed: handle_add,child: Icon(Icons.add),),
                // Text("$count",style: TextStyle(color: Colors.blue,fontSize: 40),),
                // FloatingActionButton(onPressed: handle_sub,child: Icon(Icons.remove),),
                login()
              ],
            ),
      ),
      floatingActionButton: FloatingActionButton( child: Icon(Icons.search),onPressed: (){print('clicked');},),

    );
  }



}

