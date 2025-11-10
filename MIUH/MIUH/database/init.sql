-- Creación de la base de datos del proyecto MIUH
CREATE DATABASE IF NOT EXISTS miuh_db;
USE miuh_db;

-- Tabla de usuarios (puede usarse para ciudadanos o administradores)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(100),
  rol ENUM('ciudadano', 'admin') DEFAULT 'ciudadano'
);

-- Tabla de alertas de inundación
CREATE TABLE alertas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  zona VARCHAR(100) NOT NULL,
  nivel VARCHAR(50) NOT NULL,
  descripcion TEXT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Datos de ejemplo
INSERT INTO alertas (zona, nivel, descripcion) VALUES
('Chilca', 'Crítico', 'Desborde del río a las 10:30 AM'),
('El Tambo', 'Normal', 'Nivel de agua estable');





const mysql = require('mysql2');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'miuh_db'
});

connection.connect(err => {
  if (err) throw err;
  console.log('✅ Conectado a MySQL');
});

module.exports = connection;
