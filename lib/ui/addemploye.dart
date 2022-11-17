
import 'package:database/ui/home.dart';
import 'package:database/utils/sqldb.dart';
import 'package:flutter/material.dart';

class AddEmploye extends StatefulWidget {
  @override
   _AddEmployeState createState() =>  _AddEmployeState();
}
class _AddEmployeState extends State<AddEmploye> {


  SqlDb sqlDb =SqlDb();
  GlobalKey<FormState> formstat = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController city = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employe"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding:  EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
                key: formstat,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "name"
                      ),
                    ),
                    TextFormField(
                      controller:age,
                      decoration: InputDecoration(
                          hintText: "age"
                      ),
                    ),
                    TextFormField(
                      controller: department,
                      decoration: InputDecoration(
                          hintText: "department"
                      ),
                    ),
                    TextFormField(
                      controller: city,
                      decoration: InputDecoration(
                          hintText: "city"
                      ),
                    ),
                    Container(height: 20,),
                   // Divider(color: Colors.teal , height: 100, thickness: 2.0,),
                    MaterialButton(
                      color: Colors.white,
                      textColor: Colors.teal,
                      onPressed: () async {
                        int response =    await sqlDb.insertDate('''
                    INSERT INTO employes (name , age , department ,city )
                    VALUES  ("${name.text}" , "${age.text}" ,"${department.text}" ,"${city.text}")
                    ''' );
                        if(response >0){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                                  (route) => false);
                        }
                        print("response==================================================");
                        print(response);

                      },
                      child: Text("Add Employe"),
                    ),
                  ],

                ))
          ],
        ),
      ),

    );
  }
}