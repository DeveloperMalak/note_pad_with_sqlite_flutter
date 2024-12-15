

import 'package:note_pad/Databse/db_helper.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:note_pad/screens/entryscreen.dart';
import 'package:note_pad/screens/updateentry_screen.dart';
import 'package:flutter/material.dart';
import 'package:note_pad/Databse/db_helper.dart';
import 'package:note_pad/Model.dart/userEntry_model.dart';
import 'package:note_pad/screens/updateentry_screen.dart';
class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens> {
  @override
  Widget build(BuildContext context) {
   
    DbHelper dbHelper=DbHelper();
    return Scaffold(appBar: AppBar(
      title: Text('My Notes'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        FutureBuilder(future: dbHelper.fetchData(), 
        builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot){
          if(snapshot.hasData){
            print(snapshot.data);
        
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context,index){
                  final int namelength=snapshot.data![index].username.length;
                  int len=index+1;
                return InkWell(
                  onTap:(){

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                          
                              child: Text(len.toString()+'-'),
                            ),
                            Column(
                              children: [
                                Text('Name:',),
                                SizedBox(height: 11,),
                                Text('phone:',),
                                
                              ],),
                               Column(
                              children: [
                                Text(snapshot.data![index].username.toString(), 
                                 ),
                                SizedBox(height: 11,),
                                Text(snapshot.data![index].usernumber.toString(),)
                                
                              ],),
                             SizedBox(width:namelength>=10?60:namelength>=15?40:100 ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: ()async{
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      UpdateEntryScreen(
                                        id: int.parse(snapshot.data![index].id.toString()),
                                        name: snapshot.data![index].username.toString(),
                                        number: int.parse(snapshot.data![index].usernumber.toString())
                                        )
                                         )
                                       
                                        );
                                     
                                    },
                                    icon: Icon(Icons.edit_outlined)),
                                  SizedBox(width: 3,),
                                  IconButton(
                                    onPressed: ()async{
                                      setState(() {
                                          dbHelper.deleteData(int.parse(snapshot.data![index].id.toString()));
                                      });
                                    },
                                    icon: Icon(Icons.delete_outline))],)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }else{
            return Center(child: Text('loading'));
          }
        })
      ],),
    ),

 floatingActionButton: FloatingActionButton(backgroundColor: Colors.amberAccent,
  child: Icon(Icons.add,color: const Color.fromRGBO(184, 178, 161, 1),),
  onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EntryScreen()))),
    );
  }
}