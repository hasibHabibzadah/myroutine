import 'package:flutter/material.dart';
import 'package:myroutine/constants/colors.dart';
import '../model/ToDo.dart';
import '../widgets/todo_item.dart';
class Home extends StatefulWidget {

  Home({Key? key, required this.todo, this.onToDoChange, this.ondeleteItem}) : super (key: key);
  final ToDo todo;
  final onToDoChange;
  final ondeleteItem;


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();

  @override

  Widget build(BuildContext context){
    return  Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
               searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 20),
                            child: Text(
                              'All Routines ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),

                        ],
                      ),
                      for(ToDo todoo in todoList)
                      TodoItem(todo: todoo,
                        onTodoChnaged: __handleToBeChanged,
                        onDeleteItem: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add New Todo Item',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10
                    ),
                    onPressed: () {  },
                    child: Text("+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void __handleToBeChanged(ToDo todo){
    setState(() {
    todo.isDone = !todo.isDone;
    });
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
            child: Image.asset('assets/avatar.png'),
          ),
        )
      ],
      )
    );
  }
}

