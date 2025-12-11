import 'package:chowdeck_clone/constants/app_colors.dart';
import 'package:chowdeck_clone/screens/home_screen.dart';
import 'package:chowdeck_clone/screens/orders_screen.dart';
import 'package:chowdeck_clone/screens/profile_screen.dart';
import 'package:chowdeck_clone/screens/search_screen.dart';
import 'package:chowdeck_clone/screens/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../providers/nav_provider.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const OrdersScreen(),
    const SupportScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavProvider);

    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          onTap: (i) => ref.read(bottomNavProvider.notifier).state = i,
          selectedItemColor: AppColors.myGreen,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 24),
          unselectedIconTheme: IconThemeData(size: 24),
          enableFeedback: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house, color: index == 0 ? AppColors.myGreen : Colors.grey),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.search, color: index == 1 ? AppColors.myGreen : Colors.grey),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.handbag, color: index == 2 ? AppColors.myGreen : Colors.grey),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.messageCircleMore, color: index == 3 ? AppColors.myGreen : Colors.grey),
              label: "Support",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/profile.png", width: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
