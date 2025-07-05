## Speichern der Graphiken als PNG-Dateien


## Beispiele mit Normalverteilung

ggsave(filename = "TestNorm_0_1.png",  plot = gNorm_0_1)
ggsave(filename = "TestNorm_25_7.png", plot = gNorm_25_7)

## Beispiele mit t-Verteilung
ggsave(filename = "TesttDistr_2_0.png",    plot = gtDistr_2_0)
ggsave(filename = "TesttDistr_2_5.png",    plot = gtDistr_2_5)
ggsave(filename = "TesttDistr_20_0.png",   plot = gtDistr_20_0)
ggsave(filename = "TesttDistr_200_0.png",  plot = gtDistr_200_0)


## Beispiele mit Gamma-Verteilung

ggsave(filename = "TestGamma_1.1_1.png",  plot = gGamma_1.1_1)
ggsave(filename = "TestGamma_1.5_1.png",  plot = gGamma_1.5_1)
ggsave(filename = "TestGamma_2_1.png",    plot = gGamma_2_1)
ggsave(filename = "TestGamma_20_1.png",   plot = gGamma_20_1)
ggsave(filename = "TestGamma_20_10.png",  plot = gGamma_20_10)

## Beispiele mit Beta-Verteilung

ggsave(filename = "TestBeta_2_2.png",     plot = gBeta_2_2)
ggsave(filename = "TestBeta_20_20.png",   plot = gBeta_20_20)
ggsave(filename = "TestBeta_200_200.png", plot = gBeta_200_200)

ggsave(filename = "TestBeta_2_4.png",     plot = gBeta_2_4)
ggsave(filename = "TestBeta_4_2.png",     plot = gBeta_4_2)

ggsave(filename = "TestBeta_2_20.png",    plot = gBeta_2_20)
ggsave(filename = "TestBeta_2_200.png",   plot = gBeta_2_200)
ggsave(filename = "TestBeta_20_200.png",  plot = gBeta_20_200)
