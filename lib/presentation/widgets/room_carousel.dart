import 'package:flutter/material.dart';

class RoomCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const RoomCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _RoomCarouselState createState() => _RoomCarouselState();
}

class _RoomCarouselState extends State<RoomCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late List<String> _currentImageUrls;

  @override
  void initState() {
    super.initState();
    _currentImageUrls = widget.imageUrls; // Inicializar con las imágenes originales
  }

  // Método para actualizar las imágenes dinámicamente
  void updateImages(List<String> newImageUrls) {
    setState(() {
      _currentImageUrls = newImageUrls;
      _currentIndex = 0; // Reiniciar el índice actual
      _controller.jumpToPage(0); // Mover el carrusel a la primera página
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: _controller,
            itemCount: _currentImageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _currentImageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/common/room_placeholder.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _currentImageUrls.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentIndex == index ? 16 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        // Botón de ejemplo para actualizar las imágenes dinámicamente
        ElevatedButton(
          onPressed: () {
            // Ejemplo de actualización dinámica de imágenes
            updateImages([
              'https://example.com/new_image_1.jpg',
              'https://example.com/new_image_2.jpg',
              'https://example.com/new_image_3.jpg',
            ]);
          },
          child: const Text('Actualizar Imágenes'),
        ),
      ],
    );
  }
}
