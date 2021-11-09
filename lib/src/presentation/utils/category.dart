List<Category> category = [
  Category(
    name: "Ordinary Drink",
    asset: "assets/images/ordinary.svg",
    filter: "Ordinary Drink",
  ),
  Category(
    name: "Cocktail",
    asset: "assets/images/cockt.svg",
    filter: "Cocktail",
  ),
  Category(
    name: "Milk \/ Float \/ Shake",
    asset: "assets/images/milk.svg",
    filter: "Milk \/ Float \/ Shake",
  ),
  Category(
    name: "Other\/Unknown",
    asset: "assets/images/unknown.svg",
    filter: "Other\/Unknown",
  ),
  Category(
    name: "Cocoa",
    asset: "assets/images/cocoa.svg",
    filter: "Cocoa",
  ),
  Category(
    name: "Shot",
    asset: "assets/images/shot.svg",
    filter: "Shot",
  ),
  Category(
    name: "Coffee \/ Tea",
    asset: "assets/images/coffee.svg",
    filter: "Coffee \/ Tea",
  ),
  Category(
    name: "Homemade Liqueur",
    asset: "assets/images/homemade.svg",
    filter: "Homemade Liqueur",
  ),
  Category(
    name: "Punch \/ Party Drink",
    asset: "assets/images/drink.svg",
    filter: "Punch \/ Party Drink",
  ),
  Category(
    name: "Beer",
    asset: "assets/images/beer.svg",
    filter: "Beer",
  ),
  Category(
    name: "Soft Drink \/ Soda",
    asset: "assets/images/soda.svg",
    filter: "Soft Drink \/ Soda",
  ),
];

class Category {
  String name;
  String asset;
  String filter;

  Category({
    required this.name,
    required this.asset,
    required this.filter,
  });
}
