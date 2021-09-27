import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';
import 'package:flutter_dynamic_widgets/custom_widget/expansion_tile.dart';

var tableData = DataTable(columns: [
  DataColumn(label: Text('姓名')),
  DataColumn(label: Text('年龄')),
], rows: [
  DataRow(cells: [
    DataCell(Text('老孟')),
    DataCell(Text('18')),
  ]),
]);

var wrap = Wrap(
  spacing: 8.0, // 主轴(水平)方向间距
  runSpacing: 4.0, // 纵轴（垂直）方向间距
  alignment: WrapAlignment.center, //沿主轴方向居中
  children: <Widget>[
    Text('Hamilton'),
    Text('Lafayette'),
    Text('Mulligan'),
    Text('Laurens'),
  ],
);

var data1 = [
  CheckListData(id: '1', title: 'A'),
  CheckListData(id: '2', title: 'B'),
  CheckListData(id: '3', title: 'c')
];

var data2 = [
  CheckListData(id: '4', title: 'A'),
  CheckListData(id: '5', title: 'B'),
  CheckListData(id: '6', title: 'c')
];

var groupData = [
  CheckListGroupData('1 组', data1, null),
  CheckListGroupData('2 组', data2, null)
];

var checkList1 = CheckList(
  checkType: CheckType.single,
  showIcon: true,
  data: data1,
  selectedData: data1,
  onCheck: (checkedItems) {},
  onIconPressed: (item) {},
);

var checkList2 = CheckList(
  checkType: CheckType.multiple,
  isCheckAll: false,
  showCheckAll: true,
  showIcon: true,
  groupData: groupData,
  selectedData: data1,
  onCheck: (checkedItems) {},
  onIconPressed: (item) {},
);

var expand = CustomExpansionTile(
    topMargin: 20,
    leading: Text('收缩列表'),
    title: Text(''),
    initiallyExpanded: true,
    backgroundColor: Colors.white,
    onExpansionChanged: (isOn) {},
    children: [
      Text('1'),
      Text('2'),
      Text('3'),
      Text('4'),
      Text('5'),
      Text('6'),
    ]);

var textField = Container(
  padding: EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Color(0xFFF4F4F4),
  ),
  height: 100,
  child: TextField(
    maxLines: null,
    autocorrect: false,
    textAlign: TextAlign.left,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: '请输入',
      hintStyle:
      TextStyle(fontSize: 16, color: Color(0xFFC7C7C7)),
      contentPadding: EdgeInsets.only(
        top: 16,
        right: 16,
      ),
    ),
    style: TextStyle(
        fontSize: 16, color: Color(0xFF1E1E1E)),
  ),

);