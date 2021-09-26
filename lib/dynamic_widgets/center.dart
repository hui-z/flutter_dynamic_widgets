import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class CenterHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Center';

  @override
  Type get widgetType => Center;

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
  late double? widthFactor;
  late double? heightFactor;

  Config.fromJson(Map<dynamic, dynamic> json) {
    widthFactor = DynamicWidgetUtils.adaptDouble(json['widthFactor']);
    heightFactor = DynamicWidgetUtils.adaptDouble(json['heightFactor']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    return Center(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      widthFactor: props?.widthFactor,
      heightFactor: props?.heightFactor,
      child: _child ?? SizedBox(),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var center = widget as Center?;
    if (center == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(center.child, buildContext),
      'xVar': {
        'widthFactor': DynamicWidgetUtils.transform(center.widthFactor),
        'heightFactor': DynamicWidgetUtils.transform(center.heightFactor),
      },
      'xKey': center.key.toString()
    };
  }
}