const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
const Joi = require('joi');

const app = express();
const port = 3000;

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bigohtech'
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err);
        return;
    }
    console.log('Connected to the MySQL database.');
});

const handleDatabaseError = (err, res) => {
    if (err.code === 'ER_DUP_ENTRY') {
        res.status(400).send({ error: 'A form with the same uniqueId already exists.' });
    } else {
        res.status(500).send({ error: 'Database operation failed.' });
    }
};


const formSchema = Joi.object({
    uniqueId: Joi.string().guid({ version: 'uuidv4' }).required(),
    title: Joi.string().required(),
    name: Joi.string().required(),
    email: Joi.string().email().required(),
    phonenumber: Joi.number().required(),
    isGraduate: Joi.boolean().required()
});

app.post('/form', (req, res) => {
    const { error, value } = formSchema.validate(req.body);

    if (error) {
        return res.status(400).send({ error: error.details[0].message });
    }

    const { uniqueId, title, name, email, phonenumber, isGraduate } = value;

    const query = 'INSERT INTO forms (uniqueId, title, name, email, phonenumber, isGraduate, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())';
    db.execute(query, [uniqueId, title, name, email, phonenumber, isGraduate], (err, results) => {
        if (err) {
            return handleDatabaseError(err, res);
        }
        res.status(201).send({ message: 'Form submitted successfully.' });
    });
});

app.post('/form_fill', (req, res) => {
    const { form_title } = req.query;

    if (!form_title) {
        return res.status(400).send({ error: 'form_title query parameter is required.' });
    }

    req.body.title = form_title;
    const { error, value } = formSchema.validate(req.body);

    if (error) {
        return res.status(400).send({ error: error.details[0].message });
    }

    const { uniqueId, name, email, phonenumber, isGraduate } = value;

    const query = `INSERT INTO forms (uniqueId, title, name, email, phonenumber, isGraduate, created_at, updated_at)
                   VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())`;
    db.execute(query, [uniqueId, form_title, name, email, phonenumber, isGraduate], (err, results) => {
        if (err) {
            return handleDatabaseError(err, res);
        }
        res.status(201).send({ message: 'Form submitted successfully.' });
    });
});

app.get('/fill_data', (req, res) => {
    const { form_title } = req.query;

    if (!form_title) {
        return res.status(400).send({ error: 'form_title query parameter is required.' });
    }

    const query = 'SELECT * FROM forms WHERE title = ?';
    db.execute(query, [form_title], (err, results) => {
        if (err) {
            return res.status(500).send({ error: 'Database query failed.' });
        }
        res.status(200).send(results);
    });
});



app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
