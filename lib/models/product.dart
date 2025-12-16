class Products {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final bool isFavorite;
  final String description;
  final String imageUrl;

  const Products({
    required this.id,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
});
}

final List<Products> products = [
  const Products(
    id: 'p1',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,
    imageUrl : 'assets/images/shoe.jpg',
    description : 'This is a description of the Product 1',
  ),

  const Products(
    id: 'p2',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,

    imageUrl : 'assets/images/laptop.jpg',
    description : 'This is a description of the Product 2',
  ),

  const Products(
    id: 'p3',
    name: 'Jordan Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    imageUrl : 'assets/images/shoe2.jpg',
    description : 'This is a description of the Product 3',
  ),
  const Products(
    id: 'p4',
    name: 'Puma',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,
    imageUrl : 'assets/images/shoes2.jpg',
    description : 'This is a description of the Product 4',
  ),

  const Products(
    id: 'p5',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,

    imageUrl : 'assets/images/shoe.jpg',
    description : 'This is a description of the Product 1',
  ),

  const Products(
    id: 'p6',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,

    imageUrl : 'assets/images/laptop.jpg',
    description : 'This is a description of the Product 2',
  ),

  const Products(
    id: 'p7',
    name: 'Jordan Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,

    imageUrl : 'assets/images/shoe2.jpg',
    description : 'This is a description of the Product 3',
  ),
  const Products(
    id: 'p8',
    name: 'Puma',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,
    imageUrl : 'assets/images/shoes2.jpg',
    description : 'This is a description of the Product 4',
  ),

  const Products(
    id: 'p9',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,
    imageUrl : 'assets/images/shoe.jpg',
    description : 'This is a description of the Product 1',
  ),

  const Products(
    id: 'p10',
    name: 'Shoes',
    category : 'Footwear',
    price : 88.00,
    oldPrice : 134.56,
    isFavorite: true,
    imageUrl : 'assets/images/laptop.jpg',
    description : 'This is a description of the Product 2',
  ),

];