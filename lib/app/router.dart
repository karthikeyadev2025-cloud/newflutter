import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/admin/presentation/admin_shell.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/shop/presentation/shop_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/shop',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/shop',
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopShell(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminShell(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text(state.error.toString())),
  ),
);
