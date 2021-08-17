import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// Column handler
class AlignHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Align';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var align = widget as Align?;
    if (align == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(align.child, buildContext),
      'xVar': {
        'widthFactor': align.widthFactor,
        'heightFactor': align.heightFactor,
        'alignment': DynamicWidgetUtils.transformAlignment(align.alignment as Alignment?),
      },
      'xKey': align.key.toString()
    };
  }

  @override
  Type get widgetType => Align;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  AlignConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = AlignConfig.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    return Align(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment ?? Alignment.center,
      widthFactor: props?.widthFactor,
      heightFactor: props?.heightFactor,
      child: _child ?? SizedBox(),
    );
  }
}

/// The props of Column config
class AlignConfig {
  late double? widthFactor;
  late double? heightFactor;
  late AlignmentGeometry? alignment;

  AlignConfig({this.widthFactor, this.heightFactor, this.alignment});

  AlignConfig.fromJson(Map<dynamic, dynamic> json) {
    widthFactor = json['widthFactor'];
    heightFactor = json['heightFactor'];
    alignment = DynamicWidgetUtils.alignmentAdapter(json['alignment']);
  }
}
