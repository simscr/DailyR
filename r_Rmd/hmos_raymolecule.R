
# HMOs and {raymolecule} --------------------------------------------------

pacman::p_load(raymolecule, rayvertex)

shiny_toon_material <- rayvertex::material_list(
  type = "toon_phong",
  toon_levels = 3,
  toon_outline_width = 0.1
)

read_sdf(here::here("data", "hmos", "twofl.sdf")) %>%
  generate_full_scene(scale = 1.5) %>%
  render_model(width = 1800, height = 1800)

read_sdf(here::here("data", "hmos", "twofl.sdf")) %>%
  generate_full_scene(
    pathtrace = FALSE, scale = 1.5,
    material_vertex = shiny_toon_material
  ) %>%
  render_model(width = 1800, height = 1800, background = "white")


read_sdf(here::here("data", "hmos", "threefl.sdf")) %>%
  generate_full_scene(
    pathtrace = FALSE, scale = 1.5,
    material_vertex = shiny_toon_material
  ) %>%
  render_model(width = 800, height = 800, background = "grey66")

read_sdf(here::here("data", "hmos", "threesl.sdf")) %>%
  generate_full_scene(
    pathtrace = FALSE, scale = 1.5,
    material_vertex = shiny_toon_material
  ) %>%
  render_model(width = 800, height = 800, background = "white")

read_sdf(here::here("data", "hmos", "sixsl.sdf")) %>%
  generate_full_scene(
    pathtrace = FALSE, scale = 1.5,
    material_vertex = shiny_toon_material
  ) %>%
  render_model(width = 1800, height = 1800, background = "white")
