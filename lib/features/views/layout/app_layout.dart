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
  //bool _isMenuOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      //_isMenuOpen = false; // Cerrar el menú después de seleccionar en mobile
    });
    // Navegar a la página correspondiente y pasar el índice seleccionado
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home', arguments: index);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/about', arguments: index);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/products', arguments: index);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/contact', arguments: index);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determinar si estamos en mobile o desktop basado en el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;
    final isMobile = screenWidth < 600;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,

      // Drawer para móvil
      drawer: isDesktop ? null : _buildMobileDrawer(),
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
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(LucideIcons.facebook, 0),
                _buildSocialIcon(LucideIcons.instagram, 1),
                _buildSocialIcon(LucideIcons.twitter, 2),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              '© 2025 Farmagro',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los iconos de redes sociales
  Widget _buildSocialNetwork({
    required int index,
    required IconData icon,
    required Function()? onTap,
    required bool showText,
    required String text,
  }) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIcons.add(index)),
      onExit: (_) => setState(() => _hoveredIcons.remove(index)),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color:
                _hoveredIcons.contains(index)
                    ? const Color(0xff45864e).withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color:
                  _hoveredIcons.contains(index)
                      ? const Color(0xff45864e).withOpacity(0.3)
                      : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color:
                    _hoveredIcons.contains(index)
                        ? const Color(0xff45864e)
                        : const Color(0xff8a8a8a),
              ),
              if (showText) ...[
                const SizedBox(width: 6),
                Text(
                  text,
                  style: TextStyle(
                    color:
                        _hoveredIcons.contains(index)
                            ? const Color(0xff45864e)
                            : const Color(0xff8a8a8a),
                    fontSize: 14,
                    fontWeight:
                        _hoveredIcons.contains(index)
                            ? FontWeight.w500
                            : FontWeight.normal,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Widget para íconos del drawer
  Widget _buildSocialIcon(IconData icon, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIcons.add(index)),
      onExit: (_) => setState(() => _hoveredIcons.remove(index)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              _hoveredIcons.contains(index)
                  ? const Color(0xff45864e).withOpacity(0.1)
                  : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xff45864e).withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Icon(icon, size: 20, color: const Color(0xff45864e)),
      ),
    );
  }

  // Widget de navegación
  Widget _buildNavItem(String title, int index, bool isDesktop) {
    if (isDesktop) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => _onItemTapped(index),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _hoveredIcons.add(index + 10)),
            onExit: (_) => setState(() => _hoveredIcons.remove(index + 10)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        _selectedIndex == index
                            ? const Color(0xff45864e)
                            : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      _selectedIndex == index ||
                              _hoveredIcons.contains(index + 10)
                          ? FontWeight.w600
                          : FontWeight.w500,
                  color:
                      _selectedIndex == index
                          ? const Color(0xff45864e)
                          : _hoveredIcons.contains(index + 10)
                          ? const Color(0xff45864e).withOpacity(0.8)
                          : const Color(0xff634551),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // Item para el drawer móvil
      return ListTile(
        selected: _selectedIndex == index,
        selectedTileColor: const Color(0xff45864e).withOpacity(0.1),
        leading: Icon(
          _getIconForIndex(index),
          color:
              _selectedIndex == index
                  ? const Color(0xff45864e)
                  : Colors.grey[600],
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight:
                _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            color:
                _selectedIndex == index
                    ? const Color(0xff45864e)
                    : Colors.grey[800],
          ),
        ),
        onTap: () => _onItemTapped(index),
      );
    }
  }

  // Obtener icono según índice para el drawer móvil
  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return LucideIcons.home;
      case 1:
        return LucideIcons.users;
      case 2:
        return LucideIcons.shoppingBag;
      case 3:
        return LucideIcons.mail;
      default:
        return LucideIcons.helpCircle;
    }
  }

  // Obtener título de la página según índice seleccionado
  String _getPageTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Nosotros';
      case 2:
        return 'Productos';
      case 3:
        return 'Contacto';
      default:
        return 'Farmagro';
    }
  }
}
