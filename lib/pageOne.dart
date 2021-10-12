import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.Dart';
import 'DAO/Post.dart';

class pageOne extends StatefulWidget {
  @override
  _pageOneState createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {

  String _urlBase = "http://worldclockapi.com/api/json/utc/now";

    String _id = "";
    String _currentDateTime = "";
    String _utcOffset = "";
    String _dayOfTheWeek = "";
    String _timeZoneName = "";
    String _currentFileTime = "";
    String _ordinalDate = "";
    String _serviceResponse = "";
    String _now= "";

    _recuperarAPI() async{
    http.Response response = await http.get(_urlBase);
    print(response.body);

    Map<String, dynamic> dadosJson = json.decode( response.body );
    int id = dadosJson["id"];
    String currentDateTime = dadosJson["currentDateTime"];
    String utcOffset = dadosJson["utcOffset"];
    String dayOfTheWeek = dadosJson["dayOfTheWeek"];
    String timeZoneName = dadosJson["timeZoneName"];
    int currentFileTime = dadosJson["currentFileTime"];
    String ordinalDate = dadosJson["ordinalDate"];
    String serviceResponse = dadosJson["serviceResponse"];



    DateTime now = new DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-ddkk:mm').format(now);
    print(formattedDate);
    _now = formattedDate.substring(0,10)+"T"+formattedDate.substring(10,15)+"Z";
    print(_now);

    setState(() {
      _id = "Id: ${id.toString()}";
      _currentDateTime = "CurrentDateTime: ${currentDateTime}";
      _utcOffset = "UtcOffset: ${utcOffset}";
      _dayOfTheWeek = "DayOfTheWeek: ${dayOfTheWeek}";
      _timeZoneName = "TimeZoneName: ${timeZoneName}";
      _currentFileTime = "ServiceResponse: ${currentFileTime.toString()}";
      _ordinalDate = "OrdinalDate: ${ordinalDate}";
      _serviceResponse = "ServiceResponse: ${serviceResponse}";

    });
  }

  _post() async{

    var corpo = json.encode(
        {
          "id": null,
          "currentDateTime": "",
          "utcOffset": "11:11:11",
          "isDayLightSavingsTime": true,
          "dayOfTheWeek": "tuesday",
          "timeZoneName": "UTC-8",
          "currentFileTime": null.toString(),
          "ordinalDate": "11/10/2021",
          "serviceResponse": null
        }
        );

    http.Response response = await http.post(
        _urlBase,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: corpo
    );

    print("resposta: ${response.body}");

    if(response.statusCode == 405) {
      print("Resposta: ${response.statusCode} Método não permitido.");
      print(
          "Foi feita uma solicitação de um recurso usando um método de pedido que não é compatível com esse recurso, por exemplo, "
              "usando GET em um formulário, que exige que os dados a serem apresentados via POST, PUT ou usar em um recurso somente de leitura.");
    }else
      print("resposta: ${response.statusCode}");


    //Fiz essa trativa com codigo estado ja sabendo o erro e o motivo do problema, api somente aceita get.

  }

  _put() async{

    var corpo = json.encode(

        {
          "id": null,
          "currentDateTime": "",
          "utcOffset": "11:11:11",
          "isDayLightSavingsTime": true,
          "dayOfTheWeek": "tuesday",
          "timeZoneName": "UTC-8",
          "currentFileTime": null.toString(),
          "ordinalDate": "12/11/2022",
          "serviceResponse": null
        }
    );

    http.Response response = await http.put(
        _urlBase,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: corpo
    );


    print("resposta: ${response.body}");

    if(response.statusCode == 405) {
      print("Resposta: ${response.statusCode} Método não permitido.");
      print(
          "Foi feita uma solicitação de um recurso usando um método de pedido que não é compatível com esse recurso, por exemplo, "
              "usando GET em um formulário, que exige que os dados a serem apresentados via POST, PUT ou usar em um recurso somente de leitura.");
    }else
      print("resposta: ${response.statusCode}");


    //Fiz essa trativa com codigo estado ja sabendo o erro e o motivo do problema, api somente aceita get.

  }


  _patch() async{

    var corpo = json.encode(

        {

          "currentDateTime": _now
        }

    );

    http.Response response = await http.patch(
        _urlBase,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: corpo
    );


    setState(() {
      _now;
      print(_now);
    });

    print("resposta: ${response.body}");

    if(response.statusCode == 405) {
      print("Resposta: ${response.statusCode} Método não permitido.");
      print(
          "Foi feita uma solicitação de um recurso usando um método de pedido que não é compatível com esse recurso, por exemplo, "
              "usando GET em um formulário, que exige que os dados a serem apresentados via POST, PUT ou usar em um recurso somente de leitura.");
    }else
      print("resposta: ${response.statusCode}");


    //Fiz essa trativa com codigo estado ja sabendo o erro e o motivo do problema, api somente aceita get.

  }


  _delete() async{

    http.Response response = await http.delete(
        _urlBase
    );

    print("resposta: ${response.body}");

    if(response.statusCode == 405) {
      print("Resposta: ${response.statusCode} Método não permitido.");
      print(
          "Foi feita uma solicitação de um recurso usando um método de pedido que não é compatível com esse recurso, por exemplo, "
              "usando GET em um formulário, que exige que os dados a serem apresentados via POST, PUT ou usar em um recurso somente de leitura.");
    }else
      print("resposta: ${response.statusCode}");


    //Fiz essa trativa com codigo estado ja sabendo o erro e o motivo do problema, api somente aceita get.

  }


  @override
  Widget build(BuildContext context) {
    _recuperarAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text("API-Kaffa",
        style: TextStyle(
            color: Colors.black87,
          fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Colors.orange.shade600,
      ) ,
      body: Container(
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_id,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_currentDateTime,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_utcOffset,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_dayOfTheWeek,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),
      Padding(padding: EdgeInsets.only(bottom: 20),
      child: Text(_timeZoneName,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20
      ),
      ),
    ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_currentFileTime,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text(_ordinalDate,
                style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20
              ),
            ),
          ),
            Padding(padding: EdgeInsets.only(bottom: 30),
              child: Text(_serviceResponse,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Salvar"),
                        onPressed: _post
                    ),
                    RaisedButton(
                        child: Text("Atualizar"),
                        onPressed: _patch
                    ),
                    RaisedButton(
                        child: Text("Remover"),
                        onPressed: _delete
                    ),

                  ],
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 10),
              child: Text( "currentDateTime: " + _now,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    decoration: TextDecoration.underline
                  ),
              ),
              )
            ],
            )

        ]
      ),
      ),
    );
  }
}