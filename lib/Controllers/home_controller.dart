import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/destination.dart';

class HomeController extends GetxController {
  var promotionDestinations = <Destination>[].obs;
  var brazilDestinations = <Destination>[].obs;
  var worldDestinations = <Destination>[].obs;
  var bestSellers = <Destination>[].obs;

  var origin = ''.obs;
  var destination = ''.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var adults = 1.obs;
  var children = 0.obs;
  var infants = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  void fetchDestinations() {
    // Aqui você pode buscar os dados de uma API ou banco de dados.
    // Adicione alguns destinos de exemplo:
    promotionDestinations.addAll([
      Destination(
          name: 'Rio de Janeiro',
          imageUrl:
              'https://revistaazul.voeazul.com.br/wp-content/uploads/2023/03/muito-alem-da-praia-saiba-o-que-fazer-no-rio-de-janeiro.jpeg',
          price: 1500,
          discount: 10),
      Destination(
          name: 'Salvador',
          imageUrl:
              'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/dd/dd/02.jpg',
          price: 1200,
          discount: 15),
    ]);

    brazilDestinations.addAll([
      Destination(
          name: 'São Paulo',
          imageUrl:
              'https://visitbrasil.com/wp-content/uploads/2021/06/GettyImages-1166728645-1.jpg',
          price: 800),
      Destination(
          name: 'Florianópolis',
          imageUrl:
              'https://static.mundoeducacao.uol.com.br/mundoeducacao/2021/08/ponte-hercilio-luz.jpg',
          price: 1100),
    ]);

    worldDestinations.addAll([
      Destination(
          name: 'Paris',
          imageUrl:
              'https://www.passagenspromo.com.br/blog/wp-content/uploads/2019/04/viagem-para-paris.jpg',
          price: 3000),
      Destination(
          name: 'New York',
          imageUrl:
              'https://www.remessaonline.com.br/blog/wp-content/uploads/2022/06/morar-em-nova-york.jpg',
          price: 2500),
      Destination(
          name: 'Paris',
          imageUrl:
              'https://www.passagenspromo.com.br/blog/wp-content/uploads/2019/04/viagem-para-paris.jpg',
          price: 3000),
      Destination(
          name: 'New York',
          imageUrl:
              'https://www.remessaonline.com.br/blog/wp-content/uploads/2022/06/morar-em-nova-york.jpg',
          price: 2500),
      Destination(
          name: 'Paris',
          imageUrl:
              'https://www.passagenspromo.com.br/blog/wp-content/uploads/2019/04/viagem-para-paris.jpg',
          price: 3000),
      Destination(
          name: 'New York',
          imageUrl:
              'https://www.remessaonline.com.br/blog/wp-content/uploads/2022/06/morar-em-nova-york.jpg',
          price: 2500),
      Destination(
          name: 'Paris',
          imageUrl:
              'https://www.passagenspromo.com.br/blog/wp-content/uploads/2019/04/viagem-para-paris.jpg',
          price: 3000),
      Destination(
          name: 'New York',
          imageUrl:
              'https://www.remessaonline.com.br/blog/wp-content/uploads/2022/06/morar-em-nova-york.jpg',
          price: 2500),
    ]);

    bestSellers.addAll([
      Destination(
          name: 'Orlando',
          imageUrl:
              'https://cdn.britannica.com/07/201607-050-0B5774CB/Orlando-Florida-aerial-cityscape-towards-Eola-Lake.jpg',
          price: 2200),
      Destination(
          name: 'Miami',
          imageUrl:
              'https://www.miamiandbeaches.com/getmedia/f35e8173-0df2-4bed-86dc-727805570021/Miami-Aerial-Photos-Golden-Dusk-Photography-1440x900.jpg?width=1000&resizemode=force',
          price: 2100),
    ]);
  }
}
