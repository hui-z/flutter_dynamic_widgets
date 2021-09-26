import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class BoxConstraintsHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ConstrainedBox';

  @override
  Type get widgetType => ConstrainedBox;

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
  late BoxConstraints? constraints;

  Config.fromJson(Map<dynamic, dynamic> json) {
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return ConstrainedBox(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      constraints: props?.constraints ?? BoxConstraints(),
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as ConstrainedBox?;
    if (realWidget == null) return null;
    var constraints = realWidget.constraints;
    return {
      'widget': widgetName,
      'child':
      DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'constraints': DynamicWidgetUtils.transform(constraints),
      },
      'xKey': realWidget.key.toString()
    };
  }
}
