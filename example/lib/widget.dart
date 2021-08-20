import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';

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
