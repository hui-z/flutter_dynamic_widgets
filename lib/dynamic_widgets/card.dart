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
  late Color? color;
  late Color? shadowColor;
  late double? elevation;

  //late ShapeBorder? shape;
  late bool? borderOnForeground;
  late EdgeInsetsGeometry? margin;
  late Clip? clipBehavior;
  late bool? semanticContainer;

  Config.fromJson(Map<dynamic, dynamic> json) {
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    shadowColor = DynamicWidgetUtils.adapt<Color>(json['shadowColor']);
    elevation = json['elevation']?.toDouble();
    borderOnForeground = json['borderOnForeground'];
    margin = DynamicWidgetUtils.adapt<EdgeInsets>(json['margin']);
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
    semanticContainer = json['semanticContainer'];
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
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

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as Card?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(
          realWidget.child, buildContext),
      'xVar': {
        'color': realWidget.color,
        'shadowColor': realWidget.shadowColor,
        'elevation': realWidget.elevation,
        'borderOnForeground': realWidget.borderOnForeground,
        'margin': DynamicWidgetUtils.transform(realWidget.margin as EdgeInsets),
        'clipBehavior': DynamicWidgetUtils.transform(realWidget.clipBehavior),
        'semanticContainer': realWidget.semanticContainer,
      },
      'xKey': realWidget.key.toString()
    };
  }
}
