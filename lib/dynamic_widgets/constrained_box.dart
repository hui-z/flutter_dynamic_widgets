import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
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

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(EventInfo value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ConstrainedBoxConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ConstrainedBoxConfig.fromJson(widget.config?.xVar ?? {});
    }
    return ConstrainedBox(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      constraints: props?.constraints ?? BoxConstraints(),
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }
}

class ConstrainedBoxConfig {
  late BoxConstraints? constraints;

  ConstrainedBoxConfig.fromJson(Map<dynamic, dynamic> json) {
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
  }
}
