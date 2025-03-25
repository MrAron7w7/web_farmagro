import 'package:flutter/material.dart';
import 'package:web_farmagro/components/components.dart'; // Importa el footer

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BANNER
            Stack(
              children: [
                Image.asset(
                  'assets/banner_contact.png', // Imagen de banner
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black.withOpacity(0.4),
                  alignment: Alignment.center,
                  child: const Text(
                    'QUIÉNES SOMOS',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // COMPANY DESCRIPTION
            _buildSection(
              context,
              isDesktop,
              'assets/agrimarket_team.png', // Update image
              'QUIÉNES SOMOS',
              'AGRIMARKET es una empresa peruana dedicada a la comercialización de insumos agrícolas, incluyendo agroquímicos, fertilizantes y semillas. Nos especializamos en proporcionar soluciones integrales para el desarrollo de cultivos, respaldados por un equipo de ingenieros y técnicos altamente especializados con amplia experiencia en el sector agrícola.',
            ),

            const SizedBox(height: 40),

            // MARCAS ASOCIADAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MARCAS LÍDERES',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Trabajamos en estrecha colaboración con las principales marcas del mercado agrícola, garantizando la máxima calidad y eficiencia en cada producto:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildBrandChip('Bayer'),
                          _buildBrandChip('Farmex'),
                          _buildBrandChip('TQC'),
                          _buildBrandChip('Syngenta'),
                          _buildBrandChip('Serfi'),
                          _buildBrandChip('Adama'),
                          _buildBrandChip('Silvestre'),
                          _buildBrandChip('PSW'),
                          _buildBrandChip('Farmagro'),
                          _buildBrandChip('SQM Vitas'),
                          _buildBrandChip('Molinos'),
                          _buildBrandChip('Gavilón'),
                          _buildBrandChip('Neoagrum'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // MISION
            _buildSection(
              context,
              isDesktop,
              'assets/granjero.png',
              'MISIÓN',
              'Satisfacer las necesidades de nuestros clientes agricultores con productos innovadores y servicios de calidad, generando valor para la agricultura y con una asesoría en manos de un equipo dedicado y profesional.',
            ),
            const SizedBox(height: 40),

            // PRINCIPIOS Y VALORES
            _buildSection(
              context,
              isDesktop,
              'assets/valores.png',
              'VISIÓN',
              'Ser la empresa líder de distribución de Insumos agrícolas con productos de calidad para una agricultura sostenible y rentable, generando una marca de calidad y garantía.',
            ),
            const SizedBox(height: 20),

            // TARJETAS
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildAnimatedValueCard(
                  'Ética',
                  'Actuamos con integridad y transparencia en todas nuestras operaciones. La honestidad y la justicia son la base de nuestras decisiones.',
                ),
                _buildAnimatedValueCard(
                  'Responsabilidad',
                  'Nos comprometemos con el cuidado del medio ambiente y la sociedad. Promovemos prácticas sostenibles y responsables en todos nuestros procesos.',
                ),
                _buildAnimatedValueCard(
                  'Innovación',
                  'Buscamos constantemente nuevas soluciones para mejorar la productividad agrícola. La tecnología y la creatividad son nuestros aliados.',
                ),
                _buildAnimatedValueCard(
                  'Calidad',
                  'Ofrecemos productos y servicios de la más alta calidad. La excelencia es nuestro estándar en todo lo que hacemos.',
                ),
              ],
            ),
            const SizedBox(height: 40),

            // POLITICA DE CALIDAD
            _buildSection(
              context,
              isDesktop,
              'assets/calidad.png',
              'POLÍTICA DE CALIDAD',
              'Somos una organización dedicada a la importación, comercialización y distribución de insumos fitosanitarios, semillas y equipos de alta tecnología para la producción agropecuaria. Mejoramos continuamente nuestros procesos, para lograr la satisfacción de nuestros clientes, y cumplimos con la legislación ecuatoriana vigente y otras aplicables.',
            ),
            const SizedBox(height: 50),

            // VENTAJAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child:
                      isDesktop
                          ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/principio.png',
                                    fit: BoxFit.contain,
                                    height: 300,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              // Texto de ventajas a la derecha
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'VENTAJAS',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      '• Mejorar la satisfacción de nuestros clientes externos e internos.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '• Mejorar la calidad de nuestro servicio de ventas y distribución.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '• Brindar servicio técnico de calidad a nuestros clientes.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '• Fomentar la innovación y el desarrollo de nuevos productos.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '• Cumplir con las normativas ambientales y de seguridad.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '• Promover la capacitación continua de nuestro personal.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/principio.png',
                                fit: BoxFit.contain,
                                height: 200,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'VENTAJAS',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                '• Mejorar la satisfacción de nuestros clientes externos e internos.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '• Mejorar la calidad de nuestro servicio de ventas y distribución.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '• Brindar servicio técnico de calidad a nuestros clientes.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '• Fomentar la innovación y el desarrollo de nuevos productos.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '• Cumplir con las normativas ambientales y de seguridad.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '• Promover la capacitación continua de nuestro personal.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            _buildBranchesSection(context, isDesktop),

            const SizedBox(height: 40),

            // FOTTER DE ARON ;D
            FotterComponent(isDesktop: isDesktop),
          ],
        ),
      ),
    );
  }

  // Add this method to your existing AboutView class
  Widget _buildBranchesSection(BuildContext context, bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'NUESTRAS SUCURSALES',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              // Grouped branches by location
              _buildBranchGroup('Sucursales en Cañete', [
                'Jr. Jose Galvez 113 - San Vicente de Cañete (Sucursal Principal)',
                'Jr. San Agustín N° 280 - San Vicente de Cañete',
                'Jr. San Agustín N° 330 - San Vicente de Cañete',
                'Parque de Herbay Alto - Calle Principal S/N',
              ]),
              const SizedBox(height: 20),
              _buildBranchGroup('Sucursales en Chincha', [
                'Calle Mariscal Castilla N° 431 - Chincha Alta',
                'Calle Mariscal Castilla N° 465 - Chincha Alta',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a branch group
  Widget _buildBranchGroup(String groupTitle, List<String> branches) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10),
          ...branches.map(
            (branch) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.green, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      branch,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method for creating brand chips
  Widget _buildBrandChip(String brandName) {
    return Chip(
      label: Text(brandName),
      backgroundColor: Colors.green.shade50,
      labelStyle: TextStyle(color: Colors.green.shade800),
    );
  }

  // METODO PARA SECCIONES
  Widget _buildSection(
    BuildContext context,
    bool isDesktop,
    String imagePath,
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child:
              isDesktop
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                            height: 250,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      // TEXTO DE LA DERECHA
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              content,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen arriba en móvil
                      Image.asset(imagePath, fit: BoxFit.contain, height: 200),
                      const SizedBox(height: 20),
                      // Contenido abajo en móvil
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        content,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  // TARJETA ANIMADA
  Widget _buildAnimatedValueCard(String title, String description) {
    return MouseRegion(
      onEnter: (_) {
        //NADA
      },
      onExit: (_) {
        //NADA
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        height: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
