import 'package:flutter/material.dart';
import '../firebase/ProductService.dart';
import '../firebase/Producto.dart';
import 'ProductoF.dart';


class ProductSearchScreen extends StatefulWidget {
  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ProductService _productService = ProductService();
  List<Producto> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Buscar Producto'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(labelText: 'Nombre del Producto', focusColor: Colors.deepOrange),
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
          ElevatedButton(
            onPressed: _searchProducts,
            child: Text('Buscar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Producto producto = _searchResults[index];
                return Container(
                  height: 90,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.deepOrange, width: 2),
                    ),
                    margin: EdgeInsetsDirectional.all(12.5),
                    child: ListTile(
                      leading: ClipRect(
                        child: Image.network(
                          'assets/imagenes/'+producto.nomProducto+'.png',
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      title: Text(producto.nomProducto),
                      subtitle: Text(producto.descripcion),
                      trailing: Text(producto.precio),
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductoF(
                                      titulo: producto.nomProducto, id: Producto(
                                      nomProducto: producto.nomProducto,
                                      id: producto.id,
                                      descripcion: producto.descripcion,
                                      precio: producto.precio,
                                    ),
                                    )));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _searchProducts() {
    String searchTerm = _searchController.text.trim();
    if (searchTerm.isNotEmpty) {
      _productService.searchProductsByName(searchTerm).then((results) {
        setState(() {
          print(results);
          _searchResults = results;
        });
      }).catchError((error) {
        print('Error al buscar productos: $error');
        setState(() {
          _searchResults = [];
        });
      });
    }
  }
}
