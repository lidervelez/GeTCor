CREATE TABLE usuario (
    id INT NOT NULL PRIMARY KEY,
    usr VARCHAR(20),
    pwd VARCHAR(255),
    rol VARCHAR(255)
);
INSERT INTO usuario (id, usr, pwd, rol) VALUES
(1, 'usuario1', 'asd123', 'admin'),
(2, 'usuario2', 'asd123', 'recp'),
(3, 'usuario3', 'asd123', 'conv'),
(4, 'usuario4', 'asd123', 'dit'),
(5, 'usuario5', 'asd123', 'usr');






