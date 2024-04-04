function aes(args...; kwargs...)
    col_transforms = Dict()
    aes_args = Symbol[]
    aes_kwargs = Dict{String, Symbol}()

    for arg in args
        if arg isa Pair
            push!(col_transforms, arg)
            push!(aes_args, arg[1])
        else
            push!(aes_args, Symbol(arg))
        end
    end

    d = Dict(kwargs)

    for (k, v) in d
        if v isa Pair
            push!(col_transforms, v)
            push!(aes_kwargs, String(k) => Symbol(v[1]))
        else
            push!(aes_kwargs, String(k) => Symbol(v))
        end
    end
        
    return Aesthetics(
            aes_args,
            aes_kwargs,
            col_transforms)
end

macro aes(exprs...)
    aes_dict = Dict{String, Symbol}()
    positional = Symbol[]
    for aes_ex in exprs
        if aes_ex isa Expr
            if aes_ex.args[2] isa QuoteNode
                aes_dict[String(aes_ex.args[1])] = aes_ex.args[2].value
            elseif aes_ex.args[2] isa String
                aes_dict[String(aes_ex.args[1])] = Symbol(aes_ex.args[2])
            else
                aes_dict[String(aes_ex.args[1])] = aes_ex.args[2] 
            end
        elseif aes_ex isa Symbol
            push!(positional, aes_ex)
        elseif aes_ex isa String
            push!(positional, Symbol(aes_ex))
        end
    end
    return Aesthetics(positional, aes_dict, Dict())
end

@eval const $(Symbol("@es")) = $(Symbol("@aes"))