shinyUI(
        fluidPage(
                # Application title
                headerPanel("Wages Prediction"),
                fluidRow(column(12,includeMarkdown("include.Rmd"))),
                sidebarPanel(
                        sliderInput('age', 'Age,in years', value = 42, min = 18, max = 80, step = 1),
                        radioButtons('jobclass', 'Job Class:', c("Industrial" = "1. Industrial",
                                                                 "Information" = "2. Information"), 
                                                                     selected = NULL),
                        radioButtons('healthins', 'Health Insurance:', c("Yes" = "1. Yes",
                                                                 "No" = "2. No"), selected = NULL),
                        radioButtons('education', 'Education:', c("< HS Grad" = "1. < HS Grad",
                                                                         "HS Grad" = "2. HS Grad",
                                                                  "Some College" = "3. Some College",
                                                                  "College Grad" = "4. College Grad",
                                                                  "Advanced Degree" = "5. Advanced Degree"), 
                                                                     selected = NULL),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'),
                        h5('Age (in years)'),
                        verbatimTextOutput("inputage"),
                        h5('Job Class'),
                        verbatimTextOutput("inputjobclass"),
                        h5('Health Insurance Availability'),
                        verbatimTextOutput("inputhealthins"),
                        h5('Education'),
                        verbatimTextOutput("education"),
                        h4('The predicted wage based on these inputs is '),
                        verbatimTextOutput("prediction")
                )
        )
)