import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

abstract class DynamicBaseWidget extends StatefulWidget {
  final DynamicWidgetConfig? config;
  DynamicBaseWidget(this.config, {Key? key}): super(key: key);
}