import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class PaddingHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Padding';

  @override
  Type get widgetType => Padding;

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
  late EdgeInsetsGeometry? padding;
  late String? visable;

  Config.fromJson(Map<dynamic, dynamic> json) {
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    visable = json['visable']?.toString();
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    if (props?.visable == 'false') {
      return SizedBox();
    } else {
      return Padding(
        key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
        padding: props?.padding ?? const EdgeInsets.all(0.0),
        child: _child ?? SizedBox(),
      );
    }
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var padding = widget as Padding?;
    if (padding == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(padding.child, buildContext),
      'xVar': {
        'padding': DynamicWidgetUtils.transform(padding.padding as EdgeInsets?),
        'visable':'true',
      },
      'xKey': padding.key.toString()
    };
  }
}
