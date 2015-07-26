library(ISLR)
library(caret)
data(Wage)
Wage <- subset(Wage,select=-c(logwage))
set.seed(1985)
Train <- createDataPartition(y=Wage$wage,
                             p=0.8, list=FALSE)
training <- Wage[Train,]; testing <- Wage[-Train,]
modPred<- train(wage ~ age + jobclass + education + health_ins,
                method = "lm",data=training)

wagesPrediction <- function(age, jobclass, healthins, education) {
        x<- data.frame(year = as.integer(2003), age = as.integer(age), sex = "1. Male", maritl = "1. Never Married",
              race = "White", education = education, region = "2. Middle Atlantic", jobclass=jobclass, health = "1. <=Good", 
              health_ins=healthins, wage = as.numeric(100))
        inputdata <- rbind(testing,x)
        pred <- predict(modPred, inputdata)
        pred[nrow(inputdata)]
}


shinyServer(
        function(input, output) {
                output$inputage <- renderText({input$age})
                output$inputjobclass <- renderText({input$jobclass})
                output$inputhealthins <- renderText({input$healthins})
                output$education <- renderText({input$education})
                output$prediction <- renderText({wagesPrediction(input$age,input$jobclass,
                                                                  input$healthins,input$education)})
        }
)