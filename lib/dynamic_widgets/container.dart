import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
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

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(EventInfo value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ContainerConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ContainerConfig.fromJson(widget.config?.xVar ?? {});
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
}

class ContainerConfig {
  late Alignment? alignment;
  late EdgeInsetsGeometry? padding;
  late Color? color;
  late EdgeInsetsGeometry? margin;
  late double? width;
  late double? height;
  late BoxConstraints? constraints;

  ContainerConfig.fromJson(Map<dynamic, dynamic> json) {
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    margin = DynamicWidgetUtils.adapt<EdgeInsets>(json['margin']);
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
  }
}
