import 'package:flutter/material.dart';
import 'package:myappbr/components/CustomComponents/textField.dart';

class CustomTextField extends StatefulWidget {
  var input;
  CustomTextField({Key? mykey,this.input}) : super(key: mykey);
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  handle_change(e){
    print(e);
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: TextField(
        obscureText: widget.input=="Password"?true:false,
        onChanged: handle_change,decoration: InputDecoration(
          labelText: widget.input,
          hintText: "Enter Password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      )
    );
  }
}
