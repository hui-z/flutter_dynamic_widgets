import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class IconHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Icon';

  @override
  Type get widgetType => Icon;

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
  late IconData? icon;
  late double? size;
  late Color? color;
  late String? semanticLabel;
  late TextDirection? textDirection;

  Config.fromJson(Map<dynamic, dynamic> json) {
    icon = DynamicWidgetUtils.adapt<IconData>(json['icon']);
    size = json['size']?.toDouble();
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    semanticLabel = json['semanticLabel'];
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return Icon(props?.icon,
        key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
        size: props?.size,
        color: props?.color,
        semanticLabel: props?.semanticLabel,
        textDirection: props?.textDirection);
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
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
}
