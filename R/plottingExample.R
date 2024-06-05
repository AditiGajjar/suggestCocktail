# Load necessary libraries
library(suggestCocktail)
library(ggplot2)
library(gganimate)
library(dplyr)
library(plotly)

# list of cocktails
cocktail_data <- suggestCocktail::load_recipes()

vodka_cocktails <- cocktail_data %>%
  filter(grepl("Vodka", Ingredients, ignore.case = TRUE))

# Create a summary data frame
category_summary <- vodka_cocktails %>%
  group_by(strCategory) %>%
  summarise(count = n())

# Create a ggplot object
p <- ggplot(category_summary, aes(x = strCategory, y = count, fill = strCategory)) +
  geom_bar(stat = "identity") +
  labs(title = 'Vodka Cocktails by Category', x = 'Category', y = 'Number of Cocktails') +
  theme_minimal() +
  transition_states(strCategory, transition_length = 2, state_length = 1) +
  labs(subtitle = 'Category: {closest_state}')

# Animate the plot
animated_plot <- animate(p, nframes = 100, fps = 10)

# Save the animation as a GIF
anim_save("animated_vodka_cocktails.gif", animated_plot)


animated_plot



# Interactive bar plot
p <- plot_ly(category_summary, x = ~strCategory, y = ~count, type = 'bar',
             text = ~paste("Number of Cocktails:", count),
             hoverinfo = 'text',
             marker = list(color = 'rgb(158,202,225)', line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
  layout(title = "Number of Vodka Cocktails by Category",
         xaxis = list(title = "Category"),
         yaxis = list(title = "Number of Cocktails"))


p
