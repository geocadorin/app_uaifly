import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uaifly_app/Controllers/home_controller.dart';
import 'package:uaifly_app/models/destination.dart';

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
            buildTravelForm(context),
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

  Widget buildTravelForm(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pesquisar Viagens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          buildTextField('Origem', (value) => controller.origin.value = value),
          buildTextField(
              'Destino', (value) => controller.destination.value = value),
          buildDatePicker(context, 'Data de Partida', controller.startDate),
          buildDatePicker(context, 'Data de Retorno', controller.endDate),
          buildTravelerCounter('Adultos', controller.adults),
          buildTravelerCounter('Crianças', controller.children),
          buildTravelerCounter('Bebês', controller.infants),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Lógica de pesquisa de viagens
            },
            child: const Text('Pesquisar'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget buildDatePicker(
      BuildContext context, String label, Rx<DateTime> date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: date.value,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null && pickedDate != date.value) {
            date.value = pickedDate;
          }
        },
        child: Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '$label: ${DateFormat('dd/MM/yyyy').format(date.value)}',
            ),
          );
        }),
      ),
    );
  }

  Widget buildTravelerCounter(String label, RxInt count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (count.value > 0) count.value--;
                },
              ),
              Obx(() {
                return Text(count.value.toString(),
                    style: const TextStyle(fontSize: 16));
              }),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  count.value++;
                },
              ),
            ],
          ),
        ],
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
    return Container(
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
