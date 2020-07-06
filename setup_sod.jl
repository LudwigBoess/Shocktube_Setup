# activate current environment
using Pkg; Pkg.instantiate()

# load dependencies
@time using AnalyticMHDTestSolutions
@time using BuildShocktubes
@time using GadgetIO

"""
    Sod Shock
"""
glass_file = "/home/moon/lboess/ICs/Glass/glass_c6_n600.ic"

out_file = "/HydroSims/ocean2/lboess/4Klaus/shock_c6_n600_M-100_0.ic"

Mach_number = 100.0

riemann_par = RiemannParameters(Ul=100.0, Mach=Mach_number, t=1.5)

param = ShockParameters(glass_file,             # glass file
                        out_file,               # output file
                        [riemann_par.Ul, riemann_par.Ur])      # U

setup_shocktube(param)


"""
    Ryu&Jones MHD Shock
"""
# Example 5a:
glass_file = "/home/moon/lboess/ICs/Glass/glass_c6_n600.ic"

out_file = "/HydroSims/ocean2/lboess/4Klaus/RJ5a_n600.ic"

param = ShockParameters(glass_file,             # glass file
                        out_file,               # output file
                        [1.0, 0.1],
                        [0.0 1.0 0.0; 0.0 -1.0 0.0])      # U

setup_shocktube(param)