import 'package:flutter/material.dart';
import 'package:zikar_app/main.dart';

class ZikarProvider extends ChangeNotifier {
  final List<Zikar> azkar = [
    Zikar(
      id: DateTime.now().millisecond.toString(),
      title: "Tasbeeh",
      arabic: "سُبْحَانَ ٱللَّٰهِ",
      target: 33,
    ),
    Zikar(id: "2", title: "Tasbeeh", arabic: "ٱلْحَمْدُ لِلَّٰهِ", target: 33),
    Zikar(
      id: "3",
      title: "Tasbeeh",
      arabic: "أَسْتَغْفِرُ ٱللَّٰهَ",
      target: 100,
    ),
    Zikar(
      id: "4",
      title: "Tasbeeh",
      arabic: "أَسْتَغْفِرُ ٱللَّٰهَ",
      target: 100,
    ),
  ];
  void addZikar(Zikar zikar) {
    azkar.add(zikar);
    notifyListeners();
  }
}
