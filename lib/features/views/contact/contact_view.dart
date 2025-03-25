import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:web_farmagro/components/components.dart';
import 'package:web_farmagro/core/constants.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  // Controladores para los campos del formulario
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulación de envío
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });

          // Mostrar mensaje de éxito
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                '¡Gracias! Tu mensaje ha sido enviado. Te contactaremos pronto.',
              ),
              backgroundColor: Color(0xff45864e),
              duration: Duration(seconds: 4),
            ),
          );

          // Limpiar formulario
          _nameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _messageController.clear();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determinar si estamos en mobile o desktop basado en el ancho de la pantalla
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;
    final isTablet = width > 600 && width <= 800;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner mejorado con overlay gradiente
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: isDesktop ? 300 : 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImgs.bannerContact),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CONTÁCTENOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isDesktop ? 48 : 32,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xff45864e).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Estamos aquí para ayudarte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop ? 18 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenido principal
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal:
                  isDesktop
                      ? 80
                      : isTablet
                      ? 40
                      : 20,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sección de título e introducción
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Color(0xff45864e),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'FORMULARIO DE CONTACTO',
                              style: TextStyle(
                                color: Color(0xff45864e),
                                fontSize: isDesktop ? 26 : 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Si desea contactarse con nosotros, llene los campos correspondientes del formulario y envíelo, le responderemos lo más pronto posible.',
                          style: TextStyle(
                            fontSize: isDesktop ? 16 : 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Contenido principal: Formulario + Info de contacto
                  isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
                ],
              ),
            ),
          ),

          // Footer
          FotterComponent(isDesktop: isDesktop),
        ],
      ),
    );
  }

  // Layout para pantallas de escritorio
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Formulario (2/3 del espacio)
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(right: 30),
            child: _buildForm(),
          ),
        ),

        // Información de contacto (1/3 del espacio)
        Expanded(flex: 1, child: _buildContactInfo()),
      ],
    );
  }

  // Layout para pantallas móviles
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Formulario primero
        _buildForm(),

        SizedBox(height: 40),

        // Información de contacto después
        _buildContactInfo(),
      ],
    );
  }

  // Widget del formulario mejorado
  Widget _buildForm() {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre y Apellidos
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextformfieldComponent(
                    controller: _nameController,
                    hintText: 'Nombre',
                    prefixIcon: LucideIcons.user,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextformfieldComponent(
                    controller: _lastNameController,
                    hintText: 'Apellidos',
                    prefixIcon: LucideIcons.users,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese sus apellidos';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Email y Teléfono
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextformfieldComponent(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: LucideIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese su email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Ingrese un email válido';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextformfieldComponent(
                    controller: _phoneController,
                    hintText: 'Teléfono',
                    prefixIcon: LucideIcons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese su teléfono';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Mensaje
            TextformfieldComponent(
              controller: _messageController,
              hintText: 'Mensaje',
              prefixIcon: LucideIcons.messageSquare,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingrese su mensaje';
                }
                if (value.length < 10) {
                  return 'Su mensaje debe tener al menos 10 caracteres';
                }
                return null;
              },
            ),

            SizedBox(height: 30),

            // Botón de enviar mejorado
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff45864e),
                  foregroundColor: Colors.white,
                  minimumSize: Size(180, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                onPressed: _isSubmitting ? null : _submitForm,
                child:
                    _isSubmitting
                        ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                        : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ENVIAR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              LucideIcons.send,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget de información de contacto mejorado
  Widget _buildContactInfo() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff45864e), Color(0xff046E32)],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFORMACIÓN DE CONTACTO',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),

          SizedBox(height: 6),

          Divider(color: Colors.white.withOpacity(0.3), thickness: 1),

          SizedBox(height: 24),

          // Dirección
          _buildContactItem(
            icon: LucideIcons.mapPin,
            title: 'Dirección',
            content:
                'Cdla. Los vergeles Calle 23A Dr. Carlos Julio Arosemena, No 1-6-7 Intersección Av. 38C Mz 263. Guayaquil - Ecuador',
          ),

          SizedBox(height: 20),

          // Teléfono
          _buildContactItem(
            icon: LucideIcons.phone,
            title: 'Teléfono',
            content: '977 693 392 - 946 546 485',
          ),

          SizedBox(height: 20),

          // Email
          _buildContactItem(
            icon: LucideIcons.mail,
            title: 'Email',
            content: 'agro_plaza@yahoo.com ',
          ),

          SizedBox(height: 30),

          // Horario de atención (añadido)
          _buildContactItem(
            icon: LucideIcons.clock,
            title: 'Horario de Atención',
            content:
                'Lunes a Viernes: 8:00 AM - 5:00 PM\nSábados: 9:00 AM - 1:00 PM',
          ),

          SizedBox(height: 30),

          SizedBox(height: 30),

          // Mapa (simulado)
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.map, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text(
                    'Ver en Google Maps',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
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

  // Componente para cada ítem de información de contacto
  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),

        SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 4),

              Text(
                content,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
