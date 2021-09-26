import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class SizedBoxHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'SizedBox';

  @override
  Type get widgetType => SizedBox;

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
  late double? width;
  late double? height;

  Config.fromJson(Map<dynamic, dynamic> json) {
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return SizedBox(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      width: props?.width,
      height: props?.height,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as SizedBox?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'child':
      DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'width': realWidget.width,
        'height': realWidget.height,
      },
      'xKey': realWidget.key.toString()
    };
  }
}
