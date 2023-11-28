module TidierPlots

# From Makie, get the functions that AoG needs to plot
using Makie: Text, Violin, 
    BarPlot, Contour, Heatmap, Rangebars, BoxPlot,
    HLines, VLines, Lines, Stairs, Scatter

# CairoMakie, the default backend for Makie
using CairoMakie

# This project mostly wraps: 
using AlgebraOfGraphics

# DataFrames are the main supported data type
using DataFrames

# to reexport the Makie default themes
using Reexport

# Needed for color scales to work correctly
using Colors

include("structs.jl")

include("addplots.jl")
include("aes.jl")
include("draw.jl")
include("extract_aes.jl")
include("facets.jl")
include("geom.jl")
include("ggplot.jl")
include("ggsave.jl")
include("interop.jl")
include("labs.jl")
include("scales.jl")
include("themes.jl")
include("show.jl")
include("util.jl")

include("geoms/geom_template.jl")
include("geoms/geom_bar.jl")
include("geoms/geom_boxplot.jl")
include("geoms/geom_contour.jl")
include("geoms/geom_errorbar.jl")
include("geoms/geom_density.jl")
include("geoms/geom_path.jl")
include("geoms/geom_point.jl")
include("geoms/geom_smooth.jl")
include("geoms/geom_text.jl")
include("geoms/geom_violin.jl")

@reexport using Makie: theme_black, theme_dark, theme_ggplot2, theme_light, theme_minimal
@reexport using Chain

# functions

export draw_ggplot, geom_to_layer, ggplot_to_layers, layer_equal, ggplot, ggsave
export TidierPlots_set
export Layer, Layers
export @aes, @es, aes
export geom_template

# geoms

export geom_bar
export geom_col
export geom_histogram
export geom_point
export geom_path
export geom_line
export geom_step
export geom_smooth 
export geom_errorbar
export geom_errorbarh
export geom_violin
export geom_boxplot
export geom_contour
export geom_tile
export geom_text
export geom_label
export geom_density
export geom_hline
export geom_vline

# scales 

export labs, lims, c
export facet_wrap, facet_grid
export scale_x_continuous, scale_y_continuous
export scale_x_log10, scale_y_log10, scale_x_log2, scale_y_log2, scale_x_log, scale_y_log  
export scale_x_logit, scale_y_logit  
export scale_x_pseudolog10, scale_y_pseudolog10, scale_x_Symlog10, scale_y_Symlog10 
export scale_x_reverse, scale_y_reverse, scale_x_sqrt, scale_y_sqrt
export scale_colour_continuous, scale_color_continuous
export scale_colour_discrete, scale_color_discrete
export scale_colour_manual, scale_color_manual

const plot_log = Ref{Bool}(true)
const plot_show = Ref{Bool}(true)
const plot_pluto = Ref{Bool}(true)

end