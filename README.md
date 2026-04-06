# Wine Quality - Regressão Linear

Dataset: winequality-red.csv | 1599 obs, 12 variáveis | sem missing values

---

## 1. Preparação dos Dados

Dataset do UCI Machine Learning Repository. Carregado com `read.csv()` e limpo com `na.omit()`. Não havia valores faltantes. Variável dependente: `quality` (escala 3–8). Regressores escolhidos: `alcohol`, `volatile.acidity`, `sulphates`.

---

## 2. Especificação dos Modelos

Três modelos aninhados estimados por OLS:

- Modelo A: `quality ~ alcohol`
- Modelo B: `quality ~ alcohol + volatile.acidity`
- Modelo C: `quality ~ alcohol + volatile.acidity + sulphates`

---

## 3. Testes Estatísticos

Todos os coeficientes com p < 2e-16 nos três modelos — altamente significativos.

| Modelo | R²     | R² Aj  |
|--------|--------|--------|
| A      | 0.2267 | 0.2263 |
| B      | 0.3170 | 0.3161 |
| C      | 0.3359 | 0.3346 |

O R² mede quanto da variância de `quality` o modelo explica. O R² ajustado penaliza variáveis sem poder explicativo real. A diferença entre os dois é mínima nos três modelos, o que confirma que os regressores adicionados contribuem de fato.

---

## 4. Acurácia

Modelo C teve melhor performance. O aumento de complexidade se justificou:

- A para B: +9 pp em R² — volatile.acidity tem forte efeito negativo sobre qualidade
- B para C: +1.9 pp — sulphates contribui, mas com retorno marginal menor

No total, o modelo explica ~33% da variância. O restante está em variáveis não observadas (características sensoriais, preferência do avaliador, etc).

---

## 5. Conclusão

`alcohol`, `volatile.acidity` e `sulphates` são determinantes estatisticamente relevantes da qualidade do vinho. O modelo C é o melhor dos três, mas 33% de R² indica que qualidade sensorial é difícil de capturar só com variáveis físico-químicas. Os diagnósticos não apontam violações graves do OLS — heterocedasticidade leve e resíduos com caudas pesadas nos extremos, ambos esperados dado que `quality` é discreta.
