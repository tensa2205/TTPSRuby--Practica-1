class Palabra
    def initialize(pal)
        exp_regular = / +\s+[0-9A-Za-z] /
        if pal =~ 
        @palabra = pal
    end
end

palabra = "Hola "
exp_regular = / +\s[0-9A-Za-z] /
mach = palabra =~ exp_regular
puts mach
end