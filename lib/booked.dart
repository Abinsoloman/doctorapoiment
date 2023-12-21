// import 'package:doctorsapoiment/main.dart';
// import 'package:doctorsapoiment/model/datamodel.dart';
import 'package:doctorsapoiment/update.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Booked extends StatefulWidget {
   Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {

   late final Box databox;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box("data_box");
  }
  deletedata(int index){
    databox.deleteAt(index);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: 
      ListView(
        children: [
          Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
          
          

          Align(alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 90),
              child: 
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ValueListenableBuilder(
                  valueListenable: databox.listenable(), 
                  builder: (context,value,child){
                    if (value.isEmpty){
                      return Center(child: Text("Book Your appointment",
                      style: TextStyle(
                        fontSize: 18
                      ),));
                    }else{
                      return ListView.builder(
                        itemCount: databox.length,
                        itemBuilder: (context,index){
                          var box = value;
                          var getdata = box.getAt(index);
                          return Center(
                            child: Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Name:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                  Text(getdata.Name,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Email:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                 Text(getdata.Email,
                                 style: TextStyle(
                                  fontSize: 20
                                 ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Mobile Number:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                 Text(getdata.Mobilenumber,
                                 style: TextStyle(
                                  fontSize: 20
                                 ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Gender:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                Text(getdata.gender,
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Date:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                Text(getdata.Date,
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Time:",
                                      style: TextStyle(
                                        fontSize: 20
                                      ),),
                                 Text(getdata.Time,
                                 style: TextStyle(
                                  fontSize: 20
                                 ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                       
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(
                                        index: index,
                                        data: getdata,
                                        namecontroller: getdata.Name,
                                        emailcontroller: getdata.Email,
                                        mobilenumbercontroller: getdata.Mobilenumber,
                                         gender: getdata.gender,
                                         datecontroller: getdata.Date,
                                         timecontroller: getdata.Time,
                                       )));
                                  }, icon: Icon(Icons.edit)),

                                 IconButton(onPressed: (){
                                  deletedata(index);
                                 }, icon: Icon(Icons.delete))
                                    ],
                                  ),
                                 
                                ],
                              ),
                            ),
                          );
                        });
                      
                    }
                  }
                    
                
                  ),


                
              ),
            ),
          )
        ],
      ),
    );
  }
}