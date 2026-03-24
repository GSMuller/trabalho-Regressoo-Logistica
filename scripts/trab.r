# Regressão Linear — Wine Quality | Y=quality X1=alcohol X2=volatile.acidity X3=sulphates

# 1. Dados
wine <- read.csv("Dataset/winequality-red.csv")
wine <- na.omit(wine)
# 1599 obs, 12 variáveis, 0 missing values

# 2. Modelo A — quality ~ alcohol
modelo_A <- lm(quality ~ alcohol, data = wine)
summary(modelo_A)
# alcohol: β=0.3608, p<2e-16 | R²=0.2267

# 3. Modelo B — quality ~ alcohol + volatile.acidity
modelo_B <- lm(quality ~ alcohol + volatile.acidity, data = wine)
summary(modelo_B)
# alcohol: β=0.3138, p<2e-16 | volatile.acidity: β=-1.3836, p<2e-16 | R²=0.3170

# 4. Modelo C — quality ~ alcohol + volatile.acidity + sulphates
modelo_C <- lm(quality ~ alcohol + volatile.acidity + sulphates, data = wine)
summary(modelo_C)
# alcohol: β=0.3092 | volatile.acidity: β=-1.2214 | sulphates: β=0.6790 | R²=0.3359

# 5. Comparação
data.frame(
  Modelo = c("A","B","C"),
  R2     = round(c(summary(modelo_A)$r.squared, summary(modelo_B)$r.squared, summary(modelo_C)$r.squared), 4),
  R2_Aj  = round(c(summary(modelo_A)$adj.r.squared, summary(modelo_B)$adj.r.squared, summary(modelo_C)$adj.r.squared), 4)
)
# A: 0.2267 | B: 0.3170 | C: 0.3359 (melhor)

#  Modelo     R2       R2_Aj
#1    A      0.2267    0.2263
#2    B      0.3170    0.3161
#3    C      0.3359    0.3346



# 6. Diagnóstico — Modelo C
par(mfrow = c(2,2)); plot(modelo_C); par(mfrow = c(1,1))

# 7. Observado vs Predito — Modelo C
plot(wine$quality, fitted(modelo_C),
     xlab = "Quality observado", ylab = "Quality predito",
     main = "Observado vs Predito — Modelo C",
     pch = 16, col = rgb(0.2, 0.4, 0.8, 0.4))
abline(0, 1, col = "red", lwd = 2)
