import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class AspectRatioHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'AspectRatio';

  @override
  Type get widgetType => AspectRatio;

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
  late double? aspectRatio;

  Config.fromJson(Map<dynamic, dynamic> json) {
    aspectRatio = json["aspectRatio"]?.toDouble();
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return AspectRatio(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      aspectRatio: props?.aspectRatio ?? 0.0,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as AspectRatio?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'child':
      DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'aspectRatio': realWidget.aspectRatio,
      },
      'xKey': realWidget.key.toString()
    };
  }
}
