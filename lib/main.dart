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

class Experiencia{
  String empresa;
  String ano;
  String cargo;

  Experiencia(this.empresa, this.ano, this.cargo);
}

class TelaExperiencia extends StatefulWidget{
  @override
  State<TelaExperiencia> createState() => _TelaExperienciaState(); 
}
class _TelaExperienciaState extends State<TelaExperiencia>{
  List<Experiencia> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Experiência")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder:(context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.work),
                  title: Text(lista[index].empresa),
                  subtitle: Text("${lista[index].cargo} (${lista[index].ano})"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        lista.remove(index);
                      });
                    },
                    ),
                ),
              ),
              Divider(),
            ],

          );
        },
      ),

    );
    
  }
}
class FormExperiencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController empresa = TextEditingController();
    TextEditingController ano = TextEditingController();
    TextEditingController cargo = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Nova Experiência")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: empresa, decoration: InputDecoration(labelText: "Empresa")),
            TextField(controller: empresa, decoration: InputDecoration(labelText: "Cargo")),
            TextField(controller: empresa, decoration: InputDecoration(labelText: "Ano")),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (empresa.text != '' &&
                    cargo.text != '' &&
                    ano.text != '' ) {
                  Navigator.pop(
                    context,
                    Experiencia(
                      empresa.text, ano.text, cargo.text));

                    }
                
              },
              child: Text("Salvar"),
              )
          ],
        ), 
        ),
    );
  }
}

class Projeto{
  String nome;
  String descricao;
  Projeto(this.nome, this.descricao);

}