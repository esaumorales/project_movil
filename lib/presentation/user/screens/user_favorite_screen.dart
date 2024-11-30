import 'package:flutter/material.dart';
import 'package:ustay_project/presentation/user/screens/all/detail_card_screen.dart';
import 'package:ustay_project/shared/widgets/custom_footer.dart';
import 'package:ustay_project/presentation/user/screens/user_dashboard_screen.dart';
import 'package:ustay_project/presentation/user/screens/user_person_screen.dart';
import 'package:ustay_project/shared/card/large_card.dart';
import 'package:ustay_project/shared/filter/filter_dialog.dart';

// Datos estáticos para simular los edificios y sus inmuebles
class Inmueble {
  final String descripcion;
  final int precio;
  final bool disponibilidad;
  final bool ilove;
  final List<String> imagenes;
  final String ubicacion;
  final String tiempo;
  final double rating;
  final String nombrePartner;
  final String whatsapp;
  final String fotoPartner;
  final String descripcionCuarto;
  final List<String> especificaciones;
  final List<String> servicios;
  final List<String> reglasCasa;
  final String contacto;
  final String correo;

  Inmueble({
    required this.descripcion,
    required this.precio,
    required this.disponibilidad,
    required this.ilove,
    required this.imagenes,
    required this.ubicacion,
    required this.tiempo,
    required this.rating,
    required this.nombrePartner,
    required this.whatsapp,
    required this.fotoPartner,
    required this.descripcionCuarto,
    required this.especificaciones,
    required this.servicios,
    required this.reglasCasa,
    required this.contacto,
    required this.correo,
  });
}

class Edificio {
  final String imagen;
  final String nombre;
  final List<Inmueble> inmuebles;

  Edificio({
    required this.imagen,
    required this.nombre,
    required this.inmuebles,
  });
}

class UserFavoriteScreen extends StatefulWidget {
  @override
  _UserFavoriteScreenState createState() => _UserFavoriteScreenState();
}

class _UserFavoriteScreenState extends State<UserFavoriteScreen> {
  int _currentIndex = 1;

