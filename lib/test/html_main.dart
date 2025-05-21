import 'package:web/web.dart';

late App app;

void main() {
  app = App();
  app.main();
  //devPrint("Hi");
}

class App {
  late Element holder;

  void main() {
    holder = HTMLDivElement();
    final ul = HTMLUListElement();
    //document.body.append(holder);
    var nodeList = document.body!.querySelectorAll('a');
    for (var i = 0; i < nodeList.length; i++) {
      var element = nodeList.item(i);

      final anchorElement = element as HTMLAnchorElement;
      final href = anchorElement.href;
      var title = anchorElement.text;
      if (title.isEmpty) {
        title = href;
      }

      final li = HTMLLIElement();

      final newAnchor =
          HTMLAnchorElement()
            // ignore: unsafe_html
            ..href = href
            ..text = title;
      li.append(newAnchor);
      ul.append(li);

      // remove ourself
      anchorElement.remove();
    }
    holder.append(ul);
    document.body!.append(holder);

    document.body!.hidden = null;
  }
}
