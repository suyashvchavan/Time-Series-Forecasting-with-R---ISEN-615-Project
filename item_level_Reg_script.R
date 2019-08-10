library(readxl)
data <- read_excel("item_level_outputs/Regression_item_level_inputdata.xlsx")
data <- data <- read_xlsx("Arconic Data 1.xlsx",sheet = "Historical+Open")
data <- as.data.frame(data)

prod_fam_items <- data %>% distinct(product_family, item_no)
prod_fam_items <- as.data.frame(prod_fam_items)

pred <- as.vector(NA)
i <- 1
for (i in 1:length(item_group)) {
 
    data1 <- new[new$Product_Family == item_group[i],]
    
    lm.fit <- lm(Demand~ data1$Month, data = data1) 
    pred1 <- predict(lm.fit, newdata = data1)
    
    pred1 <- as.vector(pred1)
    
    pred <- c(pred, pred1)
}

pred2 <-  pred[2:4861]

new$ reg_pred_demand <- pred2
new <- subset(new,)
write.csv(data, 'regression_output.csv')

