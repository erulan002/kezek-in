import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   List<Widget> _screens = [MainScreen(), SearchScreen(), ProfileScreen()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: _currentIndex, children: _screens),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.teal,
//         currentIndex: _currentIndex,
//         onTap: (value) {
//           setState(() {
//             _currentIndex = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final Widget child;
//   const HomePage({super.key, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     int index = _locationToTabIndex(GoRouter.of(context).state.matchedLocation);
//
//     return Scaffold(
//       body: child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: index,
//         selectedItemColor: Colors.teal,
//         onTap: (value) {
//           switch (value) {
//             case 0:
//               context.go('/home');
//               break;
//             case 1:
//               context.go('/search');
//               break;
//             case 2:
//               context.go('/profile');
//               break;
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
//
//   int _locationToTabIndex(String location) {
//     if (location.startsWith('/search')) return 1;
//     if (location.startsWith('/profile')) return 2;
//     return 0;
//   }
// }

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state.matchedLocation;

    int _getIndex() {
      if (location.startsWith('/main')) return 0;
      if (location.startsWith('/search')) return 1;
      if (location.startsWith('/profile')) return 2;
      return 0;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getIndex(),
        selectedItemColor: Colors.teal,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/main');
              break;
            case 1:
              context.go('/search');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
