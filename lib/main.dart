import 'package:flutter/material.dart';
import 'main_model.dart';
import 'package:provider/provider.dart';

import 'second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  String nameikenoText='';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'path provider demo',
      home:ChangeNotifierProvider<MainModel>(
        create: (_) =>MainModel(),
        child: Scaffold(
          appBar:AppBar(
            title: Text('コリアンダー'),
          ),
          body:Consumer<MainModel>(builder: (context,model,child) {
            return Center(
              child:Column(
                  children:[
                    Text(
                      model.ikenoText,
                      style: TextStyle(
                        fontSize:30,
                      ),
                    ),
                    Text(model.ikenonoText),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*TextField(
                          onChanged:(text){
                            nameText = text;
                          },
                        ),*/
                        /*FloatingActionButton(
                            onPressed:(){
                              int insertIndex = model.todoList.length;
                              model.createTodo("");
                              _listKey.currentState?.insertItem(insertIndex,
                                  duration: const Duration(milliseconds: 300));

                              //todoModel.todoList[todoModel.todoList.length - 1].focusNode.requestFocus();
                            }
                        )*/
                        TextField(
                          onChanged:(text){
                            nameikenoText = text;
                            Provider.of<MainModel>(context, listen: false).ikenoTextChanged(nameikenoText);
                            print(Provider.of<MainModel>(context, listen: false).ikenonoText);
                          },
                        ),
                        ElevatedButton(
                          child: Text('ボタン'),
                          /*if(model.ikenoText =='IKENO'){
                            onPressed: () {
                              model.changeikenoText();
                            }
                          }else{
                            onPressed: () {
                              model.changekakkoiiText();
                            }
                          }*/

                          /*onPressed:(){
                            if(model.ikenoText =='IKENO'){
                              model.changeikenoText();
                            }else{
                              model.changekakkoiiText();
                            }
                          }*/


                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>SecondPage(),)
                            );
                          },
                        ),
                      ],
                    ),
                  ]
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}