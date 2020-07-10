# activate current environment
@info "ACtivating environment..."
using Pkg; Pkg.instantiate(); Pkg.activate()
@info "\tdone!"

# load dependencies
@info "Loading dependencies..."
@time using AnalyticMHDTestSolutions
@time using BuildShocktubes
@info "\tdone!"

"""
    Sod Shock
"""
glass_file = "/path/to/glass.file"

out_file = "path/to/out.file"

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
glass_file = "/path/to/glass.file"

out_file = "path/to/out.file"

param = ShockParameters(glass_file,                    
                        out_file,                      
                        [1.0, 0.1],                    # U
                        [0.0 1.0 0.0; 0.0 -1.0 0.0])   # B

setup_shocktube(param)


"""
    Sod shock with angle between magnetic field vector and shock normal
"""
glass_file = "/path/to/glass.file"

out_file = "path/to/out.file"

Mach_number = 10.0 # change accordingly

riemann_par = RiemannParameters(Ul=100.0, Mach=Mach_number, t=1.5)

theta = 45.0  # degrees

B = get_bfield_from_angle(theta)

param = ShockParameters(glass_file,
                        out_file,
                        [riemann_par.Ul, riemann_par.Ur],
                        [B';  B'] )

setup_shocktube(param)


"""
    Sod Shock with turbulent magnetic field
"""
glass_file = "/path/to/glass.file"

out_file = "path/to/out.file"

Mach_number = 100.0

riemann_par = RiemannParameters(Ul=100.0, Mach=Mach_number, t=1.5)


param = ShockParameters(glass_file,            
                        out_file,              
                        [riemann_par.Ul, riemann_par.Ur],    # U
                        B0   = 1.e-20,
                        turb = true )      

setup_shocktube(param)