import 'package:flutter/cupertino.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class RowHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Row';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var row = widget as Row?;
    if (row == null) return null;
    return {
      'widget': widgetName,
      'children': DynamicWidgetBuilder.transformList(row.children, buildContext),
      'xVar': {
        'mainAxisAlignment': DynamicWidgetUtils.transform(row.mainAxisAlignment),
        'mainAxisSize': DynamicWidgetUtils.transform(row.mainAxisSize),
        'crossAxisAlignment': DynamicWidgetUtils.transform(row.crossAxisAlignment),
        'textDirection': DynamicWidgetUtils.transform(row.textDirection),
        'verticalDirection': DynamicWidgetUtils.transform(row.verticalDirection),
        'textBaseline': DynamicWidgetUtils.transform(row.textBaseline),
      },
      'xKey': row.key.toString()
    };
  }

  @override
  Type get widgetType => Row;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  RowConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = RowConfig.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(widget.config?.children, context: context, event: widget.event);

    return Row(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      mainAxisAlignment: props?.mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: props?.mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: props?.crossAxisAlignment ?? CrossAxisAlignment.center,
      textDirection: props?.textDirection,
      verticalDirection: props?.verticalDirection ?? VerticalDirection.down,
      textBaseline: props?.textBaseline,
      children: _children,
    );
  }

}

class RowConfig {
  late MainAxisAlignment? mainAxisAlignment;
  late MainAxisSize? mainAxisSize;
  late CrossAxisAlignment? crossAxisAlignment;
  late TextDirection? textDirection;
  late VerticalDirection? verticalDirection;
  late TextBaseline? textBaseline;

  RowConfig.fromJson(Map<dynamic, dynamic> json) {
    mainAxisAlignment = DynamicWidgetUtils.adapt<MainAxisAlignment>(json['mainAxisAlignment']);
    mainAxisSize = DynamicWidgetUtils.adapt<MainAxisSize>(json['mainAxisSize']);
    crossAxisAlignment = DynamicWidgetUtils.adapt<CrossAxisAlignment>(json['crossAxisAlignment']);
    textDirection = DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    verticalDirection = DynamicWidgetUtils.adapt<VerticalDirection>(json['verticalDirection']);
    textBaseline = DynamicWidgetUtils.adapt<TextBaseline>(json['textBaseline']);
  }

}