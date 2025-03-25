import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:web_farmagro/core/constants.dart';

class FotterComponent extends StatefulWidget {
  final bool isDesktop;

  const FotterComponent({super.key, required this.isDesktop});

  @override
  State<FotterComponent> createState() => _FotterComponentState();
}

class _FotterComponentState extends State<FotterComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: widget.isDesktop ? 30 : 20,
        horizontal: widget.isDesktop ? 40 : 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xff45864e), const Color(0xff3a7341)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: widget.isDesktop ? _buildDesktopFooter() : _buildMobileFooter(),
    );
  }

  // Footer para escritorio
  Widget _buildDesktopFooter() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo y descripción
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      AppImgs.logo,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Agrimarket está comprometido con la agricultura sostenible, ofreciendo soluciones innovadoras para mejorar la productividad y calidad de los cultivos.',
                    style: TextStyle(color: Colors.white, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),

            // Menú rápido
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enlaces rápidos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFooterLink('Inicio'),
                  _buildFooterLink('Nosotros'),
                  _buildFooterLink('Productos'),
                  _buildFooterLink('Servicios'),
                  _buildFooterLink('Contáctenos'),
                ],
              ),
            ),

            // Contacto
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contáctenos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactInfo(
                    LucideIcons.mapPin,
                    'Av. Principal 123, Ciudad',
                  ),
                  _buildContactInfo(
                    LucideIcons.phone,
                    '977 693 392 - 946 546 485',
                  ),
                  _buildContactInfo(LucideIcons.mail, 'agro_plaza@yahoo.com'),
                  _buildContactInfo(LucideIcons.clock, 'Lun-Vie: 8:00 - 17:00'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(color: Colors.white24),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '© 2025 Agrimarket. Todos los derechos reservados.',
              style: TextStyle(color: Colors.white70),
            ),
            Row(
              children: [
                _buildSocialIcon(LucideIcons.facebook, 10),
                _buildSocialIcon(LucideIcons.instagram, 11),
                _buildSocialIcon(LucideIcons.twitter, 12),
                _buildSocialIcon(LucideIcons.youtube, 13),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Footer para móvil
  Widget _buildMobileFooter() {
    return Column(
      children: [
        // Logo centrado
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(AppImgs.logo, height: 50, fit: BoxFit.contain),
        ),

        // Información de contacto
        Column(
          children: [
            _buildContactInfo(LucideIcons.mapPin, 'Av. Principal 123, Ciudad'),
            _buildContactInfo(LucideIcons.phone, '977 693 392 - 946 546 485'),
            _buildContactInfo(LucideIcons.mail, 'agro_plaza@yahoo.com '),
          ],
        ),

        const SizedBox(height: 20),

        // Iconos sociales
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(LucideIcons.facebook, 10),
            _buildSocialIcon(LucideIcons.instagram, 11),
            _buildSocialIcon(LucideIcons.twitter, 12),
            _buildSocialIcon(LucideIcons.youtube, 13),
          ],
        ),

        const SizedBox(height: 16),
        const Divider(color: Colors.white24),
        const SizedBox(height: 16),

        const Text(
          '© 2025 Agrimarket. Todos los derechos reservados.',
          style: TextStyle(color: Colors.white70, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Enlaces del footer
  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        child: Text(text, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, int index) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(icon, size: 20, color: const Color(0xff45864e)),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white70),
          const SizedBox(width: 10),
          SelectableText(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
