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

  List list = ["rezume.pdf", "rezume.pdf"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PDF View',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pdf ')),
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    String path = list[index];
                    return TextButton(
                      child: Text(list[index]),
                      onPressed: () {
                       
                        fromAsset("assets/$path", path).then((f) {
                          
                            if (f.path.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PDFScreen(path: f.path),
                                ),
                              );
                            }
                          
                        });
                      },
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
