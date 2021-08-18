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
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var icon = widget as Icon?;
    if (icon == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'icon': DynamicWidgetUtils.transformIconData(icon.icon),
        'size': icon.size,
        'color': DynamicWidgetUtils.transformColor(icon.color),
        'semanticLabel': icon.semanticLabel,
        'textDirection': DynamicWidgetUtils.transformTextDirection(icon.textDirection)
      },
      'xKey': icon.key.toString()
    };
  }

  @override
  Type get widgetType => Icon;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

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

/// The props of Text config
class IconConfig {
  late IconData? icon;
  late double? size;
  late Color? color;
  late String? semanticLabel;
  late TextDirection? textDirection;

  IconConfig({
    this.icon,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection
  });

  IconConfig.fromJson(Map<dynamic, dynamic> json) {
    icon = DynamicWidgetUtils.iconDataAdapter(json['icon']);
    size = json['size'];
    color = DynamicWidgetUtils.colorAdapter(json['color']);
    semanticLabel = json['semanticLabel'];
    textDirection = DynamicWidgetUtils.textDirectionAdapter(json['textDirection']);
  }
}