import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/event.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

abstract class DynamicBasicWidgetHandler {
  /// the widget type name
  String get widgetName;

  Type get widgetType;

  /// parse the json map into a flutter widget.
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event});

  Map? transformJson(Widget? widget, BuildContext? buildContext);
}
