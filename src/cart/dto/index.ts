export class AddCartItemDto {
  productId: number;
  quantity: number;
}

export class UpdateCartItemDto {
  productId: number;
  quantity: number;
}

export class DeleteCartItemDto {
  productId: number;
}
