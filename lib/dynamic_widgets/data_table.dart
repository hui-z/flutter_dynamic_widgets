import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class DataTableHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'DataTable';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var table = widget as DataTable?;
    if (table == null) return null;
    return {
      'widget': widgetName,
      'children': [],
      'xVar': {
        'dataRowHeight': table.dataRowHeight,
        'dataTextStyle': table.dataTextStyle,
        'headingRowHeight': table.headingRowHeight,
        'headingTextStyle': table.headingTextStyle,
        'horizontalMargin': table.horizontalMargin,
        'columnSpacing': table.columnSpacing,
        'dividerThickness': table.dividerThickness,
        'showBottomBorder': table.showBottomBorder,
        'rows': table.rows.map((e) => dataRowToMap(e, buildContext)).toList(),
        'columns':
            table.columns.map((e) => dataColumnToMap(e, buildContext)).toList(),
      },
      'xKey': table.key.toString()
    };
  }

  Map dataRowToMap(DataRow row, BuildContext? buildContext) {
    return {
      'cells': row.cells.map((e) => dataCellToMap(e, buildContext)).toList()
    };
  }

  Map dataCellToMap(DataCell cell, BuildContext? buildContext) {
    return {
      'child': DynamicWidgetBuilder.transformMap(cell.child, buildContext)
    };
  }

  Map dataColumnToMap(DataColumn column, BuildContext? buildContext) {
    return {
      'label': DynamicWidgetBuilder.transformMap(column.label, buildContext),
      'tooltip': column.tooltip,
      'numeric': column.numeric
    };
  }

  @override
  Type get widgetType => DataTable;
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
  DataTableConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [];
    List<DataColumn>? columns;
    if (widget.config?.xVar != null) {
      props = DataTableConfig.fromJson(widget.config?.xVar ?? {});
      props?.rows?.forEach((element) {
        List<DataCell> cells = [];
        element['cells']?.forEach((cell) {
          cells.add(DataCell(DynamicWidgetBuilder.buildWidget(
                  DynamicWidgetConfig.fromJson(cell['child']),
                  context: context) ??
              SizedBox()));
        });
        rows.add(DataRow(cells: cells));
      });
      columns = props?.columns
          ?.map((e) => DataColumn(
              label: DynamicWidgetBuilder.buildWidget(
                      DynamicWidgetConfig.fromJson(e['label']),
                      context: context) ??
                  SizedBox(),
              tooltip: e['tooltip'],
              numeric: e['numeric']))
          .toList();
    }
    return DataTable(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      rows: rows,
      columns: columns ?? [],
      dataRowHeight: props?.dataRowHeight,
      dataTextStyle: props?.dataTextStyle,
      headingRowHeight: props?.headingRowHeight,
      headingTextStyle: props?.headingTextStyle,
      horizontalMargin: props?.horizontalMargin,
      columnSpacing: props?.columnSpacing,
      dividerThickness: props?.dividerThickness,
      showBottomBorder: props?.showBottomBorder ?? false,
    );
  }
}

class DataTableConfig {
  late double? dataRowHeight;
  late TextStyle? dataTextStyle;
  late double? headingRowHeight;
  late TextStyle? headingTextStyle;
  late double? horizontalMargin;
  late double? columnSpacing;
  late double? dividerThickness;
  late bool? showBottomBorder;
  late List<Map>? rows;
  late List<Map>? columns;

  DataTableConfig.fromJson(Map<dynamic, dynamic> json) {
    this.dataRowHeight = json['dataRowHeight'];
    this.dataTextStyle =
        DynamicWidgetUtils.adapt<TextStyle>(json['dataTextStyle']);
    this.headingRowHeight = json['dataTextStyle'];
    this.headingTextStyle =
        DynamicWidgetUtils.adapt<TextStyle>(json['headingTextStyle']);
    this.horizontalMargin = json['horizontalMargin'];
    this.dividerThickness = json['dividerThickness'];
    this.columnSpacing = json['columnSpacing'];
    this.showBottomBorder = json['showBottomBorder'];
    this.rows = json['rows']?.cast<Map>();
    this.columns = json['columns']?.cast<Map>();
  }
}
