List<Category> category = [
  Category(
    name: "Ordinary Drink",
    asset: "assets/images/drink.svg",
    filter: "Ordinary Drink",
  ),
  Category(
    name: "Cocktail",
    asset: "assets/images/drink.svg",
    filter: "Cocktail",
  ),
  Category(
    name: "Milk \/ Float \/ Shake",
    asset: "assets/images/drink.svg",
    filter: "Milk \/ Float \/ Shake",
  ),
  Category(
    name: "Other\/Unknown",
    asset: "assets/images/drink.svg",
    filter: "Other\/Unknown",
  ),
  Category(
    name: "Cocoa",
    asset: "assets/images/drink.svg",
    filter: "Cocoa",
  ),
  Category(
    name: "Shot",
    asset: "assets/images/drink.svg",
    filter: "Shot",
  ),
  Category(
    name: "Coffee \/ Tea",
    asset: "assets/images/drink.svg",
    filter: "Coffee \/ Tea",
  ),
  Category(
    name: "Homemade Liqueur",
    asset: "assets/images/drink.svg",
    filter: "Homemade Liqueur",
  ),
  Category(
    name: "Punch \/ Party Drink",
    asset: "assets/images/drink.svg",
    filter: "Punch \/ Party Drink",
  ),
  Category(
    name: "Beer",
    asset: "assets/images/drink.svg",
    filter: "Beer",
  ),
  Category(
    name: "Soft Drink \/ Soda",
    asset: "assets/images/drink.svg",
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
