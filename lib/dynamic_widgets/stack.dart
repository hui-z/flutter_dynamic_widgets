import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class StackHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Stack';

  @override
  Type get widgetType => Stack;

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
  late TextDirection? textDirection;
  late StackFit? fit;

  Config.fromJson(Map<dynamic, dynamic> json) {
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    fit = DynamicWidgetUtils.adapt<StackFit>(json['fit']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return Stack(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment ?? AlignmentDirectional.topStart,
      textDirection: props?.textDirection,
      fit: props?.fit ?? StackFit.loose,
      children: DynamicWidgetBuilder.buildWidgets(widget.config?.children,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as Stack?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'alignment':
        DynamicWidgetUtils.transform(realWidget.alignment as Alignment?),
        'textDirection': DynamicWidgetUtils.transform(realWidget.textDirection),
        'fit': DynamicWidgetUtils.transform(realWidget.fit),
      },
      'xKey': realWidget.key.toString()
    };
  }
}