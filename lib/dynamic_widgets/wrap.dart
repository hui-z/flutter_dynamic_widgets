import 'package:flutter/cupertino.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class WrapHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Wrap';

  @override
  Type get widgetType => Wrap;

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
  late Axis? direction;
  late WrapAlignment? alignment;
  late double? spacing;
  late double? runSpacing;
  late TextDirection? textDirection;
  late VerticalDirection? verticalDirection;
  late WrapAlignment? runAlignment;
  late WrapCrossAlignment? crossAxisAlignment;
  late Clip? clipBehavior;

  Config.fromJson(Map<dynamic, dynamic> json) {
    direction = DynamicWidgetUtils.adapt<Axis>(json['direction']);
    alignment = DynamicWidgetUtils.adapt<WrapAlignment>(json['alignment']);
    spacing = json['spacing']?.toDouble();
    runSpacing = json['runSpacing']?.toDouble();
    crossAxisAlignment = DynamicWidgetUtils.adapt<WrapCrossAlignment>(
        json['crossAxisAlignment']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    verticalDirection =
        DynamicWidgetUtils.adapt<VerticalDirection>(json['verticalDirection']);
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
    runAlignment =
        DynamicWidgetUtils.adapt<WrapAlignment>(json['runAlignment']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(
        widget.config?.children,
        context: context,
        event: widget.event);

    return Wrap(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      direction: props?.direction ?? Axis.horizontal,
      alignment: props?.alignment ?? WrapAlignment.start,
      spacing: props?.spacing ?? 0.0,
      runAlignment: props?.runAlignment ?? WrapAlignment.start,
      runSpacing: props?.runSpacing ?? 0.0,
      crossAxisAlignment: props?.crossAxisAlignment ?? WrapCrossAlignment.start,
      textDirection: props?.textDirection,
      clipBehavior: props?.clipBehavior ?? Clip.none,
      verticalDirection: props?.verticalDirection ?? VerticalDirection.down,
      children: _children,
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var wrap = widget as Wrap?;
    if (wrap == null) return null;
    return {
      'widget': widgetName,
      'children':
      DynamicWidgetBuilder.transformList(wrap.children, buildContext),
      'xVar': {
        'direction': DynamicWidgetUtils.transform(wrap.direction),
        'alignment': DynamicWidgetUtils.transform(wrap.alignment),
        'runAlignment': DynamicWidgetUtils.transform(wrap.runAlignment),
        'crossAxisAlignment':
        DynamicWidgetUtils.transform(wrap.crossAxisAlignment),
        'verticalDirection':
        DynamicWidgetUtils.transform(wrap.verticalDirection),
        'textDirection': DynamicWidgetUtils.transform(wrap.textDirection),
        'clipBehavior': DynamicWidgetUtils.transform(wrap.clipBehavior),
        'runSpacing': wrap.runSpacing,
        'spacing': wrap.spacing,
      },
      'xKey': wrap.key.toString()
    };
  }
}
