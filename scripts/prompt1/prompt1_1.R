# Prompt 1
# Piece 1

# packages ----------------------------------------------------------------

# data mgmt
library(tibble)
library(magrittr)

# plotting
library(ggplot2)
library(wesanderson)

# setup -------------------------------------------------------------------

vectors <- tibble(
  df_up = 1:100,
  df_dn = 100:1
)

# plot --------------------------------------------------------------------

set.seed(22)
prompt1 %>% 
  dplyr::slice_sample(n=50) %>%
  ggplot(
    aes(
      x = df_up,
      # y = df_dn
    )
  ) +
  coord_polar(
    theta = "y",
    start = 3.14  # 180 degrees in radians
  ) +
  # geom_line(
  #   aes(
  #     x = df_up,
  #     y = df_dn
  #   )
  # ) +
  geom_bar(
    aes(y = df_dn),
    fill = "#960200",
    stat = "identity"
  ) +
  labs(
    caption = "Prompt 1, Radial 1\nWill Simmons"
  ) +
  # theme_void() +
  theme(
    plot.background = element_rect(fill = "#F0E5BC"),
    panel.background = element_rect(fill = "#F0E5BC"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#960200",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

# export ------------------------------------------------------------------

ggsave(filename = "prompt1_radial1.pdf",
       path = here::here("drafts")
)
