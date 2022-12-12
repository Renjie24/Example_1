library(shiny)
ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", label="Number of bins:", 30, min = 1, max = 50)),
    mainPanel(
      plotOutput('dist'))))
server <- function(input, output){
  output$dist <- renderPlot({
    x <- faithful$waiting
    bins<- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col="blue", xlab="Waiting Time To Next Eruption (in mins)", ylab="Frequency", main="Histogram Of Waiting Times")})}
shinyApp(ui, server)