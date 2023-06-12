import 'package:flutter/material.dart';
import 'package:myroutine/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super (key: key);


  @override

  Widget build(BuildContext context){
    return  Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
           searchBox(),

          ],
        ),
      ),
    );
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration : BoxDecoration(
        color : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdBlack,size: 20,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search Text',
          hintStyle: TextStyle(color: tdGray),


        ),
      ),
    );
  }



  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
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
    );
  }
}

