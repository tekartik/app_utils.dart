import 'dart:html';

class PreOutput {
  PreOutput({String? id, PreElement? preElement}) {
    if (preElement != null) {
      _pre = preElement;
    } else {
      if (id!.startsWith('#')) {
        id = id.substring(1);
      }
      _pre ??= querySelector('#$id') as PreElement?;
    }
  }

  PreElement? _pre;

  void write(Object msg) {
    _pre!.text = '${_pre!.text}$msg';
  }

  void writeln(Object msg) {
    _pre!.text = '${_pre!.text}$msg\n';
  }

  void clear() {
    _pre!.text = '';
  }
}
