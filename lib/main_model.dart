import 'dart:collection';
import 'package:flutter/foundation.dart';

class Todo{
  Todo(this.id, this.title,this.check);
  int id;
  String title;
  bool check;
//FocusNode focusNode;
}

class MainModel extends ChangeNotifier{
  String ikenoText = 'IKENO';
  List<Todo> _todoList = [];

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(_todoList);

  void createTodo(String title) {
    final id = _todoList.length + 1;
    _todoList = [...todoList, Todo(id, title, false)];
    notifyListeners();
  }

  void updateTodo(int id, String title) {
    todoList.asMap().forEach((int index, Todo todo) {
      if (todo.id == id) {
        _todoList[index].title = title;
      }
    });
    notifyListeners();
  }

  void updateCheck(int id, bool check) {
    todoList.asMap().forEach((int index, Todo todo) {
      if (todo.id == id) {
        _todoList[index].check = check;
      }
    });
    notifyListeners();
  }

  void deleteTodo(int id) {
    _todoList = _todoList.where((todo) => todo.id != id).toList();
    _todoList.asMap().forEach((int index, Todo todo) {
      _todoList[index].id = index + 1;
    });
    notifyListeners();
  }

// フォームから入ってくる値を格納する変数を定義
  String textValue = 'text';
  // 関数に「String型のtext」という引数を書く
  void TextChanged(String text) {
    // 上で定義した「textValue」という変数を呼び出して、関数の中に書いておく。この変数の中に、
    //関数の引数を格納しておく。
    // 上で定義した変数 = 引数
    textValue = text;
    // ChangeNotifierを使用しているclassに使用できる関数、値が変わったことを他のページにも知らせて更新させる役目をもっている
    notifyListeners();
  }

  String ikenonoText ='';
  void ikenoTextChanged(String text) {
    // 上で定義した「textValue」という変数を呼び出して、関数の中に書いておく。この変数の中に、
    //関数の引数を格納しておく。
    // 上で定義した変数 = 引数
    ikenonoText = text;
    // ChangeNotifierを使用しているclassに使用できる関数、値が変わったことを他のページにも知らせて更新させる役目をもっている
    notifyListeners();
  }





/*void changeikenoText(){
    ikenoText = 'いけのさんかっこいい';
    notifyListeners();
  }

  void changekakkoiiText(){
    ikenoText = 'IKENO';
    notifyListeners();
  }*/


}