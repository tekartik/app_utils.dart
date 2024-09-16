import 'package:web/web.dart';

class PreOutput {
  PreOutput({String? id, HTMLPreElement? preElement}) {
    if (preElement != null) {
      _pre = preElement;
    } else {
      if (id!.startsWith('#')) {
        id = id.substring(1);
      }
      _pre = document.querySelector('#$id') as HTMLPreElement;
    }
  }

  late HTMLPreElement _pre;

  void write(Object msg) {
    _pre.text = '${_pre.textContent ?? ''}$msg';
  }

  void writeln(Object msg) {
    _pre.text = '${_pre.textContent ?? ''}$msg\n';
  }

  void clear() {
    _pre.text = '';
  }
}
