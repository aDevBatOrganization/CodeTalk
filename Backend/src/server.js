require('dotenv').config({path:'../Config/.env'})
const express = require('express')
const db = require('./db')

const app = express()
const PORT = process.env.PORT_BACKEND

app.get('/test-db', (req, res) => {
    db.query('SELECT * FROM Users',  (e, results) => {
        if (e) {
            console.error(`Erreur lors de la recuperation des bases : `, e)
            return res.status(500).json({error: 'Erreur de connexion a la base de donner.'})
        }
        res.status(200).json(results)
    })
})

app.listen(PORT, () => {
    console.log(`Server express demarrer sur le port ${PORT}`)
})