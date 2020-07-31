library(shiny)

dat<-matrix(c(33, 17, 10 ,20 , 20), ncol = 1, nrow = 5)

shinyServer(function(input, output) {
    output$user_data <- renderText({
        
        paste0("Your 1st Semester Marks are ", "<strong>", input$semi1, "</strong>", 
               br(),  
               "Your 2nd Semester Marks are ", "<strong>", input$semi2, "</strong>",
               br(),
               "Your Final Exam Marks are", "<strong>", input$final, "</strong>", 
               br(),
               "Your Practical Exam Marks are ", "<strong>", input$pract, "</strong>",
               br(),
               "Your Sports Marks are ", "<strong>", input$sport, "</strong>",
               br(),
               "Your Community Development Marks are", "<strong>", input$commd, "</strong>")
    })
    
    output$results <- renderText({
        number = round((input$semi1*.2)+(input$semi2*.2)+(input$final*.4)+(input$pract*.1)+(input$sport*.05)+(input$commd*.05))
        if      (number <  33.0) cond = "<span style='color: red'>FAIL</span>"
        else if (number <= 50.0 & number>33) cond = "<span style='color: blue'>GRADE C</span>"
        else if (number <= 60 & number>50) cond = "<span style='color: yellow'>GRADE B</span>"
        else if (number <= 80 & number >60) cond = "<span style='color: grey'>GRADE A</span>"
        else                  cond = "<span style='color: black'>GRADE A+ (Excellent)</span>"
        paste0("Your Overall Percentage is ", "<strong>", number, "</strong>","<br>", " It is ", "<strong>", cond, "</strong>", " according to ", "ABCD Standard ", "</a>"
        )
        
    })
    
    output$plot <- renderPlot({
        number = round((input$semi1*.2)+(input$semi2*.2)+(input$final*.4)+(input$pract*.1)+(input$sport*.05)+(input$commd*.05))
        if (number>100) {number=100}
        barplot(dat, horiz = TRUE, yaxt="n", xlab = "number", main="Your Performance", col=c("red", "blue", "yellow", "grey", "black"))
        lines(x=c(number, number), y=c(0,1.2), col="white", lwd=4)
    })
    
    
})