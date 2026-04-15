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
  List<Experiencia> listaExp = [];

  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Experiências"),
    ),
  )

 }
  }



