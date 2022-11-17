

import 'package:database/ui/editemploy.dart';
import 'package:database/utils/sqldb.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  SqlDb sqlDb = SqlDb();
  List employee = [];


  Future readData()async{
    List<Map> response = await sqlDb.redDate("SELECT * FROM employes");
    employee.addAll(response);
      setState(() {

      });

  }
  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text("ALL Employe" , style: TextStyle(color: Colors.white, ),),
       backgroundColor: Colors.teal,
       centerTitle: true,
     ),
     floatingActionButton:  FloatingActionButton(
       onPressed: (){
         Navigator.of(context).pushNamed("addemploye");
       },
       backgroundColor: Colors.teal,
       child: Icon(Icons.add),
     ),
     body: Container(
       child: ListView(
         children: [
           ListView.builder(
               itemCount: employee.length,
               physics:NeverScrollableScrollPhysics() ,
               shrinkWrap: true,
               itemBuilder:(context,i){
                 return  Card(child:  ListTile(
                   title: Text("${employee[i]['name']}", style: TextStyle(fontSize: 22.0 ,),),
                   subtitle: Text("${employee[i]['age']} - ${employee[i]['department']}"),
                   leading: Column(
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.teal[100],
                         child: Text("${employee[i]['id']}",style: TextStyle(color: Colors.black87),),
                       )
                     ],
                   ),
                   trailing:Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       IconButton(onPressed: () async{
                         int respons = await sqlDb.daletDate(
                             "DELETE FROM employes WHERE id = ${employee[i]['id']}");
                         if(respons >0){
                           employee.removeWhere((element) => element['id'] == employee[i]['id']);
                           setState(() {

                           });
                         }},
                           icon: Icon(Icons.delete , color: Colors.red,
                           )),
                       IconButton(onPressed: () async{
                         Navigator.of(context).push(
                             MaterialPageRoute(builder: (context) => EditEmploy(
                               name: employee[i]['name'],
                               age: employee[i]['age'],
                               department: employee[i]['department'],
                               city: employee[i]['city'],
                               id: employee[i]['id'],
                             ))
                         );
                       },
                           icon: Icon(Icons.edit , color: Colors.teal,
                           )),
                     ],
                   ),

                 ));
               }),

         ],
       ),


     ),
   );
  }
}
