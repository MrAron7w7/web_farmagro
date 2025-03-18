import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  final Widget? content;
  const AppLayout({super.key, required this.content});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navegar a la página correspondiente
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/store');
        break;
      case 2:
        Navigator.pushNamed(context, '/about');
        break;
      case 3:
        Navigator.pushNamed(context, '/activities');
        break;
      case 4:
        Navigator.pushNamed(context, '/products');
        break;
      case 5:
        Navigator.pushNamed(context, '/branches');
        break;
      case 6:
        Navigator.pushNamed(context, '/contact');
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
          Center(child: Image.asset('assets/logo.png', height: 100)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //APPBAR
                Row(
                  children: [
                    Text(
                      "Farmagro",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 45),
                    _buildNavItem("Inicio", 0),
                    SizedBox(width: 20),
                    _buildNavItem("Tienda en Línea", 1),
                    SizedBox(width: 20),
                    _buildNavItem("Nosotros", 2),
                    SizedBox(width: 20),
                    _buildNavItem("Actividades", 3),
                    SizedBox(width: 20),
                    _buildNavItem("Catálogo de productos", 4),
                    SizedBox(width: 20),
                    _buildNavItem("Sucursales", 5),
                    SizedBox(width: 20),
                    _buildNavItem("Contáctenos", 6),
                    Spacer(),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Buscar tu producto",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0XFF2563EB),
                              width: 3,
                            ),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
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

  Widget _buildNavItem(String title, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: MouseRegion(
        onEnter: (event) => setState(() {}),
        onExit: (event) => setState(() {}),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: _selectedIndex == index ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
