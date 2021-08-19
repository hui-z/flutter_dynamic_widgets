import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class IconHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Icon';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var icon = widget as Icon?;
    if (icon == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'icon': DynamicWidgetUtils.transform(icon.icon),
        'size': icon.size,
        'color': DynamicWidgetUtils.transform(icon.color),
        'semanticLabel': icon.semanticLabel,
        'textDirection': DynamicWidgetUtils.transform(icon.textDirection)
      },
      'xKey': icon.key.toString()
    };
  }

  @override
  Type get widgetType => Icon;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  IconConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = IconConfig.fromJson(widget.config?.xVar ?? {});
    }
    return Icon(
      props?.icon,
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      size: props?.size,
      color: props?.color,
      semanticLabel: props?.semanticLabel,
      textDirection: props?.textDirection
    );
  }
}

class IconConfig {
  late IconData? icon;
  late double? size;
  late Color? color;
  late String? semanticLabel;
  late TextDirection? textDirection;

  IconConfig.fromJson(Map<dynamic, dynamic> json) {
    icon = DynamicWidgetUtils.adapt<IconData>(json['icon']);
    size = json['size'];
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    semanticLabel = json['semanticLabel'];
    textDirection = DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
  }
}