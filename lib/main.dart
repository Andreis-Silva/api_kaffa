import 'package:consumo_servico_avancado/pageOne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/pageOne" : (context) => pageOne()
    },
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("assets/logo.png",
          width: 1100,
          height: 60,
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.black87,
              icon: Icon(Icons.search),
              onPressed: (){
                /*
                Criei um button de procura caso o usuario deseje
                fazer uma pesquisa por algo especifico.
                Função anonima por enquanto falta implementar o metodo.
               */
              }
          )
        ],
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 30),
              child: Image.asset("assets/kaffa.jpg"),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "CLIQUE NO BOTÃO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black54
                ),
              ),
            ),

            RaisedButton(
                child: Text(
                  "API",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87
                  ),
                ),
                color: Colors.orange.shade600,
                onPressed: (){
                  Navigator.pushNamed(context, "/pageOne");
                }
            ),

          ],
        ),

      ),
    );
  }
}