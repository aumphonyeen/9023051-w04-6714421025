class Dessert {
  const Dessert({
    required this.id,
    required this.name,
    required this.category,
    required this.origin,
    required this.flavor,
    required this.mainIngredient,
    required this.rating,
    required this.favoriteDate,
  });

  final String id;
  final String name;
  final String category;
  final String origin;
  final String flavor;
  final String mainIngredient;
  final double rating;
  final DateTime favoriteDate;
}