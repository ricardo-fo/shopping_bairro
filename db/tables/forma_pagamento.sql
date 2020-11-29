CREATE TABLE shopping_bairro.dbo.forma_pagamento (
  cd_forma_pagamento INT NOT NULL PRIMARY KEY IDENTITY,
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES dbo.cliente(cd_cliente),
  cd_conta_gateway VARCHAR(100),
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
