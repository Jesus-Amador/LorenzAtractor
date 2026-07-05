![GNU Octave](https://shields.io/badge/GNU_Octave-e37114?logo=octave)


# LorenzAtractor

This is a representation of Lorenz Atractor in octave, an "animation" where you can see
the trajectorie of the sistem with two values of rho and two initial conditions diferents

## Use of code
To run the animation you need [GNU Octave](https://octave.org/download) choose a version for 
your os, if you are user of linux use (this is for fedora but you can change it according to your distribution)
```bash
sudo dnf install octave -y
```
After install and prove that GNU Octave works now you can dowload [LorenzAtractor](LorenzAtractor.m), 
you can explore the code before run it in GNU Octave, you can change things like colors, default values for
rho1, rho2 and initial conditions.

When you run the code rho1 and rho2 must be real values, and the inital condition must be a vector like `[1, 0.5, 0]`

## Visualization
<div id="Ejemplo">
  <img src="Gifs/lorenz_atractor4.gif">
</div>

As you can see this is an example of what you will watch in your screen, you can modify the speed od the animation, color and the text and you will see something similar.

In the example the speed is to save the gif, but if you won't save the gif you can watch it with a better quality ans slower than the [example](#Ejemplo)
