import 'package:flutter/material.dart';

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
        'color': 'FFDC143C',
        'size': 24.0,
      }
    }
  ]
};

var assetImageMap = {
  'widget': 'Container',
  'xVar': {
    'color': 'FFFFFFFF',
    'alignment': 'center',
    },
  "child": {
    'widget': 'Image',
    'xVar': {
      'src': 'assets/testImage.png'
      }
    }
};

var networkImageMap = {
  'widget': 'Container',
  'xVar': {
    'color': 'FFFFFFFF',
    'alignment': 'center',
  },
  "child": {
    'widget': 'Image',
    'xVar': {
      'type':'network',
      'src': 'https://tse1-mm.cn.bing.net/th/id/R-C.1e8c3682052056c8d9d2c30e4bd04bb6?rik=%2bg047CDQ%2fUf7fw&riu=http%3a%2f%2fbpic.588ku.com%2felement_pic%2f00%2f95%2f28%2f9056f2ddb6b568b.jpg&ehk=rYxc0Ex1D3fS57uTqX%2fxSZMU43jkl%2bSXIfxqDjcqPQ8%3d&risl=&pid=ImgRaw&r=0'
    }
  }
};