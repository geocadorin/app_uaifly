class Destination {
  final String name;
  final String imageUrl;
  final double price;
  final double? discount;

  Destination({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.discount,
  });
}
