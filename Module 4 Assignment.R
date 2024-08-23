#Step 4: Integration of visualization 1 (Most Watched Genres) into R

# Set your file path
cleaned_file_path <- 'C:/Users/user/Downloads/cleaned_netflix_shows_movies_data.csv'

# Read the CSV file into a dataframe
netflix_data <- read.csv(cleaned_file_path)

#install.packages("ggplot2")
#Load library
library(ggplot2)

#Data is loaded into a data frame called netflix_data

# Visualization 1: Most watched genres
# Count genres
genre_counts <- table(netflix_data$listed_in)
top_genres <- head(sort(genre_counts, decreasing = TRUE), 10)

# Create a data frame for plotting
genre_df <- data.frame(genre = names(top_genres), count = as.numeric(top_genres))

# Plot
ggplot(genre_df, aes(x = count, y = reorder(genre, count), fill = genre)) +
  geom_bar(stat = "identity") +
  labs(title = "Most Watched Genres",
       x = "Count",
       y = "Genre") +
  theme_minimal() +
  theme(legend.position = "none")
