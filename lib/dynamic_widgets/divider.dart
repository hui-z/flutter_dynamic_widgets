import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class DividerHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Divider';

  @override
  Type get widgetType => Divider;

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
  late double? height;
  late double? thickness;
  late double? indent;
  late double? endIndent;
  late Color? color;

  Config.fromJson(Map<dynamic, dynamic> json) {
    height = json['height'];
    thickness = json['thickness'];
    indent = json['indent'];
    endIndent = json['endIndent'];
    color = DynamicWidgetUtils.adapt<Color>(json['Color']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }

    return Divider(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      height: props?.height,
      thickness: props?.thickness,
      indent: props?.indent,
      endIndent: props?.endIndent,
      color: props?.color,
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var divider = widget as Divider?;
    if (divider == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'height': divider.height,
        'thickness': divider.thickness,
        'indent': divider.indent,
        'endIndent': divider.endIndent,
        'color': DynamicWidgetUtils.transform(divider.color),
      },
      'xKey': divider.key.toString()
    };
  }
}