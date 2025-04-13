import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConfiguration {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔒 Variables privadas para rutas de documentos y colecciones
  final CollectionReference _configCollection =
      FirebaseFirestore.instance.collection('configuration');

  final DocumentReference _categoriasDoc =
      FirebaseFirestore.instance.collection('configuration').doc('categoriasProductos');

  final DocumentReference _carruselDoc =
      FirebaseFirestore.instance.collection('configuration').doc('carrusel');

  final DocumentReference _imagenesDoc =
      FirebaseFirestore.instance.collection('configuration').doc('imagenesBase64');

  final CollectionReference _sedesPrincipalesCollection =
      FirebaseFirestore.instance.collection('configuration').doc('sedes').collection('principales');

  /// 1. Actualizar lista personalizada
  Future<void> actualizarCategorias(List<String> nuevasCategorias) async {
    await _categoriasDoc.update({'categorias': nuevasCategorias});
  }

  /// 2. Obtener lista de categorías
  Future<List<String>> obtenerCategorias() async {
    final snapshot = await _categoriasDoc.get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return List<String>.from(data['categorias'] ?? []);
    }
    return [];
  }

  /// 3. Guardar carrusel de imágenes (Base64 o URL)
  Future<void> guardarCarrusel(List<String> imagenesBase64) async {
    await _carruselDoc.set({'imagenes': imagenesBase64});
  }

  /// 4. Guardar imagen Base64 individual
  Future<void> guardarImagenBase64({required String nombre, required String base64}) async {
    await _imagenesDoc.set({nombre: base64}, SetOptions(merge: true));
  }

  /// 5. Crear sede principal con subcolección de sucursales
  Future<void> crearSedePrincipalConSucursales({
    required String idSede,
    required String nombreSede,
    required List<Map<String, dynamic>> sucursales,
  }) async {
    final DocumentReference sedeRef = _sedesPrincipalesCollection.doc(idSede);

    await sedeRef.set({'nombre': nombreSede});

    for (var sucursal in sucursales) {
      final sucursalId = sucursal['id'];
      await sedeRef.collection('sucursales').doc(sucursalId).set(sucursal);
    }
  }
}
