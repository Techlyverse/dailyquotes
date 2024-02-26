// import 'package:flutter/material.dart';

// class ThemeCard extends StatefulWidget {
//   @override
//   State<ThemeCard> createState() => _ThemeCardState();
// }

// class _ThemeCardState extends State<ThemeCard> {
//   List<String> imagePath = [
//     "assets/images/nature.jpg",
//     "assets/images/plant.jpg",
//     "assets/images/plant2.jpg",
//     "assets/images/sky.jpg",
//   ];
//   int selectedBackgroundIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
        
//         body: Column(children: [
//           const Text('Themes'),
//           Wrap(
//               spacing: 10.0,
//               runSpacing: 10.0,
//               children: List.generate(
//                 imagePath.length,
//                 (index) => GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedBackgroundIndex = index;
//                     });
//                     Navigator.pop(context, imagePath[index]);
//                   },
//                   child: Card(
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Image.asset(
//                         imagePath[index],
//                         height: 150,
//                         width: 120,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ))
//         ]));
//   }
// }
