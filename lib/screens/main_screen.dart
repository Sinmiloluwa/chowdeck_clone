import 'package:chowdeck_clone/screens/home_screen.dart';
import 'package:chowdeck_clone/screens/orders_screen.dart';
import 'package:chowdeck_clone/screens/profile_screen.dart';
import 'package:chowdeck_clone/screens/search_screen.dart';
import 'package:chowdeck_clone/screens/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nav_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  final _screens = const [
    HomeScreen(),
    SearchScreen(),
    OrdersScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavProvider);

    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => ref.read(bottomNavProvider.notifier).state = i,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.greenAccent,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_off_outlined, color: Colors.greenAccent,), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.list_outlined, color: Colors.greenAccent,), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.support_outlined, color: Colors.greenAccent,), label: "Support"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.greenAccent,), label: "Profile"),
        ],
      ),
    );
  }
}
