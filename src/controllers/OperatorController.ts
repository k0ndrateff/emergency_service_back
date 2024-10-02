import {Body, Get, HttpCode, JsonController, OnUndefined, Param, Post} from 'routing-controllers';
import 'reflect-metadata';
import {pool} from "../config/pgPool";
import {Operator} from "../models/Operator/Operator";
import {CreateOperatorDto} from "../models/Operator/CreateOperatorDto";

@JsonController('/operators')
export class OperatorController {
  @Get()
  async getAll(): Promise<Operator[]> {
    try {
      const result = await pool.query('SELECT * FROM operator');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get all operators: ${err}`);
    }
  }

  @Get('/:id')
  @OnUndefined(404)
  async getOne(@Param('id') id: string): Promise<Operator> {
    try {
      const result = await pool.query('SELECT * FROM operator WHERE id = $1', [id]);

      return result.rows[0];
    }
    catch (err) {
      throw new Error(`Failed to get operator: ${err}`);
    }
  }

  @HttpCode(201)
  @Post()
  async create(@Body() operator: CreateOperatorDto): Promise<Operator> {
    try {
      const result = await pool.query(
        'INSERT INTO operator (first_name, last_name, middle_name, is_free) VALUES ($1,$2, $3, true) RETURNING *'
        , [operator.first_name, operator.last_name, operator.middle_name]);

      return result.rows[0];
    }
    catch (err) {
      throw new Error(`Failed to create operator: ${err}`);
    }
  }
}
