import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class CheckListItemHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CheckListItem';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var checkListItem = widget as CheckListItem?;
    if (checkListItem == null) return null;
    return CheckListItemConfig.toJson(checkListItem, widgetName, buildContext);
  }

  @override
  Type get widgetType => CheckListItem;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  CheckListItemConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CheckListItemConfig.fromJson(widget.config?.xVar ?? {}, context);
    }
    var onCheck = (bool? isChecked, CheckListData? item) {
      if (widget.config?.eventName?.contains('onCheck') == true &&
          widget.event != null) {
        widget.event!(widget.config!.eventName! +
            '&item=${json.encode(CheckListItemConfig._transformCheckListData(item, context)).toString()}' +
            '&isChecked=${isChecked ?? false}');
      }
    };

    return CheckListItem(
      props?.checkType ?? CheckType.single,
      props?.item,
      onCheck,
      props?.checkedData ?? [],
      crossAxisAlignment:
          props?.crossAxisAlignment ?? CrossAxisAlignment.center,
      showIcon: props?.showIcon ?? false,
      icon: props?.icon,
      onIconPressed: (item) {
        if (widget.config?.eventName?.contains('onIconPressed') == true &&
            widget.event != null) {
          widget.event!(widget.config!.eventName! +
              json
                  .encode(CheckListItemConfig._transformCheckListData(
                      item, context))
                  .toString());
        }
      },
      activeColor: props?.activeColor,
    );
  }
}

class CheckListItemConfig {
  late CheckType? checkType;
  late CheckListData? item;
  late List<CheckListData>? checkedData;
  late CrossAxisAlignment? crossAxisAlignment;
  late bool? showIcon;
  late String? icon;
  late Color? activeColor;

  CheckListItemConfig.fromJson(
      Map<dynamic, dynamic> json, BuildContext? context) {
    checkType =
        json['checkType'] == 'multiple' ? CheckType.multiple : CheckType.single;
    item = _checkListDataAdapter(json['item'], context);
    checkedData = [];
    json['checkedData']?.forEach((v) {
      checkedData?.add(_checkListDataAdapter(v, context)!);
    });
    crossAxisAlignment = DynamicWidgetUtils.adapt<CrossAxisAlignment>(
        json['crossAxisAlignment']);
    showIcon = json['showIcon'];
    icon = json['icon'];
    activeColor = json['activeColor'];
  }

  static Map? toJson(
      CheckListItem checkListItem, String widgetName, BuildContext? context) {
    return {
      'widget': widgetName,
      'xVar': {
        'checkType': checkListItem.checkType == CheckType.multiple
            ? 'multiple'
            : 'single',
        'item': _transformCheckListData(checkListItem.item, context),
        'checkedData': checkListItem.checkedData
            .map((e) => _transformCheckListData(e, context))
            .toList(),
        'crossAxisAlignment':
            DynamicWidgetUtils.transform(checkListItem.crossAxisAlignment),
        'showIcon': checkListItem.showIcon,
        'activeColor': DynamicWidgetUtils.transform(checkListItem.activeColor),
        'icon': checkListItem.icon,
      },
      'xKey': checkListItem.key.toString()
    };
  }

  static CheckListData? _checkListDataAdapter(
      Map? data, BuildContext? context) {
    if (data == null) return null;
    return CheckListData(
        id: data['id'] ?? '',
        title: data['title'],
        titleStyle: DynamicWidgetUtils.adapt<TextStyle>(data['titleStyle']),
        subtitle: data['subtitle'],
        subtitleStyle:
            DynamicWidgetUtils.adapt<TextStyle>(data['subtitleStyle']),
        child: data['child'] != null
            ? DynamicWidgetBuilder.buildWidget(
                DynamicWidgetConfig.fromJson(data['child']),
                context: context!)
            : null);
  }

  static Map? _transformCheckListData(
      CheckListData? data, BuildContext? context) {
    if (data == null) return null;
    return {
      'id': data.id,
      'title': data.title,
      'titleStyle': DynamicWidgetUtils.transform(data.titleStyle),
      'subtitle': data.subtitle,
      'subtitleStyle': DynamicWidgetUtils.transform(data.subtitleStyle),
      'child': DynamicWidgetBuilder.transformMap(data.child, context)
    };
  }
}
