import 'package:flutter/material.dart';
//usar widget catalog/materialcomponents/divider e floatingactionbutton
void main(){
  runApp (MaterialApp(home:TelaExperiencia()));
}
  
class TelaExperiencia extends StatefulWidget{
  @override
  State<TelaExperiencia> createState()=> _TelaExperienciaState(); 
   
}

class _TelaExperienciaState extends State<TelaExperiencia> {
  List<Experiencia> listaExp = []; //mais pra frente n eaquece de criar o class experiencia

  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Experiências"),
    ),
    body: ListView.builder(
      itemCount: listaExp.length,
      itemBuilder: (context, index){
        return Column(
          children: [
            Card(
              child: ListTile(
                title: Text(listaExp[index].empresa),
                subtitle: Text(
                  "${listaExp[index].inicio} - ${listaExp[index].fim}",

                  
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    setState(() {
                      listaExp.removeAt(index);
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
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
  }
}
class Experiencia {
  String empresa;
  String inicio;
  String fim;

  Experiencia(this.empresa, this.inicio, this.fim);
}


