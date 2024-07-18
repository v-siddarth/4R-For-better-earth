// import 'package:flutter/material.dart';

// // String uri = 'http:// 192.168.1.4:3000'; //added my ip//mumbai
// // String uri = 'http:// 192.168.56.1:3000'; //added my ip
// // String uri = 'http:// fe80::179:f333:3478:d36d%11:3000';
// String uri = 'http:// 192.168.1.1:3000';

// class GlobalVariables {
//   // COLORS
//   static const appBarGradient = LinearGradient(
//     colors: [
//       Color.fromARGB(255, 231, 11, 11),
//       Color.fromARGB(255, 222, 98, 10),
//     ],
//     stops: [0.5, 1.0],
//   );

//   static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
//   static const backgroundColor = Colors.white;
//   static const Color greyBackgroundCOlor = Color(0xffebecee);
//   static var selectedNavBarColor = Colors.cyan[800]!;
//   static const unselectedNavBarColor = Colors.black87;

//   // STATIC IMAGES
//   static const List<String> carouselImages = [
//     'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
//     'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
//     'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
//     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
//     'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
//   ];

//   static const List<Map<String, String>> categoryImages = [
//     {
//       'title': 'Mobiles',
//       'image': 'assets/images/mobiles.jpeg',
//     },
//     {
//       'title': 'Essentials',
//       'image': 'assets/images/essentials.jpeg',
//     },
//     {
//       'title': 'Appliances',
//       'image': 'assets/images/appliances.jpeg',
//     },
//     {
//       'title': 'Books',
//       'image': 'assets/images/books.jpeg',
//     },
//     {
//       'title': 'Fashion',
//       'image': 'assets/images/fashion.jpeg',
//     },
//   ];
// }

//new code

import 'package:flutter/material.dart';

// String uri = 'http://192.168.1.7:3000';
// String uri = 'http://localhost:3000';
String uri = 'http://192.168.1.7:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 225, 41, 13),
      Color.fromARGB(255, 213, 114, 38),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color.fromARGB(255, 250, 236, 236);
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 231, 223, 223);
  static var selectedNavBarColor = Colors.red[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Om2PRvdtcu-4hYMOv4Qv_i2dHZenOZ-0Mg&usqp=CAU', //Reuse
    'https://media.istockphoto.com/id/1367291255/photo/kraft-paper-cut-of-reuse-reduce-recycle-symbol-and-text-on-green-grass-background.jpg?b=1&s=170667a&w=0&k=20&c=v-DoAWMqQaqe-f-BJZCkkIZaMwoUHGM0sWsVkLNW9vY=', //RRR
    'https://c8.alamy.com/comp/2CC3NXG/same-jar-reused-for-different-contents-recycled-text-on-cardboard-background-reduce-waste-by-recycling-and-reusing-for-environmental-sustainable-liv-2CC3NXG.jpg' //Recycle
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Plastic',
      'image': 'assets/images/Plastic.jpg',
    },
    {
      'title': 'Household',
      'image': 'assets/images/Household.jpg',
    },
    {
      'title': 'E-Waste',
      'image': 'assets/images/E-Waste.jpg',
    },
    // {
    //   'title': 'Water',
    //   'image': 'assets/images/Industrial.jpg',
    // },
    {
      'title': 'Metal',
      'image': 'assets/images/Metal.jpg',
    },
    {
      'title': 'Fabric',
      'image': 'assets/images/Fabric.jpg',
    },
  ];
}
