import 'package:flutter/material.dart';
import 'package:flutter_application_api_1309/dados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyBusc extends StatefulWidget {
  const MyBusc({super.key});

  @override
  State<MyBusc> createState() => _MyBuscState();
}
TextEditingController cep = TextEditingController();

class _MyBuscState extends State<MyBusc> {
  String dadosApi = "test";
  Dados meusDados = Dados();

  Future<void> fazerRequi(String cep) async{
    var url =Uri.parse("https://viacep.com.br/ws/${cep}/json/");
    http.Response respose;
    respose = await http.get(url);
    dadosApi =respose.body;
    if(respose.statusCode==200){
      Map<String,dynamic> dadosFormatados = jsonDecode(respose.body);
      meusDados = Dados.fromjson(dadosFormatados);
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,  title: Text("Buscar endereço",style: TextStyle(color: Colors.white),) , backgroundColor: const Color.fromARGB(255, 138, 216, 213),),
      body: Center(child: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            controller: cep,
            style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                  labelText: "CEP",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),),
          ),
          ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              fazerRequi(cep.text);
              setState(() {
                
              });
            }, child: Text("Pesquisar Cep")),
            Text("CEP:"+meusDados.cep.toString()),
          Text("Estado:"+ meusDados.estado.toString()),
          Text("Regiâo:"+meusDados.regiao.toString()),
          Text("Logradouro:"+meusDados.logadouro.toString()),
          Text("Bairro:"+meusDados.bairro.toString())
        ],
      ),
      ),
    );
  }
}