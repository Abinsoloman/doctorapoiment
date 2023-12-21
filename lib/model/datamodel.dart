
import 'package:hive_flutter/adapters.dart';
part 'datamodel.g.dart';

@ HiveType(typeId: 5)
class details{
  @ HiveField(0)
  String Name;
  @ HiveField(1)
  String Email;
  @ HiveField(2)
  String Mobilenumber;
  @ HiveField(3)
  String gender;
  @ HiveField(4)
  String Date;
  @ HiveField(5)
  String Time;
  details ({required this.Name,
  required this.Email,
  required this.Mobilenumber,
  required this.gender,
  required this.Date,
  required this.Time});
}