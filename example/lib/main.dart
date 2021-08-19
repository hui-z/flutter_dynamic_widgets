import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/utils.dart';
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
    var tableData = DataTable(columns: [
      DataColumn(label: Text('姓名')),
      DataColumn(label: Text('年龄')),
    ], rows: [
      DataRow(cells: [
        DataCell(Text('老孟')),
        DataCell(Text('18')),
      ]),
    ]);
    var wrap = Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: <Widget>[
        Text('Hamilton'),
        Text('Lafayette'),
        Text('Mulligan'),
        Text('Laurens'),
      ],
    );
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
                                CodeEditorPage(json.encode(testMap))));
                  },
                ),
                RaisedButton(
                  child: Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(json.encode(iconMap))));
                  },
                ),
                RaisedButton(
                  child: Text("TableData"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(json.encode(
                                DynamicWidgetBuilder.transformMap(
                                    tableData, context)))));
                  },
                ),
                RaisedButton(
                  child: Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(json.encode(
                                DynamicWidgetBuilder.transformMap(
                                    wrap, context)))));
                  },
                ),
                RaisedButton(
                  child: Text("AssetImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(json.encode(assetImageMap))));
                  },
                ),
                RaisedButton(
                  child: Text("NetworkImage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(json.encode(networkImageMap))));
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}

class CodeEditorPage extends StatefulWidget {
  final String jsonString;

  CodeEditorPage(this.jsonString);

  @override
  State<StatefulWidget> createState() {
    return _CodeEditorPageState(jsonString);
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  String jsonString;
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState(this.jsonString);

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
                  controller: controller,
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
                  jsonString = controller.text;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewPage(controller.text)));
              },
            )
          ],
        ));
    controller.text = jsonString;
    return widget;
  }
}

// ignore: must_be_immutable
class PreviewPage extends StatelessWidget {
  final String jsonString;

  PreviewPage(this.jsonString);

  late DynamicWidgetJsonExportor _exportor;

  @override
  Widget build(BuildContext context) {
    jsonStringToMap(String jsonString) {
      Map<String, dynamic> map = json.decode(jsonString);
      return map;
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(jsonStringToMap(jsonString)),
          context: context),
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
                    var exportJsonString = exportor.exportJsonString();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("json string was exported to editor page.")));
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeEditorPage(exportJsonString)));
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
