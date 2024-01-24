import 'package:flutter/material.dart';
import 'package:pdflist/app/core/from.file.dart';
import 'package:pdflist/app/core/pdf-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();
    
    fromAsset('assets/rezume.pdf', 'rezume.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter PDF View',
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(title: const Text('Pdf ')),
        body: Center(child: Column(
              children: <Widget>[
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return TextButton(
                      child: Text("Open PDF"),
                      onPressed: () {
                        if (pathPDF.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFScreen(path: pathPDF),
                            ),
                          );
                        }
                      },
                    );
                      },),
                  ),
                )
                

              ],
            )
          ),
      ),
    );
  }
}

