# Setup

To run the kata just execute [`main.rb`](../app/main.rb) with the follow command

```bash
    ruby main.rb 10 10
```

In the command the first number is the width size and the next numbers is the heigth size, the script just acept integers greater than 0, if one or more arguments do not match with the format the script show a message like this

```bash
  usage: ruby main.rb <y_size> <x_size>
  use only Integers greater than 0
```

When the script is running it show

```bash
. . . | - - . . - . 
- . . - . - - . . . 
. . - . . . . . . . 
- . . - | . . . . . 
. - . | . V . . . . 
- . - | .   | . . . 
. | . . . . . . | . 
. . . | . . . | - . 
- - . . - . - | . - 
. . . . . . . . . . 
rotate?: 
```

To rotate type one of the follow directions `up` `down` `left` `rigth` , if the input not match with the directions the pacman just move one step in the rotation, the default rotation is `up`, the pacman move with aech tick
