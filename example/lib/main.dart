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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  RaisedButton(
                    child: Text("Dynamic Widget Json String Export Example"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JSONExporter()));
                    },
                  )
                ]),
              )),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildListDelegate([
                RaisedButton(
                  child: Text("Test"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(testMap)));
                  },
                ),
                RaisedButton(
                  child: Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(iconMap)));
                  },
                ),
                RaisedButton(
                  child: Text("TableData"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                tableData, context))));
                  },
                ),
                RaisedButton(
                  child: Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(DynamicWidgetBuilder.transformMap(
                                wrap, context))));
                  },
                ),
                RaisedButton(
                  child: Text("AssetImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(assetImageMap)));
                  },
                ),
                RaisedButton(
                  child: Text("NetworkImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(networkImageMap)));
                  },
                ),
                RaisedButton(
                  child: Text("LoginInputItem"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(loginMap)));
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
                  maxLines: 1000000,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
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

// ignore: must_be_immutable
class PreviewPage extends StatelessWidget {
  final Map? json;

  PreviewPage(this.json);

  late DynamicWidgetJsonExportor _exportor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(json!),
          context: context, event: (event) {
            print(event);
      }),
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
      //     RaisedButton(onPressed: (){
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

class JSONExporter extends StatefulWidget {
  @override
  _JSONExporterState createState() => _JSONExporterState();
}

class _JSONExporterState extends State<JSONExporter> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("export example"),
      ),
      body: Builder(
        builder: (context) => Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: DynamicWidgetJsonExportor(
                  key: key,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset("assets/vip.png"),
                      Positioned(
                        child: Image.asset("assets/vip.png"),
                        top: 50,
                        left: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Export"),
                  onPressed: () {
                    var exportor =
                        key.currentWidget as DynamicWidgetJsonExportor;
                    var exportJson = json.decode(exportor.exportJsonString());
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("json string was exported to editor page.")));
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeEditorPage(exportJson)));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicWidgetJsonExportor extends StatelessWidget {
  final Widget? child;

  final GlobalKey globalKey = GlobalKey();

  DynamicWidgetJsonExportor({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: child,
    );
  }

  String exportJsonString() {
    String rt = "failed to export";
    globalKey.currentContext!.visitChildElements((element) {
      rt = ''; //jsonEncode(DynamicWidgetBuilder.export(element.widget, null));
    });
    return rt;
  }
}
