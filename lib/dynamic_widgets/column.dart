import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class ColumnHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Column';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var column = widget as Column?;
    if (column == null) return null;
    return {
      'widget': widgetName,
      'children':
          DynamicWidgetBuilder.transformList(column.children, buildContext),
      'xVar': {
        'mainAxisAlignment':
            DynamicWidgetUtils.transform(column.mainAxisAlignment),
        'mainAxisSize': DynamicWidgetUtils.transform(column.mainAxisSize),
        'crossAxisAlignment':
            DynamicWidgetUtils.transform(column.crossAxisAlignment),
        'textDirection': DynamicWidgetUtils.transform(column.textDirection),
        'verticalDirection':
            DynamicWidgetUtils.transform(column.verticalDirection),
        'textBaseline': DynamicWidgetUtils.transform(column.textBaseline),
      },
      'xKey': column.key.toString()
    };
  }

  @override
  Type get widgetType => Column;
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
  ColumnConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ColumnConfig.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(
        widget.config?.children,
        context: context,
        event: widget.event);

    return Column(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      mainAxisAlignment: props?.mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: props?.mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment:
          props?.crossAxisAlignment ?? CrossAxisAlignment.center,
      textDirection: props?.textDirection,
      verticalDirection: props?.verticalDirection ?? VerticalDirection.down,
      textBaseline: props?.textBaseline,
      children: _children,
    );
  }
}

class ColumnConfig {
  late MainAxisAlignment? mainAxisAlignment;
  late MainAxisSize? mainAxisSize;
  late CrossAxisAlignment? crossAxisAlignment;
  late TextDirection? textDirection;
  late VerticalDirection? verticalDirection;
  late TextBaseline? textBaseline;

  ColumnConfig.fromJson(Map<dynamic, dynamic> json) {
    mainAxisAlignment =
        DynamicWidgetUtils.adapt<MainAxisAlignment>(json['mainAxisAlignment']);
    mainAxisSize = DynamicWidgetUtils.adapt<MainAxisSize>(json['mainAxisSize']);
    crossAxisAlignment = DynamicWidgetUtils.adapt<CrossAxisAlignment>(
        json['crossAxisAlignment']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    verticalDirection =
        DynamicWidgetUtils.adapt<VerticalDirection>(json['verticalDirection']);
    textBaseline = DynamicWidgetUtils.adapt<TextBaseline>(json['textBaseline']);
  }
}
