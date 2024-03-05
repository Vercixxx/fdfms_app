// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class BottomMenu extends StatelessWidget {
//   final ValueNotifier<int> selectedIndex;

//   const BottomMenu(this.selectedIndex, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
//       child: GNav(
//         gap: 8,
//         rippleColor: Colors.green,
//         hoverColor: Colors.grey,
//         haptic: true,
//         tabBackgroundColor: Colors.grey.shade400,
//         curve: Curves.easeOutExpo,
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         onTabChange: (index) => selectedIndex.value = index,
//         tabs: [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//           ),
//           GButton(
//             icon: Icons.drive_eta_rounded,
//             text: 'Delivery',
//           ),
//         ],
//       ),
//     );
//   }
// }
