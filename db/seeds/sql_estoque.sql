INSERT INTO estoque (cd_produto, ic_reposicao, qt_produto) VALUES
(1, 'sem', 0);

CREATE TABLE estoque (
  cd_estoque INT NOT NULL PRIMARY KEY IDENTITY,
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES produto(cd_produto),
  ic_reposicao VARCHAR(6),
  qt_produto INT NOT NULL DEFAULT 1
);
