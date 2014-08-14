##Import files
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")
col_names <- read.table("./features.txt")
col_names <- col_names[,2]
col_names <- as.character(col_names)

test_x[,562] <- test_y
col_idx <- grep("V1\\.1", names(test_x))
test_x <- test_x[, c(col_idx, (1:ncol(test_x))[-col_idx])]

train_x[,562] <- train_y
col_idx <- grep("V1\\.1", names(train_x))
train_x <- train_x[, c(col_idx, (1:ncol(train_x))[-col_idx])]

merged_data <- merge(test_x, train_x, all=TRUE)
col_names <- c("activity", col_names)
colnames(merged_data) <- col_names

col_idx <- grep("mean\\(|std\\(|activity", col_names)

new_data <- merged_data[col_idx]

idx <- 1
for (x in new_data[,1]) {
  if (as.numeric(paste(x)) == 1) {
    new_data[idx, 1] <- "WALKING"
  }
  else if (as.numeric(as.character(x)) == 2) {
    new_data[idx, 1] <- "WALKING_UPSTAIRS"
  }
  else if (as.numeric(as.character(x)) == 3) {
    new_data[idx, 1] <- "WALKING_DOWNSTAIRS"
  }
  else if (as.numeric(as.character(x)) == 4) {
    new_data[idx, 1] <- "SITTING"
  }
  else if (as.numeric(as.character(x)) == 5) {
    new_data[idx, 1] <- "STANDING"
  }
  else if (as.numeric(as.character(x)) == 6) {
    new_data[idx, 1] <- "LAYING"
  }
  
  idx <- idx + 1
}

final_data <- new_data
FINAL <- data.frame(ac_labels)
ac_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

for (i in 1:6) {
  vec <- c()
  add <- 0
  x <- grep(ac_labels[i], final_data[,1])
  for (j in 2:67) {
    #y <- mean(as.numeric(paste(final_data[,j])))
    for (f in x[1]:x[length(x)]) {
      add <- add + as.numeric(paste(final_data[f,j]))
    }
    vec <- c(vec, add / length(x))
  }
  for (k in 2:67) {
    FINAL[i, k] <- vec[k - 1]
  }
}

col_names2 <- c()
for (l in col_idx) {
  col_names2 <- c(col_names2, col_names[l])
}

colnames(FINAL) <- col_names2



  

