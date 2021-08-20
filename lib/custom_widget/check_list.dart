import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/utils.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/widget.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

import 'border_group.dart';

enum CheckType {
  single,
  multiple,
}

class CheckListData {
  String id;
  String? title;
  TextStyle? titleStyle;
  String? subtitle;
  TextStyle? subtitleStyle;
  Widget? child;

  CheckListData(
      {required this.id,
      this.title,
      this.titleStyle,
      this.subtitle,
      this.subtitleStyle,
      this.child});

  static CheckListData? adapter(
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

  Map? transform(BuildContext? context) {
    return {
      'id': id,
      'title': title,
      'titleStyle': DynamicWidgetUtils.transform(titleStyle),
      'subtitle': subtitle,
      'subtitleStyle': DynamicWidgetUtils.transform(subtitleStyle),
      'child': DynamicWidgetBuilder.transformMap(child, context)
    };
  }
}

class CheckListGroupData {
  String title;
  TextStyle? titleStyle;
  List<CheckListData> data;

  CheckListGroupData(this.title, this.data, this.titleStyle);
}

/// 通用选择列表，支持单选列表，多选列表，分组多选列表
///
/// ## Simple code
/// ```dart
///               var data1 = [
///                 CheckListData(id: '1', title: 'A'),
///                 CheckListData(id: '2', title: 'B'),
///                 CheckListData(id: '3', title: 'B')
///               ];
///
///               var data2 = [
///                 CheckListData(id: '4', title: 'A'),
///                 CheckListData(id: '5', title: 'B'),
///                 CheckListData(id: '6', title: 'B')
///               ];
///
///               var groupData = [
///                 CheckListGroupData('1 组', data1),
///                 CheckListGroupData('2 组', data2)
///               ];
///
///               CheckList(
///                 checkType: CheckType.single,
///                 showIcon: true,
///                 data: data1,
///                 selectedData: data1,
///                 onCheck: (checkedItems) {},
///                 onIconPressed: (item) {},
///               );
///
///               CheckList(
///                 checkType: CheckType.multiple,
///                 isCheckAll: false,
///                 showCheckAll: true,
///                 showIcon: true,
///                 groupData: groupData,
///                 selectedData: data1,
///                 onCheck: (checkedItems) {},
///                 onIconPressed: (item) {},
///               );
/// ```
///
/// <img src="http://me.wozaihui.com/CheckList_single.png">
///
/// <img src="http://me.wozaihui.com/CheckList_group.png">
///
class CheckList extends StatefulWidget {
  final CheckType checkType;
  final String checkAllTitle;
  final String? icon;

  /// 分组多选数据
  final List<CheckListGroupData>? groupData;
  final Function(List<CheckListData> checkedData)? onCheck;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function(CheckListData item)? onIconPressed;
  final bool showIcon;

  /// 左边不显示分割线的间距
  final double indent;
  final EdgeInsets padding;
  final bool isCheckAll;
  final bool showCheckAll;
  final List<CheckListData> data;
  final List<CheckListData> selectedData;
  final Divider? divider;
  final Color? activeColor;

  CheckList({
    this.checkType = CheckType.multiple,
    this.checkAllTitle = '全部',
    this.groupData,
    this.onCheck,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onIconPressed,
    this.showIcon = false,
    this.icon,
    this.indent = 0.0,
    this.divider,
    this.activeColor,
    selectedData = const <CheckListData>[],
    showCheckAll = true,
    isCheckAll = false,
    padding,
    data = const [],
    Key? key,
  })  : data = groupData != null && groupData.isNotEmpty
            ? groupData.expand((item) => item.data).toList()
            : data,
        showCheckAll = checkType == CheckType.single ? false : showCheckAll,
        isCheckAll = checkType == CheckType.single ? false : isCheckAll,
        selectedData =
            (checkType == CheckType.single && selectedData.length > 1)
                ? [selectedData[0]]
                : (isCheckAll
                    ? selectedData = List<CheckListData>.from(data)
                    : selectedData),
        padding = padding ?? EdgeInsets.only(right: 10.0),
        super(key: key);

  @override
  createState() {
    return _CheckListState();
  }
}

class _CheckListState extends State<CheckList> {
  CheckListData _checkAllItem = CheckListData(id: 'checkAllItemId', title: '');
  List<CheckListData> _checkedData = [];
  bool _isCheckAll = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void didUpdateWidget(CheckList oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _initData();
    });
  }

  _initData() {
    _checkAllItem =
        CheckListData(id: 'checkAllItemId', title: widget.checkAllTitle);
    _checkedData = widget.selectedData;
    _isCheckAll = widget.isCheckAll ||
        (widget.data.isNotEmpty &&
            widget.data.length == widget.selectedData.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _renderCheckList(),
    );
  }

  List<Widget> _renderCheckList() {
    List<Widget> widgets = [];
    if (widget.showCheckAll) {
      widgets.add(
        Card(
          child: Container(
            padding: widget.padding,
            child: CheckListItem(
              widget.checkType,
              _checkAllItem,
              _onCheck,
              _isCheckAll ? [_checkAllItem] : <CheckListData>[],
              showIcon: false,
            ),
          ),
        ),
      );
      widgets.add(SizedBox(
        width: 0.0,
        height: 10.0,
      ));
    }
    if (widget.groupData != null && widget.groupData!.isNotEmpty) {
      widget.groupData?.forEach((item) {
        widgets.add(Container(
          padding: EdgeInsets.only(
            left: widget.padding.left + 16.0,
            right: widget.padding.right + 16.0,
          ),
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: item.titleStyle,
          ),
        ));
        widgets.add(
          Card(
            child: Container(
              padding: widget.padding,
              child: BorderGroup(
                  children: _renderCheckListItems(item.data),
                  divider: widget.divider,
                  indent: widget.indent),
            ),
          ),
        );
      });
    } else {
      widgets.add(
        Card(
          child: Container(
            padding: widget.padding,
            child: BorderGroup(
                children: _renderCheckListItems(widget.data),
                divider: widget.divider,
                indent: widget.indent),
          ),
        ),
      );
    }
    return widgets;
  }

  List<Widget> _renderCheckListItems(List data) {
    return data.map((item) {
      return CheckListItem(
        widget.checkType,
        item,
        _onCheck,
        _checkedData,
        icon: widget.icon,
        showIcon: widget.showIcon,
        onIconPressed: widget.onIconPressed,
        activeColor: widget.activeColor,
      );
    }).toList();
  }

  void _onCheck(bool? isChecked, CheckListData? item) {
    if (isChecked != null && item != null) {
      List<CheckListData> resultCheckListData = [];
      resultCheckListData.addAll(_checkedData);
      if (widget.checkType == CheckType.single) {
        resultCheckListData = [item];
      } else {
        if (isChecked) {
          if (item == _checkAllItem) {
            resultCheckListData.clear();
            resultCheckListData.addAll(widget.data);
          } else {
            resultCheckListData.add(item);
          }
        } else {
          if (item == _checkAllItem) {
            resultCheckListData.clear();
          } else {
            resultCheckListData.remove(item);
          }
        }
      }
      if (widget.onCheck != null) widget.onCheck!(resultCheckListData);
      setState(() {
        _checkedData = resultCheckListData;
        _isCheckAll = resultCheckListData.length == widget.data.length;
      });
    }
  }
}

class CheckListItem extends StatelessWidget {
  final CheckType checkType;
  final CheckListData? item;
  final Function(bool? isChecked, CheckListData? item) onCheck;
  final Function(CheckListData item)? onIconPressed;
  final List<CheckListData> checkedData;
  final CrossAxisAlignment crossAxisAlignment;
  final bool showIcon;
  final String? icon;
  final Color? activeColor;

  CheckListItem(
    this.checkType,
    this.item,
    this.onCheck,
    this.checkedData, {
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.showIcon = false,
    this.icon,
    this.onIconPressed,
    this.activeColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return SizedBox();
    } else {
      return InkWell(
        child: Container(
            padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
            child:
                Row(crossAxisAlignment: crossAxisAlignment, children: <Widget>[
              checkType == CheckType.single
                  ? Radio<CheckListData>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: item!,
                      groupValue:
                          checkedData.any((value) => value.id == item!.id)
                              ? item
                              : null,
                      onChanged: _onSingleCheck,
                      activeColor: activeColor,
                    )
                  : Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: checkedData.any((value) => value.id == item!.id),
                      onChanged: _onMultipleCheck,
                      activeColor: activeColor,
                    ),
              Flexible(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          item?.title == null || item?.title?.isEmpty == true
                              ? SizedBox()
                              : Expanded(
                                  flex: 1,
                                  child: Text(item?.title ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: item?.titleStyle)),
                          item?.subtitle == null ||
                                  item?.subtitle?.isEmpty == true
                              ? SizedBox()
                              : Container(
                                  margin: EdgeInsets.only(left: 8.0),
                                  child: Text(item?.subtitle ?? '',
                                      maxLines: 1, style: item?.subtitleStyle)),
                          showIcon && icon != null
                              ? Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: EdgeInsets.only(left: 8.0),
                                  child: IconButton(
                                      padding: EdgeInsets.all(0.0),
                                      icon: ImageIcon(AssetImage(icon!)),
                                      iconSize: 12.0,
                                      onPressed: onIconPressed != null
                                          ? onIconPressed!(item!)
                                          : () {}))
                              : SizedBox(),
                        ]),
                        SizedBox(
                          width: 0.0,
                          height: item?.title == null ||
                                  item?.title?.isEmpty == true ||
                                  item?.child == null
                              ? 0.0
                              : 8.0,
                        ),
                        Flexible(
                            flex: 1,
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(child: item?.child ?? SizedBox())
                                ]))
                      ]))
            ])),
        onTap: () {
          if (checkType == CheckType.single) {
            _onSingleCheck(item);
          } else {
            _onMultipleCheck(
                !checkedData.any((value) => value.id == item!.id));
          }
        },
      );
    }
  }

  void _onSingleCheck(CheckListData? item) {
    onCheck(true, item);
  }

  void _onMultipleCheck(bool? isChecked) {
    onCheck(isChecked, item);
  }
}
