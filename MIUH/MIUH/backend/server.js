const express = require('express');
const cors = require('cors');
const alertasRoutes = require('../api/alertas.routes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/alertas', alertasRoutes);

app.listen(3000, () => console.log('Servidor corriendo en http://localhost:3000'));
