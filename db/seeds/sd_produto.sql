INSERT INTO produto (
  cd_loja,
  ds_titulo,
  ds_resumo,
  vl_produto_centavo,
  cd_foto_produto,
  ic_ativo,
  ic_concorda_termos,
  cd_produto_gateway
) VALUES
(1, 'Pipoca', 'Pipoca salgada e deliciosa.', 500, 'link1', 1, 1, 'abc-123'),
(1, 'Melão', 'Melão da melhor qualidade.', 10000, 'link2', 1, 1, 'abc-456'),
(2, 'Carrinho de brinquedo', 'Hotwheels! Vai encarar?', 20000, 'link3', 1, 1, 'def-123'),
(2, 'Boneca Barbie', 'Boneca original.', 70000, 'link4', 1, 1, 'def-456'),
(3, 'Fone JBL', 'Fone original da JBL.', 200000, 'link5', 1, 1, 'ghi-123'),
(3, 'Caixa de som', 'Caixa de som muito potente.', 100000, 'link6', 1, 1, 'ghi-456');
