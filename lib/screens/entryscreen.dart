import 'package:note_pad/Databse/db_helper.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:flutter/material.dart';
import 'package:note_pad/Databse/db_helper.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
 
   TextEditingController usernamecontroller=TextEditingController();
   TextEditingController usernumbercontroller=TextEditingController();
   void insert()async{
    await dbHelper.insertData(UserModel(  username: usernamecontroller.text.toString(), usernumber: int.parse(usernumbercontroller.text.toString())));
       Navigator.pop(context);
   }
  DbHelper dbHelper=DbHelper()
;  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note'),),
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
              child: TextField(controller: usernamecontroller,
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
              child: TextField(controller: usernumbercontroller,
              decoration: InputDecoration(hintText: 'enter phone number'),
                     ),
            ),
          ),
        ),
       SizedBox(height: 34,),
        ElevatedButton(onPressed: ()async{
          setState((){});
           insert();
          
        },
        child: Container(
          height: 50,width: 120,
          child: Center(child: Text('Add Note',)))),

          
      ],)
    );
  }
}