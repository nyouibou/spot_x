// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:music_app/core/constants/color.dart';
// import 'package:music_app/core/constants/texts.dart';

// class CustomListedSongs extends StatefulWidget {
//   const CustomListedSongs({super.key});

//   @override
//   State<CustomListedSongs> createState() => _CustomListedSongsState();
// }

// class _CustomListedSongsState extends State<CustomListedSongs> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(children: [
//           Container(
//             height: MediaQuery.sizeOf(context).height / 2.8,
//             // width: MediaQuery.sizeOf(context).width / 5,
//             decoration: BoxDecoration(
//                 boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 50)],
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         "https://www.liveclefs.com/wp-content/uploads/2024/05/Pradeep-Kumar.jpg"),
//                     fit: BoxFit.cover)),
//           ),
//           Positioned(
//             bottom: 30,
//             left: 18,
//             child: Text(
//               "phenomenal Pradeep Kumar",
//               style: MytextStyle.customWhiteHeadings,
//             ),
//           ),
//           Positioned(
//             left: 7,
//             top: 10,
            // child: CircleAvatar(
            //   radius: 25,
            //   backgroundColor: Colors.transparent,
            //   child: IconButton(
            //       color: ColorConstants.customWhite,
            //       onPressed: () {},
            //       icon: Icon(
            //         Icons.arrow_back,
            //         size: 30,
            //       )),
            // ),
//           )
//         ]),
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }
// }
