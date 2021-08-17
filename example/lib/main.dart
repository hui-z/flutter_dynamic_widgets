import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/utils.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

void main() {
  DynamicWidgetUtils.registerSysWidgets();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var map = {
    'widget': 'Column',
    'propsList': [
      {
        'widget': 'Icon',
        'xVar': {
          'icon': {
            'codePoint':0xee29,
            'fontFamily': 'MaterialIcons',
          },
          "color": "0xFFDC143C",
          "size": 24.0,
        },
      },
      // {
      //   'widget': 'Text',
      //   'xVar': {
      //     'data': '再惠合同续约提醒',
      //     'style': {
      //       'color': '0xFF000000',
      //       'fontWeight': 'bold',
      //       'fontSize': 16.0
      //     }
      //   },
      // },
      // {
      //   'widget': 'Row',
      //   'propsList': [
      //     {
      //       'widget': 'Text',
      //       'xVar': {
      //         'data': '亲爱的商户',
      //         'style': {'color': '0xFF9E9E9E', 'fontSize': 14.0}
      //       }
      //     },
      //     {
      //       'widget': 'RawMaterialButton',
      //       'propsMap': {
      //         'widget': 'Text',
      //         'xVar': {
      //           'data': '加了个按钮',
      //           'style': {'color': '0xFF4CAF50', 'fontSize': 14.0}
      //         }
      //       }
      //     },
      //   ]
      // },
      // {
      //   'widget': 'Text',
      //   'xVar': {
      //     'data': '您与再惠合作的服务即将到期，请尽快沟通续约事宜',
      //     'style': {'color': '0xFF9E9E9E', 'fontSize': 14.0}
      //   },
      // },
      // {
      //   'widget': 'RawMaterialButton',
      //   'propsMap': {
      //     'widget': 'Text',
      //     'xVar': {
      //       'data': '确认续约',
      //       'style': {'color': '0xFF2196F3', 'fontSize': 16.0}
      //     },
      //   }
      // },
    ]
  };

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: DynamicWidgetUtils.buildWidget(
          DynamicWidgetConfig.fromJson(map), context: context),
    );
  }
}
