library("datasets")
library("stats")
library("knitr")
mtcars<-mtcars
mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$vs<-as.factor(mtcars$vs)
mtcars$am<-as.factor(mtcars$am)
mtcars$gear<-as.factor(mtcars$gear)
mtcars$carb<-as.factor(mtcars$carb)
ToothGrowth<-ToothGrowth
ToothGrowth$dose<-as.factor(ToothGrowth$dose)

shinyServer(
    function(input, output) {
        
        dataset <- reactive({
            switch(input$ds,"mtcars"=mtcars,"ToothGrowth"=ToothGrowth,
                        "iris"=iris)
            })
        
        output$pairs <- renderPlot({
            pairs(dataset())
        })
        
        output$vselector <- renderUI({
            selectInput("outcome", "Choose the variable you want as an outcome",
                           choices=as.list(
                               names(dataset())))
        })
        
        id<-reactive({
            grep(input$outcome,names(dataset()))
            })
        
        output$regselect <- renderUI({
            checkboxGroupInput("regressors","Choose the regressors", 
                               choice=as.list(names(dataset()[,-id()])))

        })
        
        regmod <- reactive({
            lm( as.formula(paste(paste(input$outcome,"~",collapse=''),
                paste(input$regressors,collapse="+"))),
                data=dataset()
                )
        })
        
        output$modeltable <- renderTable({
            
           
            summary(regmod())
            
            
        })         
        
        output$downloadReport <- downloadHandler(
            filename = function() {
                paste('my-report', sep = '.', switch(input$format, PDF = 'pdf', 
                                                     HTML = 'html', Word = 'docx'))
                },
            
            content = function(file) {
                src <- normalizePath('report.Rmd')
                
                # temporarily switch to the temp dir, in case you do not have write
                # permission to the current working directory
                owd <- setwd(tempdir())
                on.exit(setwd(owd))
                file.copy(src, 'report.Rmd')
                
                library(rmarkdown)
                out <- render('report.Rmd', switch(input$format,PDF = pdf_document(),
                                                   HTML = html_document(), 
                                                   Word = word_document()
                                                   )
                              )
                    
                file.rename(out, file)
            }
            )
                 
})