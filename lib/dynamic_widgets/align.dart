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
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

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
    Widget? _child = DynamicWidgetUtils.buildWidget(widget.config?.propsMap,
        context: context);

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
