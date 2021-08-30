import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class CardHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Card';

  @override
  Type get widgetType => Card;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Card?;
    if (realWidget == null) return null;
    return CardConfig.toJson(realWidget, widgetName, buildContext);
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
  CardConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CardConfig.fromJson(widget.config?.xVar ?? {});
    }
    return Card(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      color: props?.color,
      shadowColor: props?.shadowColor,
      elevation: props?.elevation,
      borderOnForeground: props?.borderOnForeground ?? true,
      margin: props?.margin,
      clipBehavior: props?.clipBehavior,
      semanticContainer: props?.semanticContainer ?? true,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }
}

class CardConfig {
  late Color? color;
  late Color? shadowColor;
  late double? elevation;

  //late ShapeBorder? shape;
  late bool? borderOnForeground;
  late EdgeInsetsGeometry? margin;
  late Clip? clipBehavior;
  late bool? semanticContainer;

  CardConfig.fromJson(Map<dynamic, dynamic> json) {
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    shadowColor = DynamicWidgetUtils.adapt<Color>(json['shadowColor']);
    elevation = json['elevation']?.toDouble();
    borderOnForeground = json['borderOnForeground'];
    margin = DynamicWidgetUtils.adapt<EdgeInsets>(json['margin']);
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
    semanticContainer = json['semanticContainer'];
  }

  static Map? toJson(
      Card widget, String widgetName, BuildContext? buildContext) {
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(widget.child, buildContext),
      'xVar': {
        'color': widget.color,
        'shadowColor': widget.shadowColor,
        'elevation': widget.elevation,
        'borderOnForeground': widget.borderOnForeground,
        'margin': DynamicWidgetUtils.transform(widget.margin as EdgeInsets),
        'clipBehavior': DynamicWidgetUtils.transform(widget.clipBehavior),
        'semanticContainer': widget.semanticContainer,
      },
      'xKey': widget.key.toString()
    };
  }
}
