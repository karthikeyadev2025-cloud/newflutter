import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme.dart';
import '../../../core/widgets/responsive_value.dart';
import 'screens/admin_overview_screen.dart';
import 'screens/admin_revenue_screen.dart';
import 'screens/admin_settings_screen.dart';
import 'screens/admin_support_screen.dart';
import 'screens/admin_users_screen.dart';

class AdminShell extends StatefulWidget {
  const AdminShell({super.key});

  @override
  State<AdminShell> createState() => _AdminShellState();
}

class _AdminShellState extends State<AdminShell> {
  int _index = 0;

  static const _items = [
    _AdminItem('Overview', Icons.dashboard_outlined),
    _AdminItem('Users', Icons.people_outline),
    _AdminItem('Revenue', Icons.currency_rupee),
    _AdminItem('Support', Icons.forum_outlined),
    _AdminItem('Settings', Icons.settings_outlined),
  ];

  final _screens = const [
    AdminOverviewScreen(),
    AdminUsersScreen(),
    AdminRevenueScreen(),
    AdminSupportScreen(),
    AdminSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);

    if (!desktop) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Super Admin'),
          actions: [
            IconButton(
              tooltip: 'Shop',
              onPressed: () => context.go('/shop'),
              icon: const Icon(Icons.storefront_outlined),
            ),
          ],
        ),
        body: _screens[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) => setState(() => _index = value),
          destinations: [
            for (final item in _items)
              NavigationDestination(icon: Icon(item.icon), label: item.label),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          _AdminSidebar(
            index: _index,
            items: _items,
            onChanged: (value) => setState(() => _index = value),
          ),
          Expanded(
            child: Column(
              children: [
                _AdminTopBar(onShop: () => context.go('/shop')),
                Expanded(child: _screens[_index]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AdminSidebar extends StatelessWidget {
  const _AdminSidebar({
    required this.index,
    required this.items,
    required this.onChanged,
  });

  final int index;
  final List<_AdminItem> items;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF111827),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Icon(Icons.verified_user_outlined, color: AppColors.primary, size: 32),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Super Admin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    Text('Platform Control', style: TextStyle(color: AppColors.faint, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Color(0x22FFFFFF), height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final selected = i == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Material(
                    color: selected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => onChanged(i),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                        child: Row(
                          children: [
                            Icon(items[i].icon, size: 18, color: selected ? Colors.white : AppColors.faint),
                            const SizedBox(width: 12),
                            Text(
                              items[i].label,
                              style: TextStyle(
                                color: selected ? Colors.white : AppColors.faint,
                                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AdminTopBar extends StatelessWidget {
  const _AdminTopBar({required this.onShop});

  final VoidCallback onShop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          const SizedBox(
            width: 380,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search users, shops, tickets',
                prefixIcon: Icon(Icons.search, size: 18),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: onShop,
            icon: const Icon(Icons.storefront_outlined, size: 18),
            label: const Text('Shop App'),
          ),
          const SizedBox(width: 10),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.campaign_outlined, size: 18),
            label: const Text('Announcement'),
          ),
        ],
      ),
    );
  }
}

class _AdminItem {
  const _AdminItem(this.label, this.icon);

  final String label;
  final IconData icon;
}
