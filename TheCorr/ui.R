library("shiny")

shinyUI(fluidPage(
    titlePanel("The Corr"),
    
    fluidRow(
        
        column(3),
        
        column(9,
               br(),
               p(strong("Motivation"),style="text-decoration: underline; font-size: 13pt"),
               p("This application will display a correlation plot between 
                 all variables in a dataset you choose, then a linear regression model 
                 can be developed using an outcome of your choice and also a
                 selected number of predictors. The three available datasets are
                 from the library ",strong(em("datasets")),
                 " namely mtcars*, ToothGrowth**, and iris.",style="font-family:'arial';
                 font-size: 11pt;color:blue",align="justify"),
               br(),
               br(),
               p(strong("*The variables cyl, vs, am, gear, and carb have been 
                        transformed into factor variables."),br(),strong("**The
                        variable dose has been transformed into a factor variable
                        "),br(),strong("When Factor variables are chosen as outcome
                        variables std. errors, t-values and p-values can't be calculated
                        and hence are not presented."),br(),strong("More information can
                        be found on the datasets "),
                 a(href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html",
                   "here."),style="font-family:'arial';font-size: 9pt;color:black")
        )
    ),
    
    fluidRow(
        
        column(3,
               br(),
               br(),
               selectInput("ds",label="Choose dataset", choices=list("mtcars", 
                                                                   "ToothGrowth",
                                                                   "iris"))
               ),
        
        column(9,
               br(),
               br(),
               plotOutput("pairs")
               )
        ),
    
    fluidRow(
        
        column(3,
               br(),
               br(),
               uiOutput("vselector")
                               
               ),
       
        column(3,
               br(),
               br(),
               uiOutput("regselect")
               
               ),
        
        conditionalPanel(condition="input.regressors != ''",
        column(6,
               h4("A summary of the model",align="center"),
               tableOutput("modeltable")
               ))
    ),
    
    fluidRow(
        
        column(4),
        
        column(4,
               br(),
               br(),
               radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                            inline = TRUE),
               downloadButton('downloadReport',"Download a simple report of your model")
               )
        )
)
)