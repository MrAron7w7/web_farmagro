import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppLayout extends StatefulWidget {
  final Widget? content;
  const AppLayout({super.key, required this.content});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  final Set<int> _hoveredIcons = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtener el índice seleccionado desde los parámetros de la ruta
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs is int) {
      _selectedIndex = routeArgs;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navegar a la página correspondiente y pasar el índice seleccionado
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: index, // Pasar el índice seleccionado
        );
        break;
      case 1:
        Navigator.pushReplacementNamed(
          context,
          '/about',
          arguments: index, // Pasar el índice seleccionado
        );
        break;
      case 2:
        Navigator.pushReplacementNamed(
          context,
          '/products',
          arguments: index, // Pasar el índice seleccionado
        );
        break;
      case 3:
        Navigator.pushReplacementNamed(
          context,
          '/contact',
          arguments: index, // Pasar el índice seleccionado
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Imagen en la parte superior
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: const Color(0xfff5f5f5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '1800 - Farmagro',
                  style: TextStyle(color: Color(0xffbebebe)),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 70,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                Row(
                  children: [
                    _buildSocialNetwork(
                      index: 0,
                      icon: LucideIcons.facebook,
                      onTap: () => print('Facebook'),
                    ),
                    _buildSocialNetwork(
                      index: 1,
                      icon: LucideIcons.instagram,
                      onTap: () => print('Instagram'),
                    ),
                    _buildSocialNetwork(
                      index: 2,
                      icon: LucideIcons.twitter,
                      onTap: () => print('Twitter'),
                    ),
                    _buildSocialNetwork(
                      index: 3,
                      icon: LucideIcons.phone,
                      onTap: () => print('Phone'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // APPBAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildNavItem("Inicio", 0),
                    _buildNavItem("Nosotros", 1),
                    _buildNavItem("Catálogo de productos", 2),
                    _buildNavItem("Contáctenos", 3),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: widget.content ?? Container()),
        ],
      ),
    );
  }

  Widget _buildSocialNetwork({
    required int index,
    required IconData icon,
    required Function()? onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIcons.add(index)),
      onExit: (_) => setState(() => _hoveredIcons.remove(index)),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            icon,
            size: 24,
            color:
                _hoveredIcons.contains(index)
                    ? const Color(0xff45864e)
                    : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Ink(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    _selectedIndex == index ? Colors.green : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color:
                    _selectedIndex == index ? Colors.green : Color(0xff634551),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
