import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/home_controller.dart';
import '../models/destination.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas de Viagens'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Promoção'),
            buildHorizontalList(controller.promotionDestinations),
            buildSectionTitle('Descubra o Brasil'),
            buildHorizontalList(controller.brazilDestinations),
            buildSectionTitle('Aventure-se pelo Mundo'),
            buildHorizontalList(controller.worldDestinations),
            buildSectionTitle('Mais vendidos'),
            buildHorizontalList(controller.bestSellers),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildHorizontalList(RxList<Destination> destinations) {
    return SizedBox(
      height: 200,
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final destination = destinations[index];
            return buildDestinationCard(destination);
          },
        );
      }),
    );
  }

  Widget buildDestinationCard(Destination destination) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(destination.imageUrl,
                  width: 160, height: 100, fit: BoxFit.cover),
              if (destination.discount != null)
                Positioned(
                  right: 0,
                  child: Container(
                    color: Colors.red,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      '${destination.discount}% OFF',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(destination.name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('R\$ ${destination.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
