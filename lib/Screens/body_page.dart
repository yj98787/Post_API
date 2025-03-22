import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget {

  final int id;
  final String body;
  final String title;
  const BodyPage({super.key, required this.id,required this.body,required this.title});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "POST  # ${widget.id.toString()}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                    children: [
                      SizedBox(height: 40.0,),
                      Text("TITLE",
                      style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      Card(
                        child: Padding(padding: EdgeInsets.all(20.0),
                        child: Text(widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text("BODY",
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: Padding(padding: EdgeInsets.all(15.0),
                        child: Text(widget.body,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        ),
                        ),
                      ),
                    ],
                  ),
          ),
      ),
    );
  }
}
