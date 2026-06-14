import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme.dart';
import '../../../core/widgets/app_panel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: AppPanel(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.storefront_outlined, color: AppColors.primary, size: 42),
                const SizedBox(height: 18),
                const Text('MyStore OS', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                const Text('Billing, inventory, GST, credit, and shop growth.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
                const SizedBox(height: 24),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    prefixIcon: Icon(Icons.phone_outlined, size: 18),
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, size: 18),
                  ),
                ),
                const SizedBox(height: 18),
                FilledButton(
                  onPressed: () => context.go('/shop'),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => context.go('/admin'),
                  child: const Text('Open Super Admin Preview'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
