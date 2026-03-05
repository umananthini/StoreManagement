
// import 'package:flutter/material.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/PAGES/Dashboard/dashboardpage.dart';
// import 'package:warehousemanagement/PAGES/Settings/settingspage.dart';

// class NavBarScreen extends StatefulWidget {
//   const NavBarScreen({super.key});

//   @override
//   State<NavBarScreen> createState() => _NavBarScreenState();
// }

// class _NavBarScreenState extends State<NavBarScreen> {
//  int currentindex=0;
//   final List<Widget> nav =[
// // DashboardScreen(),
// // SettingsScreen(),


//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//            body:  nav[currentindex],
//       bottomNavigationBar: BottomNavigationBar(
//         // fixedColor:  primarycolor,
//         selectedItemColor: primarycolor,
//         selectedFontSize: 16,
//         unselectedFontSize: 15,
        
//         currentIndex: currentindex,
//         onTap: (index) {
//           setState(() {
//             currentindex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//          BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'settings',
//           ),
//         ],
//       ),
//     );
//   }
// }