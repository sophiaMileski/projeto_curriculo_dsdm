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

class TelaExperiencia extends StatefulWidget {
  @override
  State<TelaExperiencia> createState() => _TelaExperienciaState();
}

class _TelaExperienciaState extends State<TelaExperiencia> {
  List<Experiencia> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiência"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FormExperiencia()),
              ).then((exp) {
                if (exp != null) {
                  setState(() {
                    lista.add(exp);
                  });
                }
              });
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.work),
                  title: Text(lista[index].empresa),
                  subtitle:
                      Text("${lista[index].cargo} (${lista[index].ano})"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        lista.removeAt(index);
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
            MaterialPageRoute(builder: (_) => FormExperiencia()),
          ).then((exp) {
            if (exp != null) {
              setState(() {
                lista.add(exp);
              });
            }
          });
        },
        child: Icon(Icons.add),
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

class TelaProjetos extends StatefulWidget {
  @override
  State<TelaProjetos> createState() => _TelaProjetosState();
}

class _TelaProjetosState extends State<TelaProjetos> {
  List<Projeto> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FormProjeto()),
              ).then((proj) {
                if (proj != null) {
                  setState(() {
                    lista.add(proj);
                  });
                }
              });
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.code),
                  title: Text(lista[index].nome),
                  subtitle: Text(lista[index].descricao),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        lista.removeAt(index);
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
            MaterialPageRoute(builder: (_) => FormProjeto()),
          ).then((proj) {
            if (proj != null) {
              setState(() {
                lista.add(proj);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FormProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController descricao = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Novo Projeto")),
      body: Column(
        children: [
          TextField(
            controller: nome,
            decoration: InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: descricao,
            decoration: InputDecoration(labelText: "Descrição"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, Projeto(nome.text, descricao.text));
            },
            child: Text("Salvar"),
          )
        ],
      ),
    );
  }
}
class Escolaridade {
  String curso;
  String escola;

  Escolaridade(this.curso, this.escola);
}

class TelaEscolaridade extends StatefulWidget {
  @override
  State<TelaEscolaridade> createState() => _TelaEscolaridadeState();
}

class _TelaEscolaridadeState extends State<TelaEscolaridade> {
  List<Escolaridade> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolaridade"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FormEscolaridade()),
              ).then((esc) {
                if (esc != null) {
                  setState(() {
                    lista.add(esc);
                  });
                }
              });
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text(lista[index].curso),
                  subtitle: Text(lista[index].escola),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        lista.removeAt(index);
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
            MaterialPageRoute(builder: (_) => FormEscolaridade()),
          ).then((esc) {
            if (esc != null) {
              setState(() {
                lista.add(esc);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}