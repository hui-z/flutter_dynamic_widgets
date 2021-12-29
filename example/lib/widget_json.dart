var containerMap = {
  'widget': 'Container',
  'child': {
    'widget': 'Text',
    'xVar': {
      'data': 'dynamic widget',
      'maxLines': 3,
      'overflow': 'ellipsis',
      'style': {'color': 'FF00FFFF', 'fontSize': 20.0}
    }
  },
  'xVar': {
    "alignment": "center",
    'decoration': {
      'gradient': {
        'type': 'linear',
        'colors': ["ffff5b02", "FF42A5F5"],
        'begin': 'topCenter',
        'end': 'bottomCenter'
      }
    }
  }
};

var rowMap = {
  'widget': 'Row',
  'xVar': {
    'crossAxisAlignment': 'start',
    'mainAxisAlignment': 'start',
    'mainAxisSize': 'max',
    'textBaseline': 'alphabetic',
    'textDirection': 'ltr',
    'verticalDirection': 'down',
  },
  'children': [
    {
      'widget': 'Text',
      'xVar': {'data': 'Flutter'}
    },
    {
      'widget': 'RawMaterialButton',
      'xVar': {
        'fillColor': 'FFFF00FF',
      },
      'child': {
        'widget': 'Text',
        'xVar': {'data': 'Widget'}
      }
    },
    {
      'widget': 'Text',
      'xVar': {'data': 'Demo'}
    }
  ]
};

var columnMap = {
  'widget': 'Column',
  'xVar': {
    'crossAxisAlignment': 'start',
    'mainAxisAlignment': 'start',
    'mainAxisSize': 'max',
    'textBaseline': 'alphabetic',
    'textDirection': 'ltr',
    'verticalDirection': 'down'
  },
  'children': [
    {
      'widget': 'Text',
      'xVar': {'data': 'Flutter'}
    },
    {
      'widget': 'RawMaterialButton',
      'xVar': {
        'fillColor': 'FFFF00FF',
      },
      'child': {
        'widget': 'Text',
        'xVar': {'data': 'Widget'}
      }
    },
    {
      'widget': 'Text',
      'xVar': {'data': 'Demo'}
    }
  ]
};

var textMap = {
  'widget': 'Container',
  'xVar': {
    'color': 'FFFF00FF',
    'alignment': 'center',
  },
  'child': {
    'widget': 'Text',
    'xVar': {
      'data': 'dynamic widget',
      'maxLines': 3,
      'overflow': 'ellipsis',
      'style': {
        'color': 'FF00FFFF',
        'fontSize': 20.0,
        'fontWeight': 'w900',
        'decoration': 'underline'
      }
    }
  }
};

var iconMap = {
  'widget': 'Row',
  'xVar': {
    'mainAxisAlignment': 'spaceAround',
  },
  'children': [
    {
      'widget': 'Icon',
      'xVar': {
        'icon': {
          'codePoint': '0xe038',
        },
        'color': 'FF000000',
        'size': 36.0
      }
    },
    {
      'widget': 'Icon',
      'xVar': {
        'icon': {
          'codePoint': '0xe25b',
        },
        'color': 'FFFFC0CB',
        'size': 24.0,
        'semanticLabel': 'Text to announce in accessibility modes'
      }
    },
    {
      'widget': 'Icon',
      'xVar': {
        'icon': {
          'codePoint': '0xe0b6',
        },
        'color': 'FF008000',
        'size': 30.0
      }
    },
    {
      'widget': 'Icon',
      'xVar': {
        'icon': {
          'codePoint': '0xe0d6',
        },
        'color': 'FF0000FF',
        'size': 36.0
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
    'xVar': {'src': 'assets/testImage.png'}
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
      'type': 'network',
      'src':
          'https://tse1-mm.cn.bing.net/th/id/R-C.1e8c3682052056c8d9d2c30e4bd04bb6?rik=%2bg047CDQ%2fUf7fw&riu=http%3a%2f%2fbpic.588ku.com%2felement_pic%2f00%2f95%2f28%2f9056f2ddb6b568b.jpg&ehk=rYxc0Ex1D3fS57uTqX%2fxSZMU43jkl%2bSXIfxqDjcqPQ8%3d&risl=&pid=ImgRaw&r=0'
    }
  }
};

var listViewMap = {
  'widget': 'ListView',
  'xVar': {
    'padding': {
      'left': 10,
      'top': 10,
      'right': 10,
      'bottom': 10,
    }
  },
  'children': [
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    }
  ]
};

var indexedStackMap = {
  'widget': 'IndexedStack',
  'xVar': {
    'alignment': 'topLeft',
    'index': 1,
  },
  'children': [
    {
      'widget': 'Image',
      'xVar': {'src': 'assets/testImage.png'}
    },
    {
      'widget': 'Container',
      // 'xVar': {
      //   'top': 50.0,
      //   'left': 50.0,
      // },
      'child': {
        'widget': 'Image',
        'xVar': {'src': 'assets/testImage.png'}
      }
    }
  ]
};
var sizedBoxMap = {
  'widget': 'Stack',
  'xVar': {
    'alignment': 'topLeft',
  },
  'children': [
    {
      'widget': 'SizedBox',
      'xVar': {
        'width': 400.0,
        'height': 400.0,
      },
      'child': {
        'widget': 'Container',
        'xVar': {'color': 'FF0000FF'}
      }
    },
    {
      'widget': 'SizedBox',
      'xVar': {
        'width': 100.0,
        'height': 100.0,
      },
      'child': {
        'widget': 'Container',
        'xVar': {'color': 'FFCC00FF'}
      }
    }
  ]
};

var inputItemPhoneMap = {
  'widget': 'ListInputItem',
  'xVar': {
    'title': '手机号',
    'placeholder': '请输入手机号',
    'obscureText': false,
    'isHideDivider': true,
  },
};

var inputItemPassWordMap = {
  'widget': 'ListInputItem',
  'xVar': {
    'title': '密码',
    'placeholder': '请输入密码',
    'obscureText': true,
    'isHideDivider': true,
  },
};

var loginMap = {
  'widget': 'Column',
  'children': [inputItemPhoneMap, inputItemPassWordMap]
};

var inkWellMap = {
  'widget': 'InkWell',
  'child': {
    'widget': 'Container',
    'xVar': {
      'color': 'FF2196F3',
      'width': 50.0,
      'height': 50.0,
    },
  },
  'eventName': 'onLongPress'
};

var richTextMap = {
  'widget': 'RichText',
  'xVar': {
    'text': {
      'children': [
        {
          'text': '强强',
          'style': {'color': 'FF8B0016'},
        },
        {
          'text': ',',
        },
        {
          'text': '一个有态度的程序员',
          'style': {'color': 'FF000000'},
        }
      ]
    },
  }
};

var testMap = {
  'widget': 'Column',
  'children': [
    {
      'widget': 'Text',
      'xVar': {
        'data': '再惠合同续约提醒',
        'style': {'color': 'FF000000', 'fontWeight': 'bold', 'fontSize': 16.0}
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

var test2Map = {
  'widget': 'Card',
  'xVar': {
    'color': 'FFFFFFFF',
    'elevation': 20.0,
    'shape': {
      'type': 'RoundedRectangleBorder',
      'borderRadius': {
        'topLeft': 20.0,
        'topRight': 20.0,
        'bottomLeft': 20.0,
        'bottomRight': 20.0,
      },
    },
    'clipBehavior': 'antiAlias',
  },
  'child': {
    'widget': 'Column',
    'xVar': {
      'crossAxisAlignment': 'start',
    },
    'children': {
      {
        'widget': 'Text',
        'xVar': {'data': 'Flutter'}
      },
    }
  },
};
