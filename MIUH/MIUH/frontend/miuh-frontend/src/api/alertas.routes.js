const express = require('express');
const router = express.Router();

const alertas = [
  { id: 1, zona: 'Chilca', nivel: 'Crítico', hora: '10:45 AM' },
  { id: 2, zona: 'El Tambo', nivel: 'Normal', hora: '10:50 AM' }
];

router.get('/', (req, res) => res.json(alertas));
router.post('/', (req, res) => {
  const nueva = req.body;
  alertas.push(nueva);
  res.status(201).json({ mensaje: 'Reporte recibido', data: nueva });
});

module.exports = router;
