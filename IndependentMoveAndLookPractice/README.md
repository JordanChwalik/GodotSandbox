# Contents
1. Original Problem
2. Learned Solution
3. Additinal Learning


# Original Problem
The problem I aimed to tackle in this project was learning how to allow a player character to move in a direction they are not facing.
The idea behind this is that a player may want to attack while walking backwards or if they are not moving but are planning on using
a projectile, it would feel unnatural if their player character did not rotate in the direction of the projectile they wish to use.
The biggest challenge with this learning project was finding a way to not only register the input, but also to rotate a point that
would be used to instantiate any projectiles the player would want to use.

# Learned Solution
To solve this problem I began by overriding the native _Input function to check what kind of input is being given and update a varible
based on whether the event came from a mouse, keyboard, or controller (I used an Xbox controller for this testing, other controller
types have currently not been tested, but using the principles learned here could be implemented). Based on where the input comes from,
a function is called that registers the strength of a directional input and then calls a third method to determine what direction the
player is facing. This third method then moves the position of the marker to the appropriate position.

# Additional Learning
Going into this project I already knew that Godot used radians instead of degrees to calculate the angles between two objects. What I
did not know, however; Godot uses radians in the range [-PI, PI] instead of a range from [0, 2PI]. As a result of this found knowledge,
I had to create a tree that determined the appropriate ranges to check what direction the player is facing. In my code here I used
print statements to show where the player is facing. When implemented into projects, I would plan to update a sprite or animation player
to display the player facing the chosen direction.

I also discovered the power of the Input.get_vector() function while creating this project. The function breaks the tree I've been using
previously to determine the strength of a velocity vector into a single line of code. This new function also allows for vectors with a
length smaller than 1 which allows players to move more slowly if they so desire. While I doubt it will be a commonly used feature,
I think allowing for smaller degrees of movement will help players feel the movement is more natural.
