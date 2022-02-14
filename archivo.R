library(git2r)
library(rmarkdown)
library(shinydashboard)
#library(shinyjs)
library(plotly)
library(highcharter)
library(flexdashboard)
library(emo)
library(stringr) 
library(DT)
library(dplyr)
library(tidyverse)

Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc")
setwd( "/home/jose/R/pruebas_sync_ubuntu")
source('/home/jose/R/pruebas_sync/ejec.R')
#file.copy('/Users/josemiguelavendanoinfante/R/shiny/app_covid_ven/covid_intento.html','/Users/josemiguelavendanoinfante/R/javenda_site/static/covid19venezuela.html', 
#overwrite = TRUE)
#0 */3 * * *  ######3hours cron setting
#ESTE ES EL QUE FUNCION'O
#https://popgen.nescent.org/CONTRIBUTING_WITH_GIT2R.html
#https://docs.ropensci.org/git2r/index.html
#https://github.com/ropensci/git2r/issues/296

repo <- git2r::repository( "/home/jose/R/pruebas_sync_ubuntu")
git2r::config(repo, user.name = 'javendaXgh',user.email = 'javendaXgh@gmail.com')
#git2r::cred_ssh_key()
cred <- git2r::cred_ssh_key(
  publickey = "/home/jose/.ssh/id_rsa.pub",
  privatekey = "/home/jose/.ssh/id_rsa")

#cred <-  git2r::cred_ssh_key("~/.ssh/id_rsa.pub", "~/.ssh/id_rsa" )
#cred <- cred_env('GH_USER','GH_PAT')

git2r::cred_token()
push(repo, credentials = cred_token())#probar



git2r::add(repo,'*')
git2r::commit(repo,paste('Commit covid', Sys.time()))
#git2r::libgit2_features()
git2r::config(repo, user.name = 'javendaXgh',user.email = 'javendaXgh@gmail.com')

git2r::push( repo,credentials = cred)
#git@github.com:javendaXgh/pruebas_sync_ubuntu.git
git2r::push(credentials = git2r::cred_ssh_key())
