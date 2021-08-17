var testMap = {
  'widget': 'Column',
  'propsList': [
    {
      'widget': 'Text',
      'xVar': {
        'data': '再惠合同续约提醒',
        'style': {
          'color': '0xFF000000',
          'fontWeight': 'bold',
          'fontSize': 16.0
        }
      },
    },
    {
      'widget': 'Row',
      'propsList': [
        {
          'widget': 'Text',
          'xVar': {
            'data': '亲爱的商户',
            'style': {'color': '0xFF9E9E9E', 'fontSize': 14.0}
          }
        },
        {
          'widget': 'RawMaterialButton',
          'propsMap': {
            'widget': 'Text',
            'xVar': {
              'data': '加了个按钮',
              'style': {'color': '0xFF4CAF50', 'fontSize': 14.0}
            }
          }
        },
      ]
    },
    {
      'widget': 'Text',
      'xVar': {
        'data': '您与再惠合作的服务即将到期，请尽快沟通续约事宜',
        'style': {'color': '0xFF9E9E9E', 'fontSize': 14.0}
      },
    },
    {
      'widget': 'RawMaterialButton',
      'propsMap': {
        'widget': 'Text',
        'xVar': {
          'data': '确认续约',
          'style': {'color': '0xFF2196F3', 'fontSize': 16.0}
        },
      }
    },
  ]
};

var iconMap = {
  'widget': 'Row',
  'propsList': [
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