  // Datos estáticos de ejemplo
  final List<Edificio> _edificios = [
    Edificio(
      imagen: 'https://media.istockphoto.com/id/1446452511/es/foto/dise%C3%B1o-interior-minimalista-sobre-fondo-de-pared-de-arco-concepto-de-maqueta-de-pared.webp?b=1&s=612x612&w=0&k=20&c=EFs6dYSvKMgw-Mlx030hJXr0j8AnPGjf5CKMo3QcsCo=',
      nombre: 'Edificio 1',
      inmuebles: [
        Inmueble(
          descripcion: 'Cerca a Alameda',
          precio: 250,
          disponibilidad: true,
          ilove: true,
          imagenes: [
            'https://media.istockphoto.com/id/1408203038/es/foto/maqueta-de-la-casa-fondo-interior-del-dormitorio-con-muebles-de-rat%C3%A1n-y-pared-en-blanco-estilo.webp?b=1&s=612x612&w=0&k=20&c=w0Zt6aQZS8vLJ1ujfHuDXhKfW0xvAKEyhAOnS2yVKJc=',
            'https://media.istockphoto.com/id/1390233984/es/foto/habitaci%C3%B3n-de-lujo-moderna.webp?b=1&s=612x612&w=0&k=20&c=2hb95N2gSNdPf55-rHOAFA5yEfzTV3UZxXYWONCU0sg=',
            'https://media.istockphoto.com/id/1535511484/es/foto/mueble-de-tv-en-una-sala-de-estar-de-decoraci%C3%B3n-escandinava.webp?b=1&s=612x612&w=0&k=20&c=ipnzQeJBtceTsM0vUYF5AR2ueMavaV_YB6fFklocJoU=',
          ],
          ubicacion: 'AA.VV Ñaña',
          tiempo: 'Mensual',
          rating: 4.5,
          nombrePartner: 'Jose M',
          whatsapp: 'assets/icons/icon-whatsapp.png',
          fotoPartner: 'https://via.placeholder.com/50',
          descripcionCuarto: 'Cuarto propio con baño privado.',
          especificaciones: ['1 persona', '1 baño', '50 m²'],
          servicios: ['WiFi', 'Cocineta', 'Aire acondicionado', 'Luz'],
          reglasCasa: ['No fumar', 'No mascotas'],
          contacto: '963258632',
          correo: 'contacto@gmail.com',
        ),
        Inmueble(
          descripcion: 'Shalom',
          precio: 500,
          disponibilidad: true,
          ilove: true,
          imagenes: ['https://media.istockphoto.com/id/1442113721/es/foto/sof%C3%A1-de-tela-blanca-planta-de-higo-de-hoja-de-viol%C3%ADn-escritorio-de-trabajo-de-madera-y-silla.webp?b=1&s=612x612&w=0&k=20&c=M5TG3BEMVFWoO55orV8VDkofHoyMd1mkP5X8xS5snbI=',
            'https://media.istockphoto.com/id/1467126728/es/foto/dise%C3%B1o-interior-de-dormitorio-moderno-escandinavo-y-japon%C3%A9sdi-con-cama-color-blanco-mesa-y.webp?b=1&s=612x612&w=0&k=20&c=RDWKgzj93juUZqDRLsDG4kTcWYfrdKQHFW2wpIaCCCc='],
          ubicacion: 'AA.VV Alameda',
          tiempo: 'Mensual',
          rating: 4.8,
          nombrePartner: 'Juan Cruz',
          whatsapp: 'assets/icons/icon-whatsapp.png',
          fotoPartner: 'https://via.placeholder.com/50',
          descripcionCuarto: 'A 1 cuadra de la universidad.',
          especificaciones: ['2 personas', '1 baño', '60 m²'],
          servicios: ['WiFi', 'Cocineta', 'Aire acondicionado', 'Lavadora'],
          reglasCasa: ['No fumar', 'No fiestas'],
          contacto: '987654321',
          correo: 'shalom0@gmail.com',
        ),
        Inmueble(
          descripcion: 'Guarangos',
          precio: 300,
          disponibilidad: true,
          ilove: true,
          imagenes: [
            'https://http2.mlstatic.com/D_NQ_NP_2X_719956-MPE79662109065_092024-N.webp',
            'https://a0.muscache.com/im/pictures/07e45af2-fc2c-4741-81d4-8e328423890d.jpg?im_w=720',
            'https://img-us-1.trovit.com/img1pe/1d1AhSg1yu1M/1d1AhSg1yu1M.9_11.jpg',
          ],
          ubicacion: 'Ubicación A',
          tiempo: 'Mensual',
          rating: 4.5,
          nombrePartner: 'Jose M',
          whatsapp: 'assets/icons/icon-whatsapp.png',
          fotoPartner: 'https://via.placeholder.com/50',
          descripcionCuarto: 'Apartamento A con vista panorámica.',
          especificaciones: ['1 persona', '1 baño', '50 m²'],
          servicios: ['WiFi', 'Cocineta', 'Aire acondicionado'],
          reglasCasa: ['No fumar', 'No mascotas'],
          contacto: '123456789',
          correo: 'upeu@gmail.com',
        ),
      ],
    ),
  ];

  List<Inmueble> get favoritos {
    return _edificios
        .expand((edificio) => edificio.inmuebles.where((inmueble) => inmueble.ilove))
        .toList();
  }

  @override
  void initState() {
    super.initState();
  }

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserDashboardScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserFavoriteScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserPersonScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritos = this.favoritos;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/userDashboard');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tus favoritos",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    _buildFilterButton(
                      "Filtro",
                      onPressed: () {
                        _showFilterBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: favoritos.isEmpty
          ? Center(child: CircularProgressIndicator()) // Mientras cargan los favoritos
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: favoritos.map((inmueble) {
              return Column(
                children: [
                  Stack(
                    children: [
                      LargeCard(
                        imageUrl: inmueble.imagenes[0], // Usar la imagen del inmueble
                        partnerName: inmueble.nombrePartner,
                        price: inmueble.precio.toString(),
                        type: inmueble.descripcion,
                        isAvailable: inmueble.disponibilidad,
                        rating: inmueble.rating,
                        onTap: () {
                          // Validar que los parámetros no sean null antes de navegar
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailRoomScreen(inmueble: inmueble),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.favorite,
                          color: inmueble.ilove ? Colors.red : Colors.grey,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }

  Widget _buildFilterButton(String text, {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: FilterWidget(
            onClose: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
