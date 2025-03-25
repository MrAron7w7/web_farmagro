import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_farmagro/features/views/views.dart';

enum AppRoute {
  home('/home'),
  about('/about'),
  products('/products'),
  contact('/contact'),
  activities('/activities'),
  branches('/branches');

  final String path;
  const AppRoute(this.path);
}

final appRouter = GoRouter(
  initialLocation: AppRoute.home.path,
  //debugLogDiagnostics: true, // slo para desaroolo
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey, // Importante para preservar estado
            child: AppLayout(content: HomeView()),
          ),
    ),
    GoRoute(
      path: AppRoute.about.path,
      name: AppRoute.about.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppLayout(content: AboutView()),
          ),
    ),
    GoRoute(
      path: AppRoute.products.path,
      name: AppRoute.products.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppLayout(content: ProductsView()),
          ),
    ),
    GoRoute(
      path: AppRoute.contact.path,
      name: AppRoute.contact.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppLayout(content: ContactView()),
          ),
    ),
    GoRoute(
      path: AppRoute.activities.path,
      name: AppRoute.activities.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppLayout(content: ActivitiesView()),
          ),
    ),
    GoRoute(
      path: AppRoute.branches.path,
      name: AppRoute.branches.name,
      pageBuilder:
          (context, state) => MaterialPage(
            key: state.pageKey,
            child: AppLayout(content: BranchesView()),
          ),
    ),
  ],

  errorBuilder:
      (context, state) => AppLayout(
        content: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '404',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Página no encontrada: ${state.uri.path}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go(AppRoute.home.path),
                  child: const Text('Volver al inicio'),
                ),
              ],
            ),
          ),
        ),
      ),
);
