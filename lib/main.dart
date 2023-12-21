import 'package:doctorsapoiment/booked.dart';
import 'package:doctorsapoiment/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

void main(List<String> args)async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(detailsAdapter());
  await Hive.openBox("data_box");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final Box databox;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilenumbercontroller = TextEditingController();
  

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box("data_box");
  }
  creatdata(){
    details newdata = details(
      Name: namecontroller.text, 
      Email: emailcontroller.text, 
      Mobilenumber: mobilenumbercontroller.text, 
      gender: gender, 
      Date: datecontroller.text, 
      Time: timecontroller.text);
      databox.add(newdata);
  }
  
  var gender = "";
  
  
  var date = "";
  var time = TimeOfDay.now();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
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
                            keyboardType: TextInputType.text,
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
                        keyboardType: TextInputType.number,
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
                                  keyboardType: TextInputType.number,
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
                                  keyboardType: TextInputType.number,
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
                                    if (selecttime != null && selecttime != time){
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
                              creatdata();
                              if(namecontroller.text.isNotEmpty&&emailcontroller.text.isNotEmpty&&
                              mobilenumbercontroller.text.isNotEmpty&&gender.isNotEmpty&&datecontroller.text.isNotEmpty&&
                              timecontroller.text.isNotEmpty)
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Booked(
                                )));
                            }, child: Text("Book"),
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
          //Booked()
        ],
      ),
      
    );
  }
}
