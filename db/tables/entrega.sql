CREATE TABLE entrega (
  cd_entrega INT NOT NULL PRIMARY KEY IDENTITY,
  cd_entregador INT NOT NULL FOREIGN KEY REFERENCES entregador(cd_entregador),
  dt_inicio_entrega DATETIME NOT NULL,
  dt_fim_entrega DATETIME NOT NULL,
  ic_situacao_entrega VARCHAR(20),
  qt_km_distancia_entrega INT NOT NULL
);
