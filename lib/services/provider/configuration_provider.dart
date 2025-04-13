import 'package:flutter/material.dart';
import 'package:web_farmagro/services/firebase/firestore_configuration.dart';

class ConfigProvider with ChangeNotifier {
  final FirestoreConfiguration _service = FirestoreConfiguration();

  List<String> _categorias = [];
  List<String> get categorias => _categorias;

  /// Inicializar categorías al iniciar app
  Future<void> cargarCategorias() async {
    _categorias = await _service.obtenerCategorias();
    notifyListeners();
  }

  /// Actualizar desde UI
  Future<void> actualizarCategorias(List<String> nuevas) async {
    await _service.actualizarCategorias(nuevas);
    _categorias = nuevas;
    notifyListeners();
  }
}
