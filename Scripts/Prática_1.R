#Minicurso Como a tecnologia pode auxiliar a entender a distribuição das espécies?
#Marina Morim Gomes & Durval Silva Santos 2025
#gomes.mari.95@gmail.com

#instalando os pacotes requeridos -------------------------------------

#1. Saia do RStudio e instale o RTools de acordo com o tutorial do curso

#2. Instale o devtools package:
if (!require('devtools')) 
  install.packages('devtools')

#3. Instale o nichetoolbox package:
library(devtools)
devtools::install_github("luismurao/ntbox")

#abrindo a plataforma shiny no R --------------------------------------
#carregue o pacote
library(ntbox)

run_ntbox()
