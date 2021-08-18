var testMap = {
  'widget': 'Column',
  'children': [
    {
      'widget': 'Text',
      'xVar': {
        'data': '再惠合同续约提醒',
        'style': {
          'color': 'FF000000',
          'fontWeight': 'bold',
          'fontSize': 16.0
        }
      },
    },
    {
      'widget': 'Row',
      'children': [
        {
          'widget': 'Text',
          'xVar': {
            'data': '亲爱的商户',
            'style': {'color': 'FF9E9E9E', 'fontSize': 14.0}
          }
        },
        {
          'widget': 'RawMaterialButton',
          'child': {
            'widget': 'Text',
            'xVar': {
              'data': '加了个按钮',
              'style': {'color': 'FF4CAF50', 'fontSize': 14.0}
            }
          }
        },
      ]
    },
    {
      'widget': 'Text',
      'xVar': {
        'data': '您与再惠合作的服务即将到期，请尽快沟通续约事宜',
        'style': {'color': 'FF9E9E9E', 'fontSize': 14.0}
      },
    },
    {
      'widget': 'RawMaterialButton',
      'child': {
        'widget': 'Text',
        'xVar': {
          'data': '确认续约',
          'style': {'color': 'FF2196F3', 'fontSize': 16.0}
        },
      }
    },
  ]
};

var iconMap = {
  'widget': 'Row',
  'children': [
    {
      'widget': 'Icon',
      'xVar': {
        'icon': {
          'codePoint': '0xee29',
          'fontFamily': 'MaterialIcons',
        },
        'color': '0xFFDC143C',
        'size': 24.0,
      }
    }
  ]
};

var assetImageMap = {
  "widget": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "widget": "Asset",
    "name": "assets/vip.png"
  }
};

var networkImageMap = {
  "widget": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "network",
    "src": "https://b.appsimg.com/upload/momin/2019/01/23/101/1548249269085.png"
  }
};