-- 1. Si aún no la tienes, crea la base de datos
CREATE DATABASE chilca_alerta_db;

-- 2. Selecciona la base de datos para usarla
USE chilca_alerta_db;

-- 3. Crea la tabla para los usuarios (login y registro)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 4. Crea la tabla para el historial de datos del clima
CREATE TABLE weather_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    locationName VARCHAR(255) NOT NULL,
    temperature DECIMAL(5, 2) NOT NULL,
    humidity DECIMAL(5, 2) NOT NULL,
    precipitation DECIMAL(5, 2) NOT NULL,
    wind DECIMAL(5, 2) NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 5. Crea la tabla para los reportes de incidentes
CREATE TABLE incident_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    incidentType VARCHAR(255) NOT NULL,
    description TEXT,
    photoUrl VARCHAR(255), -- Ruta a la imagen guardada en un servidor
    reportTimestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) -- Opcional: enlaza el reporte a un usuario
);