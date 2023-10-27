import 'dart:collection';

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int id;
  final String text;
  EntryItem(this.id, this.text);

  @override
  String toString() {
    return '$id : $text';
  }
}
