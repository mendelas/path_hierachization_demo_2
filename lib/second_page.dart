import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'main_model.dart';

class SecondPage extends StatelessWidget{
  String nameText ='';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'path provider demo',
      home:ChangeNotifierProvider<MainModel>(
        create: (_) =>MainModel(),
        child: Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.red,
            title:const Text('記入'),
          ),
          body:Consumer<MainModel>(builder: (context,model,child) {
            return Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged:(text){
                      nameText = text;
                      Provider.of<MainModel>(context, listen: false).TextChanged(nameText);
                      print(Provider.of<MainModel>(context, listen: false).textValue);
                    },
                  ),
                  //Text(name),
                  ElevatedButton(
                    child: Text('前のページに戻る'),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>MyApp(),)
                      );
                    },
                  ),
                ],
              ),
            );
          }
        ),
      ),
    ),
    );
  }
}

/*class SecondPage extends StatelessWidget {
  //SecondPage(this.name);
  //final String name;
  String nameText ='';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.red,
        title:const Text('記入'),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged:(text){
                nameText = text;
                Provider.of<MainModel>(context, listen: false).TextChanged(nameText);
                print(Provider.of<MainModel>(context, listen: false).textValue);
              },
            ),
            //Text(name),
            ElevatedButton(
              child:null,
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>MyApp(),)
                );
                },
            ),
          ],
        ),
      ),
    );
  }
}*/