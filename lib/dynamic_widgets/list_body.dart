import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class ListBodyHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ListBody';

  @override
  Type get widgetType => ListBody;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    return Config.toJson(widget, widgetName, buildContext);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(EventInfo value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Config.toWidget(context, widget);
  }
}

class Config {
  late Axis? mainAxis;
  late bool? reverse;

  Config.fromJson(Map<dynamic, dynamic> json) {
    mainAxis = DynamicWidgetUtils.adapt<Axis>(json['mainAxis']);
    reverse = json['reverse'];
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(
        widget.config?.children,
        context: context,
        event: widget.event);

    return ListBody(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      mainAxis: props?.mainAxis ?? Axis.vertical,
      reverse: props?.reverse ?? false,
      children: _children,
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var listBody = widget as ListBody?;
    if (listBody == null) return null;
    return {
      'widget': widgetName,
      'children':
      DynamicWidgetBuilder.transformList(listBody.children, buildContext),
      'xVar': {
        'reverse': listBody.reverse,
        'mainAxis': DynamicWidgetUtils.transform(listBody.mainAxis),
      },
      'xKey': listBody.key.toString()
    };
  }
}