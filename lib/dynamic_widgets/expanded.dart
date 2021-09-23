import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'basic/handler.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class ExpandedHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Expanded';

  @override
  Type get widgetType => Expanded;

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
  late int flex;

  Config.fromJson(Map<dynamic, dynamic> json, BuildContext context) {
    flex = json['flex'].toInt() ?? 1;
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(
          widget.config?.xVar ?? {}, context);
    }
    return Expanded(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      flex: props?.flex ?? 1,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event) ?? SizedBox(),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var expanded = widget as Expanded?;
    if (expanded == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(
          expanded.child, buildContext),
      'xVar': {
        'flex': expanded.flex,
      },
      'xKey': expanded.key.toString()
    };
  }
}
