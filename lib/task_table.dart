
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:core';
import 'package:http/http.dart' as http;

class MyTaskView extends StatefulWidget {
  MyTaskView({Key? key, required this.endPoint,required this.title}) : super(key: key);
  final title;
  final endPoint;
  @override
  MyTaskViewState createState() => MyTaskViewState();
}
class MyTaskViewState extends State<MyTaskView> {
  List data =[];
  var _key=GlobalKey();

  Future<String> getData() async {
    const apiUrl = 'https://sun-kingfieldapp.herokuapp.com/api/tasks';
    final response = await http.get(Uri.parse(apiUrl,),headers:{
      "Content-Type": "application/json",});

    this.setState(() {
      data = json.decode(response.body);
    });


    return "Success!";
  }
  @override
  void initState(){
    this.getData();
  }



  @override
  Widget build(BuildContext context) {
    var _key=GlobalKey();
    Color taskcolor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      ),
      body:Column(
        children: [
          Container(
            height: 200,

            padding:EdgeInsets.only(left: 15,right: 25,bottom: 5,top: 5),
            margin: EdgeInsets.only(left: 20,right: 25,bottom: 0,top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                      blurRadius: 5) //blur radius of shadow
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Task Summary",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 15.0,
                  percent: 0.4,
                  progressColor: Colors.red,
                  center: Text("40.0%"),
                ),

                SizedBox(height: 10,),
                SizedBox(
                  height: 5,
                ),
                Text("Task Status",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("6 Complete",style: TextStyle(color: Colors.green),),
                    Text("3 Pending",style: TextStyle(color: Colors.orange)),
                    Text("5 Over Due",style: TextStyle(color: Colors.red)),



                  ],
                ),
                SizedBox(height: 10,),
                Text("Priority",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                SizedBox(height:10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("6 High",style: TextStyle(color: Colors.green)),
                    Text("3 Normal",style: TextStyle(color: Colors.orange)),
                    Text("5 Low",style: TextStyle(color: Colors.red)),


                  ],
                ),

              ],
            ),
          ),
          Container(
              padding:EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_alt_rounded),
                  Icon(Icons.search),
                ],
              )
          ),
          Expanded(
            
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:20,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    },
                  child:Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade800,
                        radius:35,
                        child: Text("TS"),),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Container(
                          width: 350,
                          height: 90,
                          child: Card(
                            elevation: 5,

                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20.0,10,0,0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Task Group"),
                                  Text("Task :"),
                                  Text("Priority:"),
                                  Text("Over due:"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      /*SingleChildScrollView(

        child: Column(
          children: [

            ListView.builder(

              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TaskDetail(task_title: data[index]['task_title'].toString(),
                  priority: data[index]['priority'].toString(),
                  ahq_name: data[index]['task_area'].toString(),
                  date: data[index]['task_start_date'].toString(),
                  task: data[index]['id'].toString(),
                  status: data[index]['task_status'].toString(),
                  sub_task: data[index]['sub_task'].toString(),
                  description: data[index]['task_description'].toString(),
                  task_with: data[index]['task_with'].toString(),
                  region: data[index]['task_region'].toString(),
                  color: Colors.red,


                );
              })*/
    );
  }


}

class TaskDetail extends StatelessWidget {
  final String task_title;
  final String region;
  final String sub_task;
  final String priority;
  final String ahq_name;
  final String description;
  final String date;
  final String task;
  final String status;
  final String task_with;
  final Color color;
  const TaskDetail({Key? key,
    required this.task_title,
    required this.region,
    required this.task_with,
    required this.sub_task,
    required this.description,
    required this.priority,
    required this.ahq_name,
    required this.date,
    required this.task,
    required this.status,
    required this.color,


  });
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
      ),
      elevation: 3,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            //task label
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task Name:", style:TextStyle(fontWeight: FontWeight.bold,fontSize:12),),
                  Text("Sub Task:", style:TextStyle(fontWeight: FontWeight.bold,fontSize:12),),
                  Text("Task description:", style:TextStyle(fontWeight: FontWeight.bold,fontSize:12),),
                  Text("Task task with:", style:TextStyle(fontWeight: FontWeight.bold,fontSize:12),),
                  Text("Task Priority:", style:TextStyle(fontWeight: FontWeight.bold,fontSize:12),)
                ],
              ),
              
            ),
            SizedBox(width: 10,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(task_title, style:TextStyle(fontSize:13),),
                  Text(sub_task,style:TextStyle(fontSize:13)),
                  Text(description,style:TextStyle(fontSize:13)),
                  Text(task_with,style:TextStyle(fontSize:13)),
                  Text(priority,style:TextStyle(fontSize:13)),

                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
/*Column(

children: [
Center(child: Text(task_title,
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
Row(

children: [

style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 15),
Text(sub_task, style: TextStyle(fontSize: 15,)),
],
),
Row(

children: [
Text("Task Description:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 15),
Flexible
(child: new Text(description,
style: TextStyle(
color: Colors.black,
fontSize: 15.0,),
overflow: TextOverflow.clip,),)
],
),
Row(

children: [
Text("Task With:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 15),
Text(task_with, style: TextStyle(fontSize: 15,)),
],
),
Row(

children: [
Text("Region:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 15),
Text(region, style: TextStyle(fontSize: 15,)),
],
),
Row(

children: [
Text("Area:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 15),
Text(ahq_name, style: TextStyle(fontSize: 15,)),
],
),
Row(

children: [
Text("Priority:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 5),
Text(priority, style: TextStyle(fontSize: 15,)),
SizedBox(width: 20),
Text("Status:",
style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
SizedBox(width: 5),
Text(status, style: TextStyle(fontSize: 15,)),
],
),


Row(

children: [
Text("Date start:",
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
SizedBox(width: 5),
Text(date, style: TextStyle(fontSize: 15,)),
SizedBox(width: 20),
Text("Date end:",
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
SizedBox(width: 5),
Text(date, style: TextStyle(fontSize: 15,)),
],
),
ElevatedButton(
style: ElevatedButton.styleFrom(
minimumSize: Size.fromHeight(
40), // fromHeight use double.infinity as width and 40 is the height
),
onPressed: () {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text(sub_task.toString()),
content: Text(sub_task.toString()+" Saved successfully"),
);
}
);
},
child: Text("Update Task")),
SizedBox(height: 5),

],
)*/

