import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
} from 'typeorm';
import { Category } from 'src/category/category.entity';
import { CartItem } from 'src/cart/cart.entity';

@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column('decimal')
  price: number;

  @Column()
  categoryId: number;

  @ManyToOne(() => Category, category => category.products)
  category: Category;

  @OneToMany(() => CartItem, cartItem => cartItem.product)
  cartItems: CartItem[];
}
