####### Atelier bonne pratiques R#########

      library(tidyverse)
onde<-data.table::fread("raw_data/onde_france_2022.csv")
view(onde)
#examen du data frame intitulé des colonnes
names<-names(onde)
view(names)
names(onde)
class(onde)#classes del'objet
typeof(onde)#type de stockage
class(names(onde))#type de stockage
typeof(names(onde))
#renommage on enlève les < >
nouveaux_noms<-stringr::str_replace(string = names(onde),
                                    pattern = ">",
                                    replacement ="" )
#l"objet nouveaux_noms ecrase l'ancien
nouveaux_noms<-stringr::str_replace(string = nouveaux_noms,
                                    pattern = "<",
                                    replacement ="" )

view(nouveaux_noms)
#on remplace les noms de colonnes avec nouveaux_noms
names(onde)<-nouveaux_noms
#6premièreslignes
head(onde)
#6 dernièreslignes
tail(onde)
#selection de lignes et colonnes
1:8
#selection de 8 lignes et 6 colonnes
onde[1:8, 1:6]
test<-onde[1:8,"CdSiteHydro"]
test1<-onde[1:8, c("CdSiteHydro","NomEntiteHydrographique") ]

test5<-onde[1:8, c("OCCITANIE","BRETAGNE")]
#les dimensions du dataframe
nrow(onde)
ncol(onde)
# juste la variable
onde$LbRsObservationNat
#examen d'un colonne
mean(onde$CoordXSiteHydro) #moyenne (fonctionne car pas val manquantes)
sd(onde$CoordXSiteHydro) #ecart-type(fonctionne car pas val manquantes)
plot(onde$CoordXSiteHydro) #graphique simple
hist(onde$CoordXSiteHydro)#distri histogramme
ggplot(data=onde,#distribution (var quali, avec ggplot2))
       aes(x=CoordXSiteHydro))+
  geom_histogram(fill="green",col="black")+
  labs(x="Longitude",
       y="Nombre d'occurences",
       title="Histogreen")
table(onde$LbRegion)#nb occurences de chaque nom de région
ggplot(data=onde,
       aes(x=LbRegion))+
  geom_bar(fill="red", col="black")+
  labs(y="Nb occurences")
#renommage des colonnes avec fonction rename
onde2<-onde %>%
  rename(x=CoordXSiteHydro,
         y=CoordYSiteHydro)
rm(onde2)
#########################################################
library(readODS)
invertebres<-readODS::read_ods("raw_data/AFB_Saisie_MinvCE_DREAL_Bzh_RRP_2021.ods",
                               sheet = "04187500",
                               skip = 86) %>%
  select(CODE_STATION:C)#la fonction Select selctionne des colonnes

###########################feuille de calcul #############
aspe_vivarmor <- read_excel("raw_data/aspe_vivarmor.xlsx")
> View(aspe_vivarmor)

chemin<-"raw_data/aspe_vivarmor.xlsx"
file.exists(chemin)
#les feuilles
readxl::excel_sheets(chemin)
stations_vivarmor<-read_xlsx(path=chemin,sheet="liste_stations")

synthese_vivarmor <-readxlsx(path=chemin,
                             sheet="synthese")

########Requeter une API#######*

Exemple de lAPI ecoulement avec le package hubeau l


####Un shape file

depts<-sf::read_sf("raw_data/DEPARTEMENT_CARTO.shp")

#   visualisation ####
mapview::mapview(depts)
ggplot(data=depts)+geom_sf()
class(depts)

#############    Hub'eau    ################

hubeau::get_[API]_[endpoint] .
library(hubeau)
hubeau::get_[API]_[endpoint]
https://inrae.github.io/hubeau/reference/get_qualite_eau_potable.html


########### HER niveau2    #########

devtools::install_github(repo = "pascalirz/tod")
her2<-
  tod:: wfs_sandre(url_wfs="https://services.sandre.eaufrance.fr/geo/mdo?",
                   couche = "Hydroecoregion2")

ggplot(her2) +
  geom_sf()

mapview(her2)
##############    package ASPE   ################
devtools::install_github("pascalirz/aspe")

############   modif didier Pujo ##########
