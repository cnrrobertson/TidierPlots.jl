struct Geom
    aes::Dict
    args::Dict
    required_aes::AbstractArray
    special_aes::Dict
    data::Union{Nothing, DataFrame}
    visual::Symbol
    axis_options::Dict
    aes_function::Function
end

struct GGPlot
    geoms::AbstractArray
    default_aes::Dict
    data::Union{Nothing, DataFrame}
    axis_options::Dict
    theme::Attributes
end

struct Aesthetics
    positional::AbstractArray
    named::Dict
end