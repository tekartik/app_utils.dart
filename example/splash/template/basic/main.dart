import 'package:web/web.dart' as web;

final output = web.document.getElementById('output') as web.HTMLPreElement;

void message(String msg) {
  output.textContent = '${output.textContent}$msg\n';
}

void main() {
  message('hi');
}
