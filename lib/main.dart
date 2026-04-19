import 'package:flutter/material.dart';
void  main(){
  runApp(MaterialApp(
    home: TelaInicial(),
  ));

}

class TelaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sophia Mileski Bortoleti dos Santos"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            child: Icon(Icons.person, size: 60),
          
          ),
          SizedBox(height: 30),

          ElevatedButton(
            onPressed:(){
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => TelaExperiencia()));
            },
            child: Text("Experiência"),
            ),

           ElevatedButton(
            onPressed:(){
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => TelaProjetos()));
            },
            child: Text("Projetos"),
            ),

            ElevatedButton(
            onPressed:(){
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => TelaEscolaridade()));
            },
            child: Text("Escolaridade"),
            ),
        ],

      ),
    );
    
  }
}

class Experiência{
  String empresa;
  String ano;
  String cargo;

  Experiencia(this.empresa, this.ano, this.cargo);
}