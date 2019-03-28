module SaveFigs

export savefigs

using Plots

function savefigs(fig, fname::AbstractString, formats...; sizes=nothing)
    isdir(fname) || mkdir(fname)
    if isnothing(sizes)
        dir = fname
        _saveformats(fig, dir, fname, formats)
    else
        dir = pwd()
        _saveformats_sizes(fig, dir, fname, formats, sizes)
    end
end

function savefigs(fname::AbstractString, formats...; sizes=nothing)
    savemultifigs(Plots.current(), fname, formats...; sizes=sizes)
end

function _saveformats(fig, dir, fname, formats)
    for f = formats
        savefig(fig, joinpath(dir, "$(fname).$(f)"))
    end
end

function _saveformats_sizes(fig, dir, fname, formats, sizes)
    # Save original size
    _saveformats(fig, fname, fname, formats)
    # Resize and save
    for (w,h) = sizes
        plot!(fig, size=(w,h))
        _saveformats(fig, fname, "$(fname)_$(w)x$(h)", formats)
    end
end

end
