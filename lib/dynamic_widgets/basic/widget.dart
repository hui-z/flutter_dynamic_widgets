import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/align.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/center.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/container.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/data_table.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/image.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/list_body.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/padding.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/wrap.dart';

import '../button.dart';
import '../column.dart';
import '../icon.dart';
import '../row.dart';
import '../text.dart';
import 'handler.dart';

abstract class DynamicBaseWidget extends StatefulWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;
  DynamicBaseWidget(this.config, this.event, {Key? key}): super(key: key);
}

class DynamicWidgetBuilder {

  static Map<String, DynamicBasicWidgetHandler> _widgetHandlers = {};

  static registerSysWidgets() {
    List<DynamicBasicWidgetHandler> allDynamicWidgetHandlers = [
      IconHandler(),
      TextHandler(),
      RawMaterialButtonHandler(),
      RowHandler(),
      ColumnHandler(),
      DataTableHandler(),
      ImageHandler(),
      ContainerHandler(),
      AlignHandler(),
      PaddingHandler(),
      CenterHandler(),
      WrapHandler(),
      ListBodyHandler()
    ];
    for (DynamicBasicWidgetHandler item in allDynamicWidgetHandlers) {
      _widgetHandlers[item.widgetName] = item;
    }
  }

  ///Build widget
  static Widget? buildWidget(DynamicWidgetConfig? config,
      {Key? key, required BuildContext context, Function(String value)? event}) {
    if (config == null) return null;
    DynamicBasicWidgetHandler? handler = _widgetHandlers[config.widget];
    if (handler == null) return null;
    return handler.build(config, key: key, buildContext: context, event: event);
  }

  ///Build widget
  static List<Widget> buildWidgets(List<DynamicWidgetConfig>? configs,
      {Key? key, required BuildContext context,  Function(String value)? event}) {
    List<Widget> widgets = [];
    configs?.forEach((element) {
      DynamicBasicWidgetHandler? handler = _widgetHandlers[element.widget];
      Widget? widget = handler?.build(element, key: key, buildContext: context, event: event);
      if (widget != null) {
        widgets.add(widget);
      }
    });
    return widgets;
  }

  static Map? transformMap(Widget? widget, BuildContext? buildContext) {
    var handle = findMatchedWidgetHandlerForTransform(widget);
    if (handle != null) {
      return handle.transformJson(widget, buildContext);
    }
    return null;
  }

  static List<Map> transformList(
      List<Widget>? widgets, BuildContext? buildContext) {
    List<Map> list = [];
    widgets?.forEach((element) {
      var map = transformMap(element, buildContext);
      if (map != null) {
        list.add(map);
      }
    });
    return list;
  }

  static DynamicBasicWidgetHandler? findMatchedWidgetHandlerForTransform(Widget? widget) {
    if (widget == null) return null;
    DynamicBasicWidgetHandler? handleWidget;
    _widgetHandlers.forEach((name, handle) {
      if (handle.widgetType == widget.runtimeType) {
        handleWidget = handle;
      }
    });
    return handleWidget;
  }
}