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
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc69QEfO57WGxQQgK2hv91wqQkMcXvefVOyg&s"
                  ),
                ),
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaFormulario()
          ),).then((exp){
            if (exp !=null){
              setState(() {
                listaExp.add(exp);
              });
            }
          }
          );
      },
      child: Icon(Icons.add),
    ),
  );
  }
}
class TelaFormulario extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController empresa = TextEditingController();
    TextEditingController inicio = TextEditingController();
    TextEditingController fim= TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Nova Experiência")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Empresa'),
          TextField(controller:empresa),

          SizedBox(height: 10),

          Text('Ano início'),
          TextField(controller:inicio),

          SizedBox(height: 10),

           Text('Ano fim'),
          TextField(controller:fim),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: (){
              if (empresa.text != '' &&
                  inicio.text != '' &&
                  fim.text != ' &&'){
                Experiencia exp = Experiencia(
                  empresa.text,
                  inicio.text,
                  fim.text,
                );

                Navigator.pop(context, exp);
              } else{
                debugPrint("Preencha todos os campos, por favor");
              }
            },
            child: Text("Salvar"),
          ),
        ],
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


