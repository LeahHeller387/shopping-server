import {  Controller,  Post,  Patch,  Delete,  Get,  Body,  Req,  UseGuards,} from '@nestjs/common';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { CartService } from './cart.service';
import {  AddCartItemDto,  UpdateCartItemDto,  DeleteCartItemDto,} from './dto/index';

@UseGuards(JwtAuthGuard)
@Controller('cart')
export class CartController {
  constructor(private readonly cartService: CartService) {}

  @Post('add')
  add(@Body() dto: AddCartItemDto, @Req() req: any) {
    return this.cartService.addProductToCart(req.user.userId, dto);
  }

  @Patch('update')
  update(@Body() dto: UpdateCartItemDto, @Req() req: any) {
    return this.cartService.updateProductQuantity(req.user.userId, dto);
  }

  @Delete('remove')
  remove(@Body() dto: DeleteCartItemDto, @Req() req: any) {
    return this.cartService.deleteProductFromCart(req.user.userId, dto);
  }

  @Get()
  getCart(@Req() req: any) {
    return this.cartService.getCartItems(req.user.userId);
  }
}
