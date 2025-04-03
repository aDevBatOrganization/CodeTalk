require('dotenv').config({path:'../Config/.env'});
const mysql = require('mysql2');

const db = mysql.createConnection({
    host:process.env.DB_HOST,
    port:process.env.DB_PORT,
    user:process.env.DB_USER,
    password:process.env.DB_PASSWORD,
    database:process.env.DB_NAME
})

db.connect((e) => {
    if (e) {
        console.error('Erreur de connexion a la base de donnees : ', e.message)
    } else {
        console.log('Connexion MySQL reussie !');
    }
})

db.on('error', (e) => {
    console.error('Erreur MySQL : ', e)
    if (e.code === 'PROTOCOL_CONNECTION_LOST') {
        console.log('Reconnexion a MySQL ...')
        db.connect()
    } else {
        throw e;
    }
})

module.exports = db;