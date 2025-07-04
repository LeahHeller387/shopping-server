import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CartService } from './cart.service';
import { CartController } from './cart.controller';
import { CartItem } from './cart.entity';
import { Product } from 'src/product/product.entity';
import { User } from 'src/user/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([CartItem, Product, User])],
  controllers: [CartController],
  providers: [CartService],
})
export class CartModule {}
