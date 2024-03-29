-- Creación de la base de datos
CREATE DATABASE FacturacionAguaPotable;
GO

-- Cambio al contexto de la nueva base de datos
USE FacturacionAguaPotable;
GO

-- Creación de la tabla para clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);
GO

-- Creación de la tabla para medidores de agua
CREATE TABLE Medidores (
    MedidorID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    NumeroMedidor VARCHAR(50),
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    FechaInstalacion DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
GO

-- Creación de la tabla para lecturas de medidores
CREATE TABLE Lecturas (
    LecturaID INT PRIMARY KEY IDENTITY(1,1),
    MedidorID INT,
    FechaLectura DATE,
    LecturaAnterior FLOAT,
    LecturaActual FLOAT,
    FOREIGN KEY (MedidorID) REFERENCES Medidores(MedidorID)
);
GO

-- Creación de la tabla para facturas
CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    FechaFactura DATE,
    MontoTotal DECIMAL(18,2),
    Pagado BIT DEFAULT 0,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
GO
