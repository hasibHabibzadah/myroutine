import 'package:flutter/material.dart';
import 'package:myroutine/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super (key: key);


  @override

  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: tdBgColor,
        title : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Icon(
              Icons.menu,
              color: tdBlack,
              size: 30
          ),
          Container(
            height:40 ,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png'),
            ),
          )
        ],
        )
      ),

      body: Container(
        child: Text("This is my home screen"),
      ),
    );
  }
}