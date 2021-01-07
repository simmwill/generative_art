# Will Simmons
#
# Scope: Exploring generative art visualization
#
# packages ----------------------------------------------------------------

# data mgmt
library(tibble)
library(magrittr)

# plotting
library(ggplot2)
library(wesanderson)

# Prompt 1 ----------------------------------------------------------------

# Make an interesting visualization using nothing but numeric vector(s) 1 to 100

# setup 

prompt1 <- tibble(
  df_up = 1:100,
  df_dn = 100:1
)

# plotting

## linear
prompt1 %>% 
  ggplot() +
  geom_linerange(
    aes(
      x = df_dn, 
      ymin = 0,
      ymax = df_up+df_dn^2
    ),
    color = "black"
  ) +
  geom_linerange(
    aes(
      x = df_up - 0.5,
      ymin = 0,
      ymax = df_up+df_dn^2
    ),
    color = "black"
  ) + 
  geom_linerange(
    aes(
      x = df_dn, 
      ymin = 0,
      ymax = df_up - df_dn^1.9
    ),
    color = "gray"
  ) +
  geom_linerange(
    aes(
      x = df_up - 0.5,
      ymin = 0,
      ymax = df_up - df_dn^1.9
    ),
    color = "gray"
  ) + 
  theme_void()

## radial 1
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

ggsave(filename = "prompt1_radial1.pdf",
       path = here::here("drafts")
)

## radial 2
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
       path = here::here("drafts")
)

# make wave:

wave <- tibble(
  df_up = seq(1, 100, length = 10000),
  df_dn = seq(100, 1, length = 10000)
)

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
    plot.background = element_rect(fill = "#F2EDEB"),
    panel.background = element_rect(fill = "#F2EDEB"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#274060",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

ggsave(filename = "prompt1_radial3.pdf",
       path = here::here("drafts")
)

# spiral - figure something out with this one
prompt1 %>% 
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
  geom_line(
    aes(
      x = df_up,
      y = df_dn
    )
  ) +
  theme(
    plot.background = element_rect(fill = "#F2EDEB"),
    panel.background = element_rect(fill = "#F2EDEB"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#274060",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 


# playing around with geom_diagonal

# flower
ggplot() + 
  ggforce::geom_diagonal(
    aes(
      x = -10:10 %>% .[. != 0],
      y = 10+-abs(5 / seq(-10, 10)) %>% .[. != -Inf],
      xend = 0,
      yend = 0
    ),
    color = "#E88D67"
  ) +
  ggforce::geom_diagonal(
    aes(
      x = -10:10 %>% .[. != 0],
      y = -10--abs(30 / seq(-10, 10)) %>% .[. != -Inf],
      xend = 0,
      yend = 0
    ),
    color = "#476A6F"#2C6E49"#BACDB0"
  ) +
  # coord_polar() +
  theme(
    plot.background = element_rect(fill = "#F2EDEB"),
    panel.background = element_rect(fill = "#F2EDEB"),
    panel.grid = element_blank(),
    plot.caption = element_text(color = "#274060",
                                size = 5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 

