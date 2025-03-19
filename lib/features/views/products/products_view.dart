import 'package:flutter/material.dart';
import 'package:web_farmagro/components/fotter_component.dart';
import 'package:web_farmagro/core/constants.dart';
import 'package:web_farmagro/features/views/products/components/components.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Determinar si estamos en mobile o desktop basado en el ancho de la pantalla
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImgs.bannerCatalog),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'CATÁLOGO',
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: isDesktop ? 40 : 32,
              ),
            ),
          ),

          // Título de categoría
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'NUESTROS PRODUCTOS',
                style: TextStyle(
                  color: const Color(0xFF046E32), // Verde corporativo
                  fontWeight: FontWeight.bold,
                  fontSize: isDesktop ? 28 : 22,
                ),
              ),
            ),
          ),

          // Filtros de categoría (opcional)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                CategoryChipComponent(label: 'Todos', isSelected: true),
                CategoryChipComponent(
                  label: 'Fertilizantes',
                  isSelected: false,
                ),
                CategoryChipComponent(label: 'Insecticidas', isSelected: false),
                CategoryChipComponent(label: 'Fungicidas', isSelected: false),
                CategoryChipComponent(label: 'Herbicidas', isSelected: false),
              ],
            ),
          ),

          // Grid de productos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildProductGrid(isDesktop),
          ),

          // Botón Ver Más
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF45864E),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'VER MÁS PRODUCTOS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Footer
          FotterComponent(isDesktop: isDesktop),
        ],
      ),
    );
  }

  // Widget para crear el grid de productos
  Widget _buildProductGrid(bool isDesktop) {
    // Lista de ejemplo de productos
    final products = [
      {'name': 'Fertilizante NPK', 'image': AppImgs.plantilla, 'code': 'F-001'},
      {
        'name': 'Insecticida Bio-Control',
        'image': AppImgs.plantilla,
        'code': 'I-002',
      },
      {
        'name': 'Fungicida Premium',
        'image': AppImgs.plantilla,
        'code': 'F-003',
      },
      {
        'name': 'Herbicida Selectivo',
        'image': AppImgs.plantilla,
        'code': 'H-004',
      },
      {
        'name': 'Estimulante Foliar',
        'image': AppImgs.plantilla,
        'code': 'E-005',
      },
      {'name': 'Abono Orgánico', 'image': AppImgs.plantilla, 'code': 'A-006'},
    ];

    // Número de columnas basado en si es desktop o mobile
    final crossAxisCount = isDesktop ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 0.8 : 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  // Widget para las tarjetas de producto
  Widget _buildProductCard(Map<String, String> product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Image.asset(
                  product['image'] ?? 'assets/placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Información del producto
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] ?? 'Producto',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Código: ${product['code'] ?? 'N/A'}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF046E32),
                    side: const BorderSide(color: Color(0xFF046E32)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Ver detalles'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
