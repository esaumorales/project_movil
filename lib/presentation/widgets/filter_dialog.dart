import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final VoidCallback? onClose;

  const FilterWidget({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filtros",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onClose != null)
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSection("Zona", [
              "La Era",
              "Los tulipanes",
              "San Francisco",
              "Los Portales",
              "La Alameda",
            ]),
            const SizedBox(height: 16),
            _buildSection("Tipo de Inmueble", ["Cuarto", "Cuarto", "Casa"],
                selectedIndex: 0),
            const SizedBox(height: 16),
            _buildSection("Precio", [
              "Precio de mayor a menos",
              "Precio de menor a mayor",
            ]),
            const SizedBox(height: 16),
            _buildSection(
              "Valoración",
              ["★ 1", "★ 2", "★ 3", "★ 4", "★ 5"],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> options,
      {int? selectedIndex}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.asMap().entries.map((entry) {
            final index = entry.key;
            final text = entry.value;
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                // Aquí puedes manejar la lógica de selección
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
