import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

import { AppController } from './app.controller';
import { AppService } from './app.service';

import { UserModule } from './user/user.module';
import { ProductModule } from './product/product.module';
import { CategoryModule } from './category/category.module';
import { CartModule } from './cart/cart.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRootAsync({
  inject: [ConfigService],
  useFactory: (config: ConfigService) => {
    // הדפסות לבדיקת טעינת משתני סביבה
    console.log('🧪 DB_HOST:', config.get('DB_HOST'));
    console.log('🧪 DB_PORT:', config.get('DB_PORT'));
    console.log('🧪 DB_USERNAME:', config.get('DB_USERNAME'));
    console.log('🧪 DB_PASSWORD:', config.get('DB_PASSWORD'));
    console.log('🧪 DB_NAME:', config.get('DB_NAME'));

    return {
      type: 'mssql',
      host: config.get('DB_HOST'),
      port: +config.get('DB_PORT'),
      username: config.get('DB_USERNAME'),
      password: config.get('DB_PASSWORD'),
      database: config.get('DB_NAME'),
      synchronize: true,
      autoLoadEntities: true,
      options: {
        encrypt: false,
        trustServerCertificate: true,
      },
    };
  },
}),

    UserModule,
    ProductModule,
    CategoryModule,
    CartModule,
    AuthModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
