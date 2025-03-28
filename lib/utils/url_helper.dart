import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  /// Abre un enlace en el navegador predeterminado.
  /// 
  /// [url] debe ser un enlace válido. En caso de error, lanza una excepción.
  static Future<void> abrirEnlace(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('No se pudo abrir el enlace: $url');
      }
    } catch (e) {
      print('Error al abrir el enlace: $e');
    }
  }
}
