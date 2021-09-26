import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/event.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class CheckListHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CheckList';

  @override
  Type get widgetType => CheckList;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    return Config.toJson(widget, widgetName, buildContext);
  }
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Config.toWidget(context, widget);
  }
}

class Config {
  late CheckType? checkType;
  late String checkAllTitle;
  late List<CheckListGroupData> groupData;
  late CrossAxisAlignment? crossAxisAlignment;
  late bool? showIcon;
  late String? icon;
  late double? indent;
  late Divider? divider;
  late Color? activeColor;
  late List<CheckListData> selectedData;
  late bool? showCheckAll;
  late bool? isCheckAll;
  late EdgeInsets? padding;
  late List<CheckListData> data;

  Config.fromJson(Map<dynamic, dynamic> json, BuildContext? context) {
    checkType =
    json['checkType'] == 'multiple' ? CheckType.multiple : CheckType.single;
    checkAllTitle = json['checkAllTitle'];
    groupData = [];
    json['groupData']?.forEach((v) {
      var checkListData = <CheckListData>[];
      v['data']?.forEach((v) {
        checkListData.add(CheckListData.adapter(v, context)!);
      });
      groupData.add(CheckListGroupData(v['title'] ?? '', checkListData,
          DynamicWidgetUtils.adapt<TextStyle>(v['titleStyle'])));
    });
    crossAxisAlignment = DynamicWidgetUtils.adapt<CrossAxisAlignment>(
        json['crossAxisAlignment']);
    showIcon = json['showIcon'];
    icon = json['icon'];
    indent = json['indent'];
    divider = json['divider'] != null
        ? DynamicWidgetBuilder.buildWidget(
        DynamicWidgetConfig.fromJson(json['divider']!),
        context: context!) as Divider?
        : null;
    activeColor = json['activeColor'];
    selectedData = [];
    json['selectedData']?.forEach((v) {
      selectedData.add(CheckListData.adapter(v, context)!);
    });
    showCheckAll = json['showCheckAll'];
    isCheckAll = json['isCheckAll'];
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    data = [];
    json['data']?.forEach((v) {
      data.add(CheckListData.adapter(v, context)!);
    });
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {}, context);
    }
    var onCheck = (List<CheckListData> checkedData) {
      var eventInfo = widget.config?.events.firstWhere(
              (element) => element.type == EventType.onCheck,
          orElse: () => EventInfo(type: '', action: ''));
      if (eventInfo?.type != null &&
          eventInfo?.type != '' &&
          widget.event != null) {
        eventInfo?.operateData =
        'checkedData=${json.encode(checkedData.map((e) => e.transform(context)))
            .toString()}';
        widget.event!(eventInfo!);
      }
    };

    return CheckList(
      checkType: props?.checkType ?? CheckType.single,
      checkAllTitle: props?.checkAllTitle ?? '全部',
      groupData: props?.groupData,
      onCheck: onCheck,
      crossAxisAlignment: props?.crossAxisAlignment,
      onIconPressed: (item) {
        var eventInfo = widget.config?.events.firstWhere(
                (element) => element.type == EventType.onTap,
            orElse: () => EventInfo(type: '', action: ''));
        if (eventInfo?.type != null &&
            eventInfo?.type != '' &&
            widget.event != null) {
          eventInfo?.operateData =
              json.encode(item.transform(context)).toString();
          widget.event!(eventInfo!);
        }
      },
      showIcon: props?.showIcon ?? false,
      icon: props?.icon,
      indent: props?.indent ?? 0.0,
      divider: props?.divider,
      selectedData: props?.selectedData,
      showCheckAll: props?.showCheckAll,
      isCheckAll: props?.isCheckAll,
      padding: props?.padding,
      data: props?.data,
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var checkList = widget as CheckList?;
    if (checkList == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'checkType':
        checkList.checkType == CheckType.multiple ? 'multiple' : 'single',
        'checkAllTitle': checkList.checkAllTitle,
        'groupData': checkList.groupData
            ?.map((e) =>
        {
          'title': e.title,
          'titleStyle': DynamicWidgetUtils.transform(e.titleStyle),
          'data': e.data.map((e) => e.transform(buildContext)).toList()
        })
            .toList(),
        'crossAxisAlignment':
        DynamicWidgetUtils.transform(checkList.crossAxisAlignment),
        'showIcon': checkList.showIcon,
        'activeColor': DynamicWidgetUtils.transform(checkList.activeColor),
        'icon': checkList.icon,
        'indent': checkList.indent,
        'divider':
        DynamicWidgetBuilder.transformMap(checkList.divider, buildContext),
        'selectedData':
        checkList.selectedData.map((e) => e.transform(buildContext)).toList(),
        'showCheckAll': checkList.showCheckAll,
        'isCheckAll': checkList.isCheckAll,
        'padding': DynamicWidgetUtils.transform(checkList.padding),
        'data': checkList.data.map((e) => e.transform(buildContext)).toList()
      },
      'xKey': checkList.key.toString()
    };
  }
}
