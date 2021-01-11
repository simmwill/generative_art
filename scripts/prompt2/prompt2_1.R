# Prompt 2
# Piece 1

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

flower <- tibble(
  x = -10:10 %>% .[. != 0],
  y = 10+-abs(5 / seq(-10, 10)) %>% .[. != -Inf],
  xend = 0,
  yend = 0
)

green <- tibble(
  x = -10:10 %>% .[. != 0],
  y = -10--abs(30 / seq(-10, 10)) %>% .[. != -Inf],
  xend = 0,
  yend = 0
)

# plot --------------------------------------------------------------------

flower_plot <- 
  ggplot() + 
  ggforce::geom_diagonal(
    data = green,
    aes(
      x = x,
      y = y,
      xend = xend,
      yend = yend
    ),
    color = "#2C6E49"#BACDB0"#87A776"#476A6F"
  ) +
  ggforce::geom_diagonal(
    data = flower,
    aes(
      x = x,
      y = y,
      xend = xend,
      yend = yend
    ),
    color = "#E88D67"
  ) +
  # labs(
  #   caption = "Prompt 2, Piece 1\nWill Simmons"
  # ) +
  # coord_polar() + # turns this into an angel hehe
  theme(
    plot.background = element_rect(fill = "#F2EDEB"),
    panel.background = element_rect(fill = "#F2EDEB"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#1D4930",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

# export ------------------------------------------------------------------

flower_plot +
  labs(
    caption = "Prompt 2, Piece 1\nWill Simmons"
  ) 

  ggsave(filename = "prompt2_piece1.pdf",
         path = here::here("drafts")
  )

# for README
flower_plot +
  labs(
    caption = "Will Simmons"
  ) +
  theme(
    plot.caption = element_text(family = "Roboto",
                                color = )
  )

  ggsave(filename = "prompt2_piece1.png",
         path = here::here("drafts"),
         dpi = 600
  )
