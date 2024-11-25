import 'package:flutter/material.dart';

class RoomCarouselWithCards extends StatefulWidget {
  final List<Map<String, dynamic>> rooms;

  const RoomCarouselWithCards({Key? key, required this.rooms}) : super(key: key);

  @override
  _RoomCarouselWithCardsState createState() => _RoomCarouselWithCardsState();
}

class _RoomCarouselWithCardsState extends State<RoomCarouselWithCards> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250, // Ajustar altura según diseño
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.rooms.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final room = widget.rooms[index];
              return _buildRoomCard(room);
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.rooms.length,
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
      ],
    );
  }

  Widget _buildRoomCard(Map<String, dynamic> room) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        children: [
          // Imagen ajustada a la tarjeta
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              room["imageUrl"],
              height: 160, // Ajustar altura según diseño
              width: double.infinity,
              fit: BoxFit.cover, // Hace que la imagen se adapte al contenedor
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/common/room_placeholder.png',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Contenido debajo de la imagen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Información del cuarto
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room["price"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      room["partnerName"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                // Iconos de servicios y rating
                Row(
                  children: [
                    ...List.generate(
                      (room["services"] as List<IconData>).length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          room["services"][index],
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        Text(
                          room["rating"].toString(),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
