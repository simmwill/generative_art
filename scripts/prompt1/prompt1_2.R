# Prompt 1
# Piece 2

# packages ----------------------------------------------------------------

# data mgmt
library(tibble)
library(magrittr)

# plotting
library(ggplot2)
library(ggforce)

extrafont::loadfonts()

# setup -------------------------------------------------------------------

vectors <- tibble(
  df_up = 1:100,
  df_dn = 100:1
)

# plot --------------------------------------------------------------------


set.seed(22)
vectors %>% 
  dplyr::slice_sample(n=50) %>%
  ggplot(
    aes(
      x = df_up,
      # y = df_dn
    )
  ) +
  coord_polar(
    theta = "x",
    start = 1.57  # 180 degrees in radians
  ) +
  # geom_line(
  #   aes(
  #     x = df_up,
  #     y = df_dn
  #   )
  # ) +
  geom_bar(
    aes(y = df_dn),
    fill = "#F0E5BC",
    stat = "identity"
  ) +
  labs(
    caption = "Prompt 1, Radial 2\nWill Simmons"
  ) +
  # theme_void() +
  theme(
    plot.background = element_rect(fill = "#960200"),
    panel.background = element_rect(fill = "#960200"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#F0E5BC",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

ggsave(filename = "prompt1_radial2.pdf",
       path = here::here("drafts"),
       width = 6,
       height = 6
)