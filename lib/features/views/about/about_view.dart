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

            // MISION
            _buildSection(
              context,
              isDesktop,
              'assets/granjero.png',
              'MISIÓN',
              'Somos una empresa orientada a proveer insumos y servicios de alta calidad al mercado agropecuario del Ecuador. Nuestro compromiso es impulsar la productividad y sostenibilidad en el sector agrícola, brindando soluciones innovadoras y asesoramiento técnico especializado.\n\nNuestra visión es ser reconocidos como líderes en el mercado agropecuario, innovando con servicios y soluciones, y promoviendo la incursión de nuevos negocios complementarios. Buscamos ser un referente en sostenibilidad y responsabilidad social, contribuyendo al desarrollo del campo ecuatoriano.',
            ),
            const SizedBox(height: 40),

            // PRINCIPIOS Y VALORES
            _buildSection(
              context,
              isDesktop,
              'assets/valores.png',
              'PRINCIPIOS Y VALORES',
              'Nos basamos en principios éticos, morales y responsabilidad ante la sociedad y el medio ambiente, mediante la aplicación y mejoramiento continuo. Nuestros valores son el pilar fundamental de nuestra cultura organizacional.',
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

            // FOTTER DE ARON ;D
            FotterComponent(isDesktop: isDesktop),
          ],
        ),
      ),
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
