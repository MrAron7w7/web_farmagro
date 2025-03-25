import 'package:flutter/material.dart';

class BranchesView extends StatelessWidget {
  const BranchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sucursales')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Nuestras Sucursales:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              title: Text('Sucursal 1'),
              subtitle: Text('Dirección de la sucursal 1'),
            ),
            const ListTile(
              title: Text('Sucursal 2'),
              subtitle: Text('Dirección de la sucursal 2'),
            ),
            const ListTile(
              title: Text('Sucursal 3'),
              subtitle: Text('Dirección de la sucursal 3'),
            ),
            const ListTile(
              title: Text('Sucursal 4'),
              subtitle: Text('Dirección de la sucursal 4'),
            ),
            const ListTile(
              title: Text('Sucursal 5'),
              subtitle: Text('Dirección de la sucursal 5'),
            ),
            const ListTile(
              title: Text('Sucursal 6'),
              subtitle: Text('Dirección de la sucursal 6'),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Contáctanos:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(title: Text('Teléfono 1: (123) 456-7890')),
            const ListTile(title: Text('Teléfono 2: (098) 765-4321')),
          ],
        ),
      ),
    );
  }
}
