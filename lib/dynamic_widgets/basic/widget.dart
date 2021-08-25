import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/align.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/center.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/container.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/data_table.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/image.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/list_body.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/list_input_item.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/list_view.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/padding.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/wrap.dart';

import '../button.dart';
import '../check_list.dart';
import '../check_list_item.dart';
import '../column.dart';
import '../divider.dart';
import '../expansion_tile.dart';
import '../gesture_detector.dart';
import '../icon.dart';
import '../ink_well.dart';
import '../rich_text.dart';
import '../row.dart';
import '../text.dart';
import 'handler.dart';

abstract class DynamicBaseWidget extends StatefulWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;
  DynamicBaseWidget(this.config, this.event, {Key? key}) : super(key: key);
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
      ListBodyHandler(),
      ListViewHandler(),
      ListInputItemHandler(),
      GestureDetectorHandler(),
      InkWellHandler(),
      CheckListItemHandler(),
      CheckListHandler(),
      DividerHandler(),
      CustomExpansionTileHandler(),
      RichTextHandler()
    ];
    for (DynamicBasicWidgetHandler item in allDynamicWidgetHandlers) {
      _widgetHandlers[item.widgetName] = item;
    }
  }

  ///Build widget
  static Widget? buildWidget(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext context,
      Function(String value)? event}) {
    if (config == null) return null;
    DynamicBasicWidgetHandler? handler = _widgetHandlers[config.widget];
    if (handler == null)
      throw UnimplementedError('请实现并注册 ${config.widget}Handler');
    return handler.build(config, key: key, buildContext: context, event: event);
  }

  ///Build widget
  static List<Widget> buildWidgets(List<DynamicWidgetConfig>? configs,
      {Key? key,
      required BuildContext context,
      Function(String value)? event}) {
    List<Widget> widgets = [];
    configs?.forEach((element) {
      DynamicBasicWidgetHandler? handler = _widgetHandlers[element.widget];
      if (handler == null)
        throw UnimplementedError('请实现并注册 ${element.widget}Handler');
      Widget widget =
          handler.build(element, key: key, buildContext: context, event: event);
      widgets.add(widget);
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

  static DynamicBasicWidgetHandler? findMatchedWidgetHandlerForTransform(
      Widget? widget) {
    if (widget == null) return null;
    DynamicBasicWidgetHandler? handleWidget;
    _widgetHandlers.forEach((name, handle) {
      if (handle.widgetType == widget.runtimeType) {
        handleWidget = handle;
      }
    });
    if (handleWidget == null)
      throw UnimplementedError('请实现并注册 ${widget.runtimeType}Handler');
    return handleWidget;
  }
}
