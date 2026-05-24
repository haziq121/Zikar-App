import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikar_app/Zikar_Provider.dart';
import 'Zikar_Count_Screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ZikarProvider(),
      child: MaterialApp(home: HomeScreen()),
    ),
  );
}

class Zikar {
  final String id;
  final String title;
  final String arabic;
  final int target;
  Zikar({
    required this.id,
    required this.title,
    required this.arabic,
    required this.target,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
   @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ZikarProvider>(context);
  // final List<Zikar> azkar = [
  //   Zikar(
  //     id: "1",
  //     title: "Tasbeeh",
  //     arabic: "سُبْحَانَ ٱللَّٰهِ",
  //     target: 33,
  //   ),
  //   Zikar(
  //     id: "2",
  //     title: "Tasbeeh",
  //     arabic: "ٱلْحَمْدُ لِلَّٰهِ",
  //     target: 33,
  //   ),
  //   Zikar(
  //     id: "3",
  //     title: "Tasbeeh",
  //     arabic: "أَسْتَغْفِرُ ٱللَّٰهَ",
  //     target: 100,
  //   ),
  //   Zikar(
  //     id: "4",
  //     title: "Tasbeeh",
  //     arabic: "أَسْتَغْفِرُ ٱللَّٰهَ",
  //     target: 100,
  //   ),
  // ];
  void addZikar() {
    final titlecontroller = TextEditingController();
    final arabiccontroller = TextEditingController();
    final targetcontroller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add new zikar"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titlecontroller,
                decoration: InputDecoration(labelText: "Zikar Title"),
              ),
              TextField(
                controller: arabiccontroller,
                decoration: InputDecoration(labelText: "Arabic name"),
              ),
              TextField(
                controller: targetcontroller,
                decoration: InputDecoration(labelText: "set target"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  provider.addZikar(
                    Zikar(
                      id: DateTime.now().toString(),
                      title: titlecontroller.text,
                      arabic: arabiccontroller.text,
                      target: int.parse(targetcontroller.text),
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text("add"),
            ),
          ],
        );
      },
    );
  }

 
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 212, 87),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 231, 179),
        title: Text("Zikar", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Zikar & Tasbeeh"),
            FloatingActionButton(onPressed: addZikar, child: Icon(Icons.add)),
            Expanded(
              child: ListView.builder(
                itemCount: provider.azkar.length,
                itemBuilder: (context, index) {
                  final zikar = provider.azkar[index];
                  return Card(
                    child: ListTile(
                      title: Text(zikar.title),
                      subtitle: Text(
                        "${zikar.arabic}| Target : ${zikar.target}",
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ZikarCountScreen(zikar: zikar),
                          ),
                        );
                      },

                      // trailing: IconButton(onPressed: onPressed, icon: icon),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(home: HomeScreen()));
// }

// class Zikar {
//   final String Title;
//   final String Arabic;
//   final int Target;
//   Zikar({required this.Title, required this.Arabic, required this.Target});
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeScreen();
//   }
// }

// class _HomeScreen extends State {
//   final List<Zikar> azkar = [
//     Zikar(Title: "Tasbeeh", Arabic: "ٱلْحَمْدُ لِلَّٰهِ", Target: 33),
//     Zikar(Title: "Tasbeeh", Arabic: "أَسْتَغْفِرُ ٱللَّٰهَ", Target: 100),
//     Zikar(Title: "Tasbeeh", Arabic: "أَسْتَغْفِرُ ٱللَّٰهَ", Target: 100),
//   ];
//   void _addZikar() {
//     final Titlecontroller = TextEditingController();
//     final Arabiccontroller = TextEditingController();
//     final Targetcontroller = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Click ere"),
//           content: Column(
//             children: [
//               TextField(
//                 controller: Titlecontroller,
//                 decoration: InputDecoration(labelText: ""),
//               ),
//               TextField(
//                 controller: Arabiccontroller,
//                 decoration: InputDecoration(labelText: ""),
//               ),
//               TextField(
//                 controller: Targetcontroller,
//                 decoration: InputDecoration(labelText: ""),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("data"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   azkar.add(
//                     Zikar(
//                       Title: Titlecontroller.text,
//                       Arabic: Arabiccontroller.text,
//                       Target: int.parse(Targetcontroller.text),
//                     ),
//                   );
//                   Navigator.pop(context);
//                 });
//               },
//               child: Text("data"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
