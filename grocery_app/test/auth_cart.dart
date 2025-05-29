class AuthCart {
  final bool isInCart;
  const AuthCart({required this.isInCart});

  factory AuthCart.fromFirebase(Cart cart) =>
      AuthCart(isInCart: cart.cartVerified);
}

class Cart {
  get cartVerified => null;
}
