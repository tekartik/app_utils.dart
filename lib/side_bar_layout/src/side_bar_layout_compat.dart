@Deprecated('Do not use')
library;
// ignore_for_file: deprecated_member_use

import 'dart:html';

class SideBarLayout {
  late Element _element;

  SideBarLayout([Element? element]) {
    element ??= querySelector('#wrapper');

    _element = element!;
  }

  void showMenu() {
    //$('#menu-toggle').click(function(e) {
    //e.preventDefault();
    _element.classes.remove('toggled');
    _element.classes.add('show'); //toggleClass('toggled');
  }

  void reset() {
    //$('#menu-toggle').click(function(e) {
    //e.preventDefault();
    _element.classes.remove('toggled');
    _element.classes.remove('show');
    //querySelector('#wrapper').classes.remove('toggled'); //toggleClass('toggled');
  }

  void toggle() {
    //$('#menu-toggle').click(function(e) {
    //e.preventDefault();
    _element.classes.remove('show');
    _element.classes.toggle('toggled');
    //querySelector('#wrapper').classes.remove('toggled'); //toggleClass('toggled');
  }
}
