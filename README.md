# Shopee-Foreign-Language
Esse Script vem a partir de uma tabela criada com Machine Learning para verificação de idioma na plataforma.

A partir do que era retornado, Seria necessário marcar "Sim" para DELETAR se o anúncio estive-se em outras linguas, e "Não" para PT_BR e um grupo específico de categorias onde não se aplica a regra que não se aplica a regra.

Como "Es" é uma lingua que se aproxima muito do português, eu criei um REGEXP_LIKE para que verifique umas palavras que possa estar em espanhol para ser validada como "Sim", pois a forma de detecção de linguagem ja estava definido para coluna "Detected_language".
