import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class ListBodyHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ListBody';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var listBody = widget as ListBody?;
    if (listBody == null) return null;
    return {
      'widget': widgetName,
      'children': DynamicWidgetBuilder.transformList(listBody.children, buildContext),
      'xVar': {
        'reverse': listBody.reverse,
        'mainAxis': DynamicWidgetUtils.transform(listBody.mainAxis),
      },
      'xKey': listBody.key.toString()
    };
  }

  @override
  Type get widgetType => ListBody;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ListBodyConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ListBodyConfig.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(widget.config?.children,
        context: context, event: widget.event);

    return ListBody(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      mainAxis: props?.mainAxis ?? Axis.vertical,
      reverse: props?.reverse ?? false,
      children: _children,
    );
  }
}

class ListBodyConfig {
  late Axis? mainAxis;
  late bool? reverse;

  ListBodyConfig({this.mainAxis, this.reverse});

  ListBodyConfig.fromJson(Map<dynamic, dynamic> json) {
    mainAxis = DynamicWidgetUtils.adapt<Axis>(json['mainAxis']);
    reverse = json['reverse'];
  }
}
