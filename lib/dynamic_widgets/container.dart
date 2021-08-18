import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class ContainerHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Container';

  @override
  Type get widgetType => Image;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
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
      'child': DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'alignment': DynamicWidgetUtils.transformAlignment(
            realWidget.alignment as Alignment?),
        'padding': DynamicWidgetUtils.transformEdgeInset(padding),
        'color': DynamicWidgetUtils.transformColor(realWidget.color),
        'margin': DynamicWidgetUtils.transformEdgeInset(margin),
        'constraints': DynamicWidgetUtils.transformBoxConstraints(constraints),
      },
      'xKey': realWidget.key.toString()
    };
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

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
      child: DynamicWidgetBuilder.buildWidget(
          widget.config?.child, context: context),
    );
  }
}

/// The props of Text config
class ContainerConfig {
  late Alignment? alignment;
  late EdgeInsetsGeometry? padding;
  late Color? color;
  late EdgeInsetsGeometry? margin;
  late double? width;
  late double? height;
  late BoxConstraints? constraints;

  ContainerConfig({
    this.alignment,
    this.padding,
    this.color,
    this.margin,
    this.width,
    this.height,
    this.constraints,
  });

  ContainerConfig.fromJson(Map<dynamic, dynamic> json) {
    alignment = DynamicWidgetUtils.alignmentAdapter(json['alignment']);
    padding = DynamicWidgetUtils.edgeInsetAdapter(json['padding']);
    color = DynamicWidgetUtils.colorAdapter(json['color']);
    margin = DynamicWidgetUtils.edgeInsetAdapter(json['margin']);
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
    constraints = DynamicWidgetUtils.boxConstraintsAdapter(json['constraints']);
  }
}