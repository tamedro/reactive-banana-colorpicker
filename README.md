# Reactive-banana-colorpicker
So, uh, not really a colorpicker but whatever I am sticking with the name.

This is my first foray into reactive banana, an FRP DSL for haskell. It is based on the project https://github.com/HeinrichApfelmus/reactive-banana/blob/master/reactive-banana-wx/src/Arithmetic.hs

There is not likely any practical use of this program however I think it can illustrate a couple novel FRP concepts for those new to arena.

Namely currying behaviours into a constructor. The ultimate "behaviour" (in the FRP sense) of this program is the output color of the display. The WX color constructor requires 3 numeric inputs. Sense each of our colors is an separate behaviourText input, the constructor needs to be "lifted". This is done by currying in the first argument with normal functor '<$>' which should give us back a Constructor wrapped in a behaviour. Because at this point our constructor is wrapped we must use the applicatve functor '<*>' which is aware of this wrapping. Passing the last two arguments, (green and blue values) we get back our behaviour color object which safely types to the sink. 

I can't claim this is the best way to achieve 

## Installation
TODO: Describe the installation process

## Usage
Enter decimal values for each respective color to combine into an output. Invalid values go to 0

## Credits
Based on the project https://github.com/HeinrichApfelmus/reactive-banana/blob/master/reactive-banana-wx/src/Arithmetic.hs

## License
Use freely for whatever
