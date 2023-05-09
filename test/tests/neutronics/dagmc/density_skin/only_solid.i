[Mesh]
  type = FileMesh
  file = ../mesh_tallies/slab.e
  allow_renumbering = false
[]

[AuxVariables]
  [density]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[Problem]
  type = OpenMCCellAverageProblem
  verbose = true
  initial_properties = xml
  tally_type = cell
  tally_blocks = '1 2'
  solid_blocks = '1 2'
  solid_cell_level = 0
  power = 100.0

  skinner = moab
[]

[UserObjects]
  [moab]
    type = MoabSkinner

    # just one temperature bin
    temperature_min = 0.0
    temperature_max = 1000.0
    n_temperature_bins = 1
    temperature = temp

    density_min = 0.0
    density_max = 100.0
    n_density_bins = 4
    density = density

    build_graveyard = true
  []
[]

[Executioner]
  type = Steady
[]