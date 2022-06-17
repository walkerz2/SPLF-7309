library(shiny)
#library(shiny.semantic)
#library(semantic.dashboard)
library(shinydashboard)
library(shinydashboardPlus)
library(dplyr)
library(ggplot2)
library(scales)
library(tidyr)
library(stringr)
library(plotly)
library(gsheet)

library(shiny)
library(shinyMobile)

ui = f7Page(
  title = "Split layout",
  f7SplitLayout(
    sidebar = f7Panel(
      id = "sidebar",
      title = "Sidebar",
      side = "left",
      theme = "dark",
      selectInput("kec","Pilih Kecamatan",choices=c("Pangkep","Liukang Tangaya","Liukang Kalmas","Liukang Tupabbiring","Liukang Tupabbiring Utara","Pangkajene","Minasatene","Balocci","Tondong Tallasa","Bungoro","Labakkang","Ma'rang","Segeri","Mandalle"),selected = "Pangkep")
      
      
    ),
    navbar = f7Navbar(
      title = "Split Layout",
      hairline = FALSE,
      shadow = TRUE
    ),
    # main content
    f7Shadow(
      intensity = 10,
      hover = TRUE,
      sliderInput("obs", "Number of observations", 0, 1000, 500),
      
      plotOutput("Plot")
    )
  )
)