import { Injectable, BadRequestException, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../user/user.entity';
import * as bcrypt from 'bcrypt';
import { LoginDto, RegisterDto } from './dto/auth.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private readonly userRepo: Repository<User>,
    private readonly jwtService: JwtService,
  ) {}

  async validateUser(username: string, password: string): Promise<User | null> {
    const user = await this.userRepo.findOne({ where: { username } });
    if (user && await bcrypt.compare(password, user.password)) {
      return user;
    }
    return null;
  }

  async login(dto: LoginDto) {
    const user = await this.validateUser(dto.username, dto.password);
    if (!user) throw new UnauthorizedException('Invalid credentials');

    const payload = { sub: user.id, username: user.username };
    return { access_token: this.jwtService.sign(payload) };
  }

  async register(dto: RegisterDto) {
    const exists = await this.userRepo.findOne({ where: { username: dto.username } });
    if (exists) throw new BadRequestException('Username already exists');

    const hashedPassword = await bcrypt.hash(dto.password, 10);
    const newUser = this.userRepo.create({ username: dto.username, password: hashedPassword });
    const savedUser = await this.userRepo.save(newUser);

    return { id: savedUser.id, username: savedUser.username };
  }
}
