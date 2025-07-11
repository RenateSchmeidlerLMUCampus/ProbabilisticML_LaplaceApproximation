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
ggsave(filename = "TestBeta_3_3.png",     plot = gBeta_3_3)
ggsave(filename = "TestBeta_20_20.png",   plot = gBeta_20_20)
ggsave(filename = "TestBeta_200_200.png", plot = gBeta_200_200)

ggsave(filename = "TestBeta_2_4.png",     plot = gBeta_2_4)
ggsave(filename = "TestBeta_4_2.png",     plot = gBeta_4_2)
ggsave(filename = "TestBeta_40_20.png",   plot = gBeta_40_20)
ggsave(filename = "TestBeta_400_200.png", plot = gBeta_400_200)

ggsave(filename = "TestBeta_2_20.png",    plot = gBeta_2_20)
ggsave(filename = "TestBeta_2_200.png",   plot = gBeta_2_200)
ggsave(filename = "TestBeta_20_200.png",  plot = gBeta_20_200)

## Beispiele mit multimodaler Verteilung

ggsave(filename = "TestBiModN_0_1_5_1.png",    plot = gBiModNorm_0_1_5_1)
ggsave(filename = "TestBiModN_0_2_5_1.png",    plot = gBiModNorm_0_2_5_1)
ggsave(filename = "TestBiModN_n4_0k5_0_2.png", plot = gBiModNorm_n4_0k5_0_2)
ggsave(filename = "TestBiModN_n5_1_0_2.png",   plot = gBiModNorm_n5_1_0_2)

ggsave(filename = "TestMultiModN4_0_1_4_0k5_5_0k2_7_0k4.png", 
       plot     =  gMultiModNorm4_0_1_4_0k5_5_0k2_7_0k4)
ggsave(filename = "TestMultiModN4_0_1_4_0k5_5_0k2_7_1.png", 
       plot     =  gMultiModNorm4_0_1_4_0k5_5_0k2_7_1)
ggsave(filename = "TestMultiModN4_0_1_4_0k5_5_0k2_7_1k5.png", 
       plot     =  gMultiModNorm4_0_1_4_0k5_5_0k2_7_1k5)
ggsave(filename = "TestMultiModN4_0_1_4_0k5_5_0k2_7_2.png", 
      plot     =   gMultiModNorm4_0_1_4_0k5_5_0k2_7_2)