import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:web_farmagro/components/components.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(LucideIcons.phone, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
            _buildIntroSection(),
            const SizedBox(height: 40),
            _buildStatsSection(),
            const SizedBox(height: 40),
            _buildFeatureCards(context),
            const SizedBox(height: 40),
            _buildTestimonialsSection(),
            const SizedBox(height: 40),
            _buildFAQSection(),
            const SizedBox(height: 40),
            _buildContactSection(),
            const SizedBox(height: 40),
            FotterComponent(isDesktop: isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/Agricultura.jpg',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.black.withOpacity(0.3),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a Farmagro',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Explorar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIntroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          Text(
            'Tu socio confiable en el sector agrícola',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'En Farmagro, nos especializamos en brindar soluciones eficientes para el sector agrícola, ofreciendo productos de alta calidad y asesoramiento técnico.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      color: Colors.green.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _StatItem(
            icon: LucideIcons.leaf,
            value: '10,000+',
            label: 'Clientes satisfechos',
          ),
          _StatItem(
            icon: LucideIcons.package,
            value: '500+',
            label: 'Productos de calidad',
          ),
          _StatItem(
            icon: LucideIcons.users,
            value: '100+',
            label: 'Expertos en el equipo',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        _buildFeatureCard(
          context,
          'Nuestros Productos',
          Icons.shopping_cart,
          '/products',
        ),
        _buildFeatureCard(context, 'Sobre Nosotros', Icons.info, '/about'),
        _buildFeatureCard(context, 'Contáctanos', Icons.phone, '/contact'),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.green.withOpacity(0.05),
      child: Column(
        children: [
          const Text(
            'Testimonios',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildTestimonialCard(
                'Juan Pérez',
                'Excelente servicio y productos de alta calidad. ¡Muy recomendado!',
              ),
              _buildTestimonialCard(
                'María Gómez',
                'Farmagro ha sido un gran aliado en mi negocio agrícola.',
              ),
              _buildTestimonialCard(
                'Carlos Ruiz',
                'El asesoramiento técnico que brindan es invaluable.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String name, String testimonial) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.format_quote, size: 40, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              testimonial,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '- $name',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preguntas Frecuentes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          ExpansionTile(
            title: const Text('¿Cómo puedo comprar sus productos?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Puedes comprarlos a través de nuestra web o en nuestras tiendas físicas.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('¿Ofrecen asesoramiento técnico?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sí, contamos con expertos que te guiarán en cada paso.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.green.withOpacity(0.1),
      child: Column(
        children: [
          const Text(
            'Contáctanos',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Tienes alguna pregunta? No dudes en contactarnos.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            //NADA XD
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Contactar',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.green),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
