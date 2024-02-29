import {createPool} from 'mysql2/promise'

export const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'salesland',
    port: 3306
});