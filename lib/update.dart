import 'package:doctorsapoiment/booked.dart';
import 'package:doctorsapoiment/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Update extends StatefulWidget {
final int index;
final details? data;
final namecontroller;
final emailcontroller;
final mobilenumbercontroller;
final  gender;
final  datecontroller;
final timecontroller;
  const Update({super.key,
               required this.index,
           this.data,
           this.namecontroller,
           this.emailcontroller,
           this.mobilenumbercontroller,
           this.gender,
           this.datecontroller,
           this.timecontroller});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

     late final Box databox;
   late final TextEditingController namecontroller;
   late final TextEditingController emailcontroller;
  late final TextEditingController mobilenumbercontroller;
  late final TextEditingController datecontroller;
   late final TextEditingController timecontroller;
  var gender ="";
   updatedata(){
     details newdata = details(
      Name: namecontroller.text, 
       Email: emailcontroller.text, 
       Mobilenumber: mobilenumbercontroller.text, 
       gender: gender, 
      Date: datecontroller.text, 
      Time: timecontroller.text);
      databox.putAt(widget.index, newdata);
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box("data_box");
     namecontroller = TextEditingController(text: widget.namecontroller);
     emailcontroller = TextEditingController(text: widget.emailcontroller);
     mobilenumbercontroller = TextEditingController(text: widget.mobilenumbercontroller);
     gender = gender;
     datecontroller = TextEditingController(text: widget.datecontroller);
     timecontroller = TextEditingController(text: widget.timecontroller);
  }
 var date = "";
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios))),
          Align(alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 90),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Name",
                              
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextField(
                              controller: emailcontroller,
                            decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "Email"
                            ),
                        ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: mobilenumbercontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          labelText: "Mobile"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "Male", 
                            groupValue:gender , 
                            onChanged: (value){
                              setState(() {
                                gender = value.toString();
                              });
                            }),
                            Text("Male"),
                    
                        Radio(
                          value: "Female", 
                          groupValue: gender, 
                          onChanged: (value){
                            setState(() {
                              gender = value.toString();
                            });
                          }),Text("Female"),
                    
                          Radio(
                            value: "Others", 
                            groupValue: gender, 
                            onChanged: (value){
                              setState(() {
                                gender = value.toString();
                                
                              });
                            }),Text("Others"),
                        ],
                      ),
                    ),
                
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 165,
                                child: TextField(
                                  controller: datecontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: "Date",
                                    suffixIcon: IconButton(onPressed: ()async{
                                      final selectdate = await showDatePicker(
                                        context: context, 
                                        initialDate: DateTime.now(), 
                                        firstDate: DateTime.now().subtract(Duration(days: 2000)), 
                                        lastDate: DateTime(3000));
                                        setState(() {
                                          date = DateFormat.yMMMMEEEEd().format(selectdate!);
                                          datecontroller.text = date;
                                        });
                                    }, icon: Icon(Icons.date_range))
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 165,
                                child: TextField(  
                                  controller: timecontroller,                  
                                decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                labelText: "Time",
                                suffixIcon: IconButton(onPressed: ()async{
                                  final selecttime = await showTimePicker(
                                    context: context, 
                                    initialTime: TimeOfDay.now());
                                    if (selecttime != null && selecttime != timecontroller){
                                      setState(() {
                                        timecontroller.text = selecttime.toString();
                                      });
                                    }
                                }, icon: Icon(Icons.schedule))
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                                updatedata();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Booked(

                              )));
                            }, child: Text("Edit"),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              )
                            ),)),
                        )
                        
                        ],
                      ),
                      
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
