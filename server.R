library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
   
   	#DRAW A SELECTED NUMBER (NREPS) OF CONFIDENCE INTERVALS;
#BASED ON A SAMPLE OF N SCORES FROM A NORMAL DIST., M = 5, SD = 2;
M <- 5;
SD <- 2;
N <-10;
NREPS <- input$Nreps;
#CHOOSE THE Z VALUE CORRESPONDENCE TO THE CONFIDENCE LEVEL YOU WANT;

z <- qnorm((1 + input$p)/2);
Caught <- c(1:NREPS);
plot(c(M,M), c(0,NREPS), xlim = c(1,9), type = "n", xlab = "Values of the Sample Mean", ylab = "Replication" );
lines(c(M,M), c(0,NREPS), col = "blue");
#PLOT  EACH CONFIDENCE INTERVAL;
for (i in 1:NREPS)    { mn<-mean(rnorm(N,M,SD)); 	
	if( abs(mn-M) > z*SD/N^.5) {lines(c(mn-z*SD/N^.5,mn+z*SD/N^.5),c(i,i), col = "red")} else
	lines(c(mn-z*SD/N^.5,mn+z*SD/N^.5),c(i,i));
	#FOR EACH CI RECORD WHETHER THE TRUE MEAN WAS IN THE INTERVAL;
	Caught[i] <- (M>= mn-z*SD/N^.5)&(M<= mn+z*SD/N^.5)};
	Caught;
#PRINT THE PROPORTION OF CI'S THAT CAUGHT THE TRUE MEAN AT THE BOTTOM OF THE GRAPH;
prop <- as.character(mean(Caught));	
text(8, 0 ,  labels = prop);
round(mean(Caught), 3);

 
   
  })
  
})

