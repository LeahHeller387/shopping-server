import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { User } from 'src/user/user.entity';
import { Product } from 'src/product/product.entity';

@Entity()
export class CartItem {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  quantity: number;

  @ManyToOne(() => User, user => user.cartItems, { eager: true })
  user: User;

  @ManyToOne(() => Product, product => product.cartItems, { eager: true })
  product: Product;
}
