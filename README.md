# SaveFigs

[![Build Status](https://travis-ci.com/harryscholes/SaveFigs.jl.svg?branch=master)](https://travis-ci.com/harryscholes/SaveFigs.jl)
[![Codecov](https://codecov.io/gh/harryscholes/SaveFigs.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/harryscholes/SaveFigs.jl)

Save Plots.jl figures easily in multiple formats and sizes.

# Installation

```julia
] add https://github.com/harryscholes/SaveFigs.jl
```

## Examples

```julia
julia> using Plots, SaveFigs

julia> fig = plot(rand(10))

julia> savefigs(fig, "fig1", "pdf", "png")

julia> plot(rand(100))

julia> savefigs("fig2", :pdf, :png; sizes=[(300,300), (600,600)])

```
