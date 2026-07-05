# LorenzAtractor

This is a representation of Lorenz Atractor in octave, an "animation" where you can see
the trajectorie of the sistem with two values of rho and two initial conditions diferents

## Use of code
To run the animation you need [GNU Octave](https://octave.org/download) choose a version for 
your os, if you are user of linux use (this is for fedora but you can cahnge `dnf` according 
your distribution):
```bash
sudo dnf install octave -y
```
After install and prove that GNU Octave works now you can dowload [LorenzAtractor](LorenzAtractor.m), 
you can explore the code before run it in GNU Octave, you can change things like colors, default values for
rho1, rho2 and initial conditions.

When you run the code rho1 and rho2 must be real values, and the inital condition must be a vector like `[1, 0.5, 0]`

# Visualization
![Valores rho1 = 25 y rho2 = 35](GIFs/lorez_atractor2.gif)
