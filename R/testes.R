

test <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`, ODS) %>%
  summarise(`Previsão Orçamentária 2023` = first(`Previsão Orçamentária 2023`)
  ) %>%
  mutate(tem_ods = ifelse(is.na(ODS), FALSE, TRUE))


test2 <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(orcamento = first(`Previsão Orçamentária 2023`),
            ODS = first(ODS)) %>%
  mutate(tem_ods = ifelse(is.na(ODS), FALSE, TRUE))



df <- test2 %>%
  group_by(tem_ods) %>%
  summarise(valor = sum(orcamento)) %>%
  mutate(total = sum(valor),
         percentual = valor / total * 100)



levels(test$ODS)
