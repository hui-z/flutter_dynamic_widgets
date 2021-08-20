import 'package:flutter/material.dart';

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