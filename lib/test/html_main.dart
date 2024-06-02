import 'dart:html';

import 'package:quiver/strings.dart';
import 'package:tekartik_browser_utils/browser_utils_import.dart';

late App app;

void main() {
  app = App();
  app.main();
  //devPrint("Hi");
}

class App {
  late Element holder;

  void main() {
    holder = DivElement();
    final ul = UListElement();
    //document.body.append(holder);
    document.body!.querySelectorAll('a').forEach((Element element) {
      final anchorElement = element as AnchorElement;
      final href = anchorElement.href;
      var title = anchorElement.text;
      if (isEmpty(title)) {
        title = href;
      }

      final li = LIElement();

      final newAnchor = AnchorElement()
        // ignore: unsafe_html
        ..href = href
        ..text = title;
      li.append(newAnchor);
      ul.append(li);

      // remove ourself
      anchorElement.remove();
    });
    holder.append(ul);
    document.body!.append(holder);

    setHidden(document.body!, false);
  }
}
