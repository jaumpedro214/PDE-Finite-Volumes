# One-dimensional hyperbolic PDE - Numerical Solver 
Finite Volumes method to solve hyperbolic PDE

## Dependences
  * Codes made in Fortran 90
  * gfortran Compiler
  * Plot solution using Matlab/Octave
 
## How to use
### Running code
  The code runs in Fortran 90, you will need a fortran compiler, such as gfortran.
  The problem conditions are changed in code, then you'll need to compile every change:
  
  ```
    gfortran 1d_vol_fin.F90 -o <your_exe_name>
  ```
  
  Then, run:
  
  * On Windows
  ```
    your_exe_name.exe
  ```
  * On Linux 
  ```
    ./your_exe_name.out
  ```
  
 After this, the code will generate three .out files.
 * output_arq.out :
 Contain the solution for each point in each time step
 * plot_info.out :
 Contain important information about the mesh and time step that will be used to plot solutions.


### Plotting solution
You will need Matlab or Octave to run the .m code. Once with Matlab/Octave opened, just run the code with execute button and watch the solution change in time.


 ## Mathematical model
 
 In this code, we solve the equation below unsing a classic _Finite Volumes Method_.
 
 ![Main Equation](https://latex.codecogs.com/gif.latex?%5Cbegin%7Bcases%7D%20%5Cdisplaystyle%20%5Cphi%28x%29%5Cfrac%7B%5Cpartial%20u%28x%2Ct%29%7D%7B%5Cpartial%20t%7D%20&plus;%20%5Cfrac%7B%5Cpartial%20F%28u%2Cx%29%7D%7B%5Cpartial%20t%7D%20%3D%20f%28u%2Cx%29%20%5C%5C%20u%28x%2C0%29%20%3D%20u_0%28x%29%20%26%20x%20%5Cin%20%5B0%2CL%5D%5C%5C%20u%280%2Ct%29%20%3D%20u_1%28t%29%20%5C%5C%20%5Cend%7Bcases%7D)
 
 The first part is the mathematical model itself, it describes, for example, de physical behavior of the system. The second and third part are, respectively, the conditon of system when time is 0, initial condition, and the value of function over the time in x equal 0, border conditon.
 
 ## Problems variables/conditions
 
 ### Variables and function in code
 
 How functions and variables are refhered in code
 
 * ![](https://latex.codecogs.com/gif.latex?F%28u%2Cx%29) , Function FU(u,x)
 * ![](https://latex.codecogs.com/gif.latex?%5Cphi%28u%2Cx%29), Function phi(x)
 * ![](https://latex.codecogs.com/gif.latex?f%28u%2Cx%29), Function flux(u,x)
 * L is the domains lenght
 * nodes_x is the number of points in domain that the solution is finded /
 * delta_x is the domain discretization size, the space between two points
 * delta_t is the time between two space solutions
 * time_steps is the amount of "times" wich solutions will be calculated
 
 ### Method Stability
 
  For a numerical stability whe need to satisfy a condition 
  
  ![](https://latex.codecogs.com/gif.latex?%5CDelta%20t%20%5Cleq%20k_%7Bestability%7D%5CDelta%20x)
  
  This _k_ coefficient depend on problems conditions, and you can adjust by changing the _CFL_ variable. In case of "explosive" numerical errors you can lower this coefficient, aproximating it to zero, or manually changing _delta time_ size. 
