import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

abstract class DynamicBasicWidgetHandler {

  /// the widget type name
  String get widgetName;

  /// parse the json map into a flutter widget.
  Widget build(DynamicWidgetConfig? config, {Key? key, required BuildContext buildContext});
}