import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class IndexedStackHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'IndexedStack';

  @override
  Type get widgetType => IndexedStack;

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
  late StackFit? sizing;
  late int? index;

  Config.fromJson(Map<dynamic, dynamic> json) {
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    sizing = DynamicWidgetUtils.adapt<StackFit>(json['sizing']);
    index = json['index']?.toInt();
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return IndexedStack(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment ?? AlignmentDirectional.topStart,
      textDirection: props?.textDirection,
      sizing: props?.sizing ?? StackFit.loose,
      index: props?.index ?? 0,
      children: DynamicWidgetBuilder.buildWidgets(widget.config?.children,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as IndexedStack?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'children':
      DynamicWidgetBuilder.transformList(realWidget.children, buildContext),
      'xVar': {
        'alignment':
        DynamicWidgetUtils.transform(realWidget.alignment as Alignment?),
        'textDirection': DynamicWidgetUtils.transform(realWidget.textDirection),
        'sizing': DynamicWidgetUtils.transform(realWidget.fit),
      },
      'xKey': realWidget.key.toString()
    };
  }
}