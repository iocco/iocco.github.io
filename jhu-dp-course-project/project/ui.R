library(shiny)

## Radio Buttons
radioOptions <- c("Number of cylinders" = "cyl", "Displacement (cu.in.)" = "disp", 
                  "Gross horsepower" = "hp", "Rear axle ratio" = "drat",
                  "Weight (1000 lbs)" = "wt", "1/4 mile time" = "qsec",
                  "Engine" = "vs", "Transmission" = "am",
                  "Number of forward gears" = "gear", "Number of carburetors" = "carb")

ui<-shinyUI(fluidPage(
  titlePanel("Fit regression from MPG"),
  sidebarLayout(
    sidebarPanel(
      ## radioButtons("predictor", "Select a predictor to make a regression", names(mtcars)[-1])
      radioButtons("predictor", "Select a predictor to make a regression", radioOptions)
    ),
    mainPanel(
      p("Select a new predictor and the plot will update the axis with the selected 
      predictor a new regression will be calculated and ploted, and at the end the
      most important values of the regression will be displayed."),
      plotOutput("plot1"),
      h3("Coefficients:"),
      textOutput("rSquaredText"),
      textOutput("interceptText"),
      textOutput("slopeText")
    )
  )
))