import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:web_farmagro/core/constants.dart';
import 'package:web_farmagro/core/router.dart';

class AppLayout extends StatefulWidget {
  final Widget? content;
  const AppLayout({super.key, required this.content});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  //int _selectedIndex = 0;
  final Set<int> _hoveredIcons = {};
  //bool _isMenuOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Obtener el índice seleccionado basado en la ruta actual
  int get _selectedIndex {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoute.about.path)) return 1;
    if (location.startsWith(AppRoute.products.path)) return 2;
    if (location.startsWith(AppRoute.contact.path)) return 3;
    if (location.startsWith(AppRoute.activities.path)) return 4;
    if (location.startsWith(AppRoute.branches.path)) return 5;
    return 0; // Home por defecto
  }

  void _onItemTapped(int index) {
    // Cerrar drawer si está abierto (en móvil)
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    }

    // Navegar usando go_router
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/about');
        break;
      case 2:
        context.go('/products');
        break;
      case 3:
        context.go('/contact');
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
      drawer: isDesktop ? null : _buildMobileDrawer(),
      body: Column(
        children: [
          _buildHeader(isDesktop, isMobile),
          if (isDesktop) _buildDesktopNavBar() else _buildMobileAppBar(),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: widget.content ?? Container(),
            ),
          ),
        ],
      ),
    );
  }

  // Header con logo y redes sociales
  Widget _buildHeader(bool isDesktop, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 16,
        vertical: isDesktop ? 10 : 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo central en móvil, a la izquierda en tablet/desktop
          Container(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 4 : 0),
            child: Image.asset(
              AppImgs.logo,
              height: isMobile ? 50 : 70,
              fit: BoxFit.contain,
            ),
          ),

          // Redes sociales
          Row(
            children: [
              _buildSocialNetwork(
                index: 0,
                icon: LucideIcons.facebook,
                onTap: () => print('Facebook'),
                showText: isDesktop,
                text: "Facebook",
              ),
              _buildSocialNetwork(
                index: 1,
                icon: LucideIcons.instagram,
                onTap: () => print('Instagram'),
                showText: isDesktop,
                text: "Instagram",
              ),
              if (!isMobile)
                _buildSocialNetwork(
                  index: 2,
                  icon: LucideIcons.twitter,
                  onTap: () => print('Twitter'),
                  showText: isDesktop,
                  text: "Twitter",
                ),
              _buildSocialNetwork(
                index: 3,
                icon: LucideIcons.phone,
                onTap: () => print('Phone'),
                showText: isDesktop,
                text: "Llámanos",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Barra de navegación para escritorio
  Widget _buildDesktopNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem("Inicio", 0, true),
          _buildNavItem("Nosotros", 1, true),
          _buildNavItem("Catálogo de productos", 2, true),
          _buildNavItem("Contáctenos", 3, true),
        ],
      ),
    );
  }

  // AppBar para móvil
  Widget _buildMobileAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(LucideIcons.menu, color: const Color(0xff45864e)),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          Text(
            _getPageTitle(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xff45864e),
            ),
          ),
        ],
      ),
    );
  }

  // Drawer para navegación móvil
  Widget _buildMobileDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff45864e),
                  const Color(0xff45864e).withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppImgs.logo,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Agrimarket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildNavItem("Inicio", 0, false),
          _buildNavItem("Nosotros", 1, false),
          _buildNavItem("Catálogo de productos", 2, false),
          _buildNavItem("Contáctenos", 3, false),
          const Divider(),
          ListTile(
            leading: Icon(LucideIcons.phone, color: const Color(0xff45864e)),
            title: const Text('Llámanos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(LucideIcons.mail, color: const Color(0xff45864e)),
            title: const Text('Envíanos un correo'),
            onTap: () {},
          ),
          Expanded(child: Container()),
          // Footer del drawer
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
              '© 2025 Agrimarket',
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
