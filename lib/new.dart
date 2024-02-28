// import 'package:dailyquotes/change_theme.dart';
// import 'package:dailyquotes/design.dart';
// import 'package:dailyquotes/firebase_options.dart';
// import 'package:dailyquotes/setting.dart';
// import 'package:dailyquotes/themecard.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// String selectedImagePath = "";
// String backgroundImage = "assets/images/blue.jpg";
// String imagePath="";



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Quotes App',
//       theme: darkTheme(),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String author = " ";
//   String quote = '';
//   int _currentPage = 0;
//   final List<String> _texts = ["Text 1", "Text 2", "Text 3"];

//   bool liked = false;
//   void _toggleLike() {
//     setState(() {
//       liked = !liked;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _loadBackgroundImage();
//   }

//   void _loadBackgroundImage() async {
//     final prefs = await SharedPreferences.getInstance();

//     setState(() {
//       backgroundImage =   prefs.getString('myImage') ?? "assets/images/blue.jpg";
//     });
//   }

 


    
    

// List<DocumentSnapshot> quotes = [];

//   //   final quotesCollection = FirebaseFirestore.instance.collection('quotes');

//   //   final documentSnapshot = await quotesCollection.get();

//   //   if (documentSnapshot.docs.isNotEmpty) {
//   //     for (var ds in documentSnapshot.docs) {
//   //       var data = ds.data();

//   //       print(data);
//   //     }
//   //   } else {
//   //     print("No document found!");
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//         body: GestureDetector(
//       onHorizontalDragEnd: (details) {
//         if (details.primaryVelocity! > 0) {
//           if (_currentPage > 0) {
//             setState(() {
//               _currentPage--;
//             });
//           }
//         } else if (details.primaryVelocity! < 0) {
//           if (_currentPage < _texts.length - 1) {
//             setState(() {
//               _currentPage++;
//             });
//           }
//         }
//       },
//       child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('quotes').snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return  Center(child: Text("An error occurred"));
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return  Center(child: CircularProgressIndicator());
//             }
//         else {
//         quotes = snapshot.data!.docs;
//         //  quotes.clear();
        
//         //   var data = doc.data() as Map<String,dynamic>;
//         //   quotes=data;
//         //   if (data != null && data.containsKey('quotes')) {
//         //     print(data);
//         //   quotes.add(data['quote']);
//         //   }
//         //   else{
//         //     print(data);
//         //   }
         
        
      
//       return PageView.builder(
//           itemCount: quotes.length,
//           itemBuilder: (context, index) {
            
//             return Center(
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration:BoxDecoration(
//                        image: DecorationImage(
//                        image:
//                            AssetImage(backgroundImage),
                      
                         
//                       fit: BoxFit.cover,
//                     )
//                     ),
//                   ),
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 10),
//                           child: Text(
//                             quotes[index]['quotes'],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 24.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 200),
//                           child: Text(quotes[index]['author'],
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w500)),
//                         ),
//                         const SizedBox(
//                           height: 200,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   Share.share('$quote - $author');
//                                 },
//                                 icon: const Icon(
//                                   Icons.ios_share,
//                                   color: Colors.black,
//                                 )),
//                             const SizedBox(
//                               width: 30,
//                             ),
//                             IconButton(
//                               onPressed: _toggleLike,
//                               icon: Icon(
//                                 liked ? Icons.favorite : Icons.favorite_border,
//                                 color: liked ? Colors.red : Colors.black,
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               height: 40,
//                               width: 200,
//                               child: ElevatedButton.icon(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10.0)),
//                                     elevation: 5.0,
//                                   ),
//                                   label: const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Inspirational",
//                                     ),
//                                   ),
//                                   icon: const Icon(Icons.category_outlined)),
//                             ),
//                             const SizedBox(
//                               width: 40,
//                             ),
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(11),
//                                   color: Colors.black),
//                               child: IconButton(
//                                   onPressed: ()  {

//                                     showModalBottomSheet<void>(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return theme(onDismiss:updateUIAfterBottomSheetDismiss);
//                                       },
//                                     );
                                    
//                                     // if (selectedImagePath != null) {
//                                     //   setState(() {
//                                     //     backgroundImage = selectedImagePath;
//                                     //   });
//                                     //   SharedPreferences prefs =
//                                     //       await SharedPreferences.getInstance();
//                                     //   prefs.setString(
//                                     //       'backgroundImage', selectedImagePath);
//                                   },
//                                   icon: const Icon(Icons.format_paint,
//                                       color: Colors.deepPurpleAccent)),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(11),
//                                   color: Colors.black),
//                               child: IconButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 SettingScreen()));
//                                   },
//                                   icon: const Icon(
//                                     Icons.settings,
//                                     color: Colors.deepPurpleAccent,
//                                   )),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           );

//           }
//     }  ),
//     ));
//   }
//     void updateUIAfterBottomSheetDismiss() {
// setState(() {

// });
//   }
// }