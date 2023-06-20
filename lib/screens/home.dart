import 'package:flutter/material.dart';
import 'package:myroutine/constants/colors.dart';
import '../model/ToDo.dart';
import '../widgets/todo_item.dart';
class Home extends StatefulWidget {

  const Home({Key? key}) : super (key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final todoList = ToDo.todoList();
  List<ToDo> _foundTodo = [];
  final _todoController = TextEditingController();
  @override

  void initState() {
    // TODO: implement initState
    List<ToDo> _foundTodo = todoList;
    super.initState();
  }
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
                      for(ToDo todoo in _foundTodo)
                      TodoItem(todo: todoo,
                        onTodoChnaged: __handleToBeChanged,
                        onDeleteItem: _deleteToDoItem,
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
                    controller: _todoController,
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
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
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

  void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });

  }

  void _addToDoItem(String toDo){
    setState(() {
      todoList.add(ToDo(id: DateTime.now().millisecond.toString(), todoText: toDo));
    });

    _todoController.clear();
  }

  void _runFilter(String enteredKeyboard){
    List<ToDo> results = [];
    if(enteredKeyboard.isEmpty){
      results = todoList;
    }else{
      results = todoList.where((element) => element.todoText!.toLowerCase().contains(enteredKeyboard.toLowerCase())).toList();
    }
    setState(() {
      _foundTodo = results;
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
        onChanged: (value) => _runFilter(value),
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

