
import 'package:database/ui/addemploye.dart';
import 'package:database/ui/home.dart';
import 'package:flutter/material.dart';

void main ()  {
  runApp( new MaterialApp(
    home:Home(),
    routes: {
      "addemploye" :(context) => AddEmploye()},
  ));
}
