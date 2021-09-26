import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class ContainerHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Container';

  @override
  Type get widgetType => Container;

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
  late Alignment? alignment;
  late EdgeInsetsGeometry? padding;
  late Color? color;
  late EdgeInsetsGeometry? margin;
  late double? width;
  late double? height;
  late BoxConstraints? constraints;

  Config.fromJson(Map<dynamic, dynamic> json) {
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    margin = DynamicWidgetUtils.adapt<EdgeInsets>(json['margin']);
    width = DynamicWidgetUtils.adaptDouble(json['width']);
    height = DynamicWidgetUtils.adaptDouble(json['height']);
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return Container(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment,
      padding: props?.padding,
      color: props?.color,
      margin: props?.margin,
      width: props?.width,
      height: props?.height,
      constraints: props?.constraints,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as Container?;
    if (realWidget == null) return null;
    var padding = realWidget.padding as EdgeInsets?;
    var margin = realWidget.margin as EdgeInsets?;
    var constraints = realWidget.constraints;
    return {
      'widget': widgetName,
      'child':
      DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'alignment':
        DynamicWidgetUtils.transform(realWidget.alignment as Alignment?),
        'padding': DynamicWidgetUtils.transform(padding),
        'color': DynamicWidgetUtils.transform(realWidget.color),
        'margin': DynamicWidgetUtils.transform(margin),
        'constraints': DynamicWidgetUtils.transform(constraints),
      },
      'xKey': realWidget.key.toString()
    };
  }
}