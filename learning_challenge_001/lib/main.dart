import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Challenge001()
    )
  );
}

class Challenge001 extends StatefulWidget {
  const Challenge001({super.key});   

  @override
  State<Challenge001> createState() => _Challenge001State();
}

class _Challenge001State extends State<Challenge001> {
  List<String> items = [
    "Apples",
    "Oranges",
    "Milk",
    "Bacon",
    "Eggs",
  ];

  int count = 1;

// final void Function() addItem = () => print("Clicked");

  void addItem() {
    setState(() { // Call setState to update the state and trigger a rebuild
      items.add("New Item $count");
      count++;
    });
  }

  void clearList() {
    setState((){
      items.clear();
      count = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Challenge 1',
            style: TextStyle(color: Color.fromARGB(153, 106, 33, 121)),
          ),
          leading: const Icon(
            Icons.menu,
            color: Color.fromARGB(192, 255, 255, 255),
          ),
          backgroundColor: const Color.fromARGB(255, 116, 138, 124),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(4.0),
                  title: Text(
                    items[index],
                    textAlign: TextAlign.center,
                  ),
                  tileColor: const Color.fromARGB(155, 96, 125, 139),
                  minVerticalPadding: 4.0,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 5);
              },
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: clearList,
              child: Text('Clear'),
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              onPressed: addItem,
              child: const Icon(Icons.add, size: 20.0),
            ),
          ],
        ),
      );
  }
}



// class Challenge001 extends StatelessElement {
//   Challenge001({super.key});

//   final List<String> items = <String>["Apples", "Oranges", "Milk", "Bacon", "Eggs"];

//   @override
//   Widget build() {
//     return MaterialApp(
//     home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Challenge 1', 
//             style: TextStyle(color: const Color.fromARGB(153, 106, 33, 121))
//           ), 
//           leading: Icon(
//             Icons.menu, 
//             color: const Color.fromARGB(192, 255, 255, 255),
//           ),
//           backgroundColor: const Color.fromARGB(255, 116, 138, 124),
//         ),
//         body: Center(
//           child: Padding(
//       padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//       child: ListView.separated(
//         padding: EdgeInsets.symmetric(vertical: 4.0),
//         itemCount: items.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             contentPadding: EdgeInsets.all(4.0),
//             title: Text(items[index], textAlign: TextAlign.center,), 
//             tileColor: const Color.fromARGB(155, 96, 125, 139),
//             minVerticalPadding: 4.0,
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const SizedBox(height: 5);
//         },
//       ),
//     ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){},
//           child: Icon(Icons.add, size: 20.0,),
//         ),
//       )
//     )
//   }
// }
