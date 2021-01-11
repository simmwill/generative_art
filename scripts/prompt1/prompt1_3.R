# Prompt 1
# Piece 3

# packages ----------------------------------------------------------------

# data mgmt
library(tibble)
library(magrittr)

# plotting
library(ggplot2)
library(ggforce)
library(wesanderson)

extrafont::loadfonts()

# setup -------------------------------------------------------------------

wave <- tibble(
  df_up = seq(1, 100, length = 10000),
  df_dn = seq(100, 1, length = 10000)
)

# plot --------------------------------------------------------------------

wave_plot <-   
  wave %>% 
  # filter(df_up %% 2 == 0) %>% 
  # dplyr::slice_sample(n=50) %>%
  # tibble(x = 3:5) %>% 
  ggplot(
    aes(
      x = df_up,
      # y = df_dn
    )
  ) +
  coord_polar(
    theta = "y",
    start = 4.71  # 180 degrees in radians
  ) +
  # geom_line(
  #   aes(
  #     x = df_up,
  #     y = df_dn
  #   )
  # ) +
  geom_bar(
    aes(y = df_up/0.1/df_dn*2),
    fill = "#274060",
    stat = "identity"
  ) +
  labs(
    caption = "Prompt 1, Radial 3\nWill Simmons"
  ) +
  scale_y_continuous(limits = c(0, 2200)) +  # 400
  theme(
    plot.background = element_rect(fill = "#FFFFFF"),
    panel.background = element_rect(fill = "#FFFFFF"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#274060",#274060",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

# export ------------------------------------------------------------------

ggsave(wave_plot,
       filename = "prompt1_radial3.pdf",
       path = here::here("drafts")
)

# for README
wave_plot +   
  labs(
    caption = "Will Simmons"
  ) +
  theme(
    plot.caption = element_text(family = "Roboto")
  )

ggsave(filename = "prompt1_piece3.png",
       path = here::here("drafts"),
       dpi = 600
)
