import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAuthenticatedProvider = FutureProvider<bool>((ref) async {
  // Simulate checking local storage or an authentication service
  await Future.delayed(const Duration(seconds: 2));
  return false; // For example, user is not logged in
});

final splashProvider = FutureProvider<bool>((ref) async {
  final isAuthenticated = await ref.watch(isAuthenticatedProvider.future);
  await Future.delayed(const Duration(seconds: 3));
  return isAuthenticated;
});