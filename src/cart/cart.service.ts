import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DeepPartial } from 'typeorm';
import { CartItem } from './cart.entity';
import { Product } from 'src/product/product.entity';
import { User } from 'src/user/user.entity';
import {  AddCartItemDto,  UpdateCartItemDto,  DeleteCartItemDto,} from './dto/index';

@Injectable()
export class CartService {
  constructor(
    @InjectRepository(CartItem)
    private readonly cartItemRepo: Repository<CartItem>,
    @InjectRepository(Product)
    private readonly productRepo: Repository<Product>,
    @InjectRepository(User)
    private readonly userRepo: Repository<User>,
  ) {}

  async addProductToCart(userId: number, dto: AddCartItemDto) {
    const { productId, quantity } = dto;

    const user = await this.userRepo.findOneBy({ id: userId });
    if (!user) throw new Error('User not found');

    const product = await this.productRepo.findOneBy({ id: productId });
    if (!product) throw new Error('Product not found');

    let item = await this.cartItemRepo.findOne({
      where: { user: { id: userId }, product: { id: productId } },
    });

    item
      ? (item.quantity += quantity)
      : (item = this.cartItemRepo.create({
          user,
          product,
          quantity,
        } as DeepPartial<CartItem>));

    const saved = await this.cartItemRepo.save(item);
    return { id: saved.id, productID: product.id, quantity: saved.quantity };
  }

  async updateProductQuantity(userId: number, dto: UpdateCartItemDto) {
    const item = await this.cartItemRepo.findOne({
      where: { user: { id: userId }, product: { id: dto.productId } },
      relations: ['product'],
    });

    if (!item) throw new Error('Item not found');

    item.quantity = dto.quantity;
    const updated = await this.cartItemRepo.save(item);

    return {
      id: updated.id,
      'update-quantity': updated.quantity,
      productID: updated.product?.id,
    };
  }

  async deleteProductFromCart(userId: number, dto: DeleteCartItemDto): Promise<void> {
    await this.cartItemRepo.delete({
      user: { id: userId },
      product: { id: dto.productId },
    });
  }

  async getCartItems(userId: number) {
    const items = await this.cartItemRepo.find({
      where: { user: { id: userId } },
      relations: ['product'],
    });

    return items.map(item => ({
      productName: item.product.name,
      quantity: item.quantity,
    }));
  }
}
