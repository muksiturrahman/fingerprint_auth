import 'package:fingerprint_auth/local_auth/faceID.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'local_auth/fingerprint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // backgroundColor: Colors.green,
        title: Text("Face ID & FingerPrint"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>FingerPrint()));
              },
              child: Text("Fingerprint Test"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>FaceId()));
              },
              child: Text("FaceID Test"),
            ),
          ],
        ),
      ),
    );
  }
}
