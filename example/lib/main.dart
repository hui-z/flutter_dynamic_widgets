import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/widget.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';
import 'package:example/widget_json.dart';
import 'dart:convert';

void main() {
  DynamicWidgetBuilder.registerSysWidgets();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Dynamic Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          // SliverPadding(
          //     padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          //     sliver: SliverList(
          //       delegate: SliverChildListDelegate([
          //         ElevatedButton(
          //           child: Text("Dynamic Widget Json String Export Example"),
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => JSONExporter()));
          //           },
          //         )
          //       ]),
          //     )),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildListDelegate([
                ElevatedButton(
                  child: Text("Container"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(containerMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Row"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(rowMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Column"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(columnMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Text"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(textMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(iconMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("AssetImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(assetImageMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("NetworkImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(networkImageMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listViewMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(indexedStackMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("SizedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(sizedBoxMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("TableData"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                tableData, context))));
                  },
                ),
                ElevatedButton(
                  child: Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                wrap, context))));
                  },
                ),
                ElevatedButton(
                  child: Text("LoginInputItem"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(loginMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("InkWell"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(inkWellMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("CheckList"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                    checkList2, context))));
                  },
                ),
                ElevatedButton(
                  child: Text("ExpansionTile"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                    textField, context))));
                  },
                ),
                ElevatedButton(
                  child: Text("RichText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(richTextMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Test"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(testMap)));
                  },
                ),
                ElevatedButton(
                  child: Text("Test2"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                    expand, context))
                        ));
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}

class CodeEditorPage extends StatefulWidget {
  final Map? json;

  CodeEditorPage(this.json);

  @override
  State<StatefulWidget> createState() {
    return _CodeEditorPageState(json);
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  Map? jsonMap;

  _CodeEditorPageState(this.jsonMap);

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          title: Text("Code Editor"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints.expand(
                    width: double.infinity, height: double.infinity),
                child: TextField(
                  controller: TextEditingController(text: json.encode(jsonMap)),
                  decoration: InputDecoration(hintText: 'Enter json string'),
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text("Preview"),
              onPressed: () {
                setState(() {

                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewPage(jsonMap)));
              },
            )
          ],
        ));
    return widget;
  }
}

class PreviewPage extends StatelessWidget {
  final Map? json;

  PreviewPage(this.json);

  //late DynamicWidgetJsonExporter _exporter;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: ListView(
        children: [
          DynamicWidgetBuilder.buildWidget(
              DynamicWidgetConfig.fromJson(json!),
              context: context, event: (event) {
            print(event);
          })??SizedBox()
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //
      //       child: FutureBuilder<Widget?>(
      //         // future: _buildWidget(context),
      //         builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
      //           if (snapshot.hasError) {
      //             print(snapshot.error);
      //           }
      //           return snapshot.hasData
      //               ? _exportor = DynamicWidgetJsonExportor(
      //
      //             child: snapshot.data,
      //
      //           )
      //               : Text("Loading...");
      //         },
      //       ),
      //     ),
      //     ElevatedButton(onPressed: (){
      //       var exportJsonString = _exportor.exportJsonString();
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) =>
      //                   CodeEditorPage(exportJsonString)));
      //     }, child: Text("export json code"),)
      //   ],
      // ),
    );
  }

  // Future<Widget?> _buildWidget(BuildContext context) async {
  //   return DynamicWidgetBuilder.build(
  //       jsonString, context, new DefaultClickListener());
  // }
}

// class DefaultClickListener implements ClickListener {
//   @override
//   void onClicked(String? event) {
//     print("Receive click event: " + (event == null ? "" : event));
//   }
// }

// class JSONExporter extends StatefulWidget {
//   @override
//   _JSONExporterState createState() => _JSONExporterState();
// }
//
// class _JSONExporterState extends State<JSONExporter> {
//   GlobalKey key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text("export example"),
//       ),
//       body: Builder(
//         builder: (context) => Container(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 child: DynamicWidgetJsonExporter(
//                   key: key,
//                   child: Stack(
//                     alignment: Alignment.topLeft,
//                     children: [
//                       Image.asset("assets/vip.png"),
//                       Positioned(
//                         child: Image.asset("assets/vip.png"),
//                         top: 50,
//                         left: 50,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 child: ElevatedButton(
//                   child: Text("Export"),
//                   onPressed: () {
//                     var exporter =
//                         key.currentWidget as DynamicWidgetJsonExporter;
//                     var exportJson = json.decode(exporter.exportJsonString());
//
//                     Scaffold.of(context).showSnackBar(
//                         SnackBar(content: Text("json string was exported to editor page.")));
//
//                     Future.delayed(Duration(seconds: 1), () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   CodeEditorPage(exportJson)));
//                     });
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DynamicWidgetJsonExporter extends StatelessWidget {
//   final Widget? child;
//
//   final GlobalKey globalKey = GlobalKey();
//
//   DynamicWidgetJsonExporter({
//     this.child,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: globalKey,
//       child: child,
//     );
//   }
//
//   String exportJsonString() {
//     String rt = "failed to export";
//     globalKey.currentContext!.visitChildElements((element) {
//       rt = ''; //jsonEncode(DynamicWidgetBuilder.export(element.widget, null));
//     });
//     return rt;
//   }
// }
