
import 'package:database/ui/home.dart';
import 'package:database/utils/sqldb.dart';
import 'package:flutter/material.dart';

class EditEmploy extends StatefulWidget {
  late final  name;
  late final age;
  late final department;
  late final city;
  late final id;
  EditEmploy({this.name , this.age, this.department ,this.city ,this.id});

  @override
  _EditEmployState createState() => _EditEmployState();
}
class _EditEmployState extends State<EditEmploy> {
  SqlDb sqlDb =SqlDb();

  GlobalKey<FormState> formstat = GlobalKey();


  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController city = TextEditingController();


  @override
  void initState() {
    name.text = widget.name;
    age.text = widget.age;
    department.text = widget.department;
    city.text = widget.city;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Edit Employe'),
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
                    MaterialButton(
                      color: Colors.white,
                      textColor: Colors.teal,
                      onPressed: () async {
                        int response =    await sqlDb.updateDate('''
                        UPDATE employes SET
                        name = "${name.text}",
                        age ="${age.text}",
                        department ="${department.text}",
                        city ="${city.text}"
                        WHERE id =${widget.id}
                     ''' );
                        if(response >0){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                                  (route) => false);
                        }
                        print("response==================================================");
                        print(response);

                      },
                      child: Text("Edit Employe"),
                    ),
                  ],

                ))
          ],
        ),
      ),
    );
  }
}
