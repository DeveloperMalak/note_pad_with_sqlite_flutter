import 'package:note_pad/Databse/db_helper.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:flutter/material.dart';
class UpdateEntryScreen extends StatefulWidget {
  int id;
  String name;
  int number;
  UpdateEntryScreen({required this.id,required this.name,required this.number});

  @override
  State<UpdateEntryScreen> createState() => _UpdateEntryScreenState();
}

class _UpdateEntryScreenState extends State<UpdateEntryScreen> {
  DbHelper dbHelper=DbHelper()
;  TextEditingController name_controller1=TextEditingController();
  TextEditingController number_controller1=TextEditingController();

  @override
  Widget build(BuildContext context) {
   
     setState(() {
       name_controller1.text=widget.name;
     number_controller1.text=widget.number.toString();
     });
     
   
  
       
    
   
    return Scaffold(appBar: AppBar(title: Text('Update Note'),),
    body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
           height: 65,width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.yellow.shade100,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:name_controller1,
              decoration: InputDecoration(hintText: 'enter name'),
                     ),
            ),
          ),
        ),
        SizedBox(height:34),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 65,width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.yellow.shade100,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: number_controller1,
              decoration: InputDecoration(hintText: 'enter phone number'),
                     ),
            ),
          ),
        ),
       SizedBox(height: 34,),
        ElevatedButton(
          onPressed: ()async{
           Navigator.pop(context);
          await dbHelper.updateData(
            UserModel(
              id:widget.id,
            username:name_controller1.text.toString(),
            usernumber: int.parse(number_controller1.text.toString())
           ),);},
            child: Container(
          height: 50,width: 120,
          child: Center(child: Text('Update Note',)))
           )
      

          
      ],));
  }
}