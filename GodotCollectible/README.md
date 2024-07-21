This project taught me many elements I will implement in the future and thus this will likely
be my most in depth analysis of any other projects in this repository.

# Contents
1. Original Problem
2. Solution to Original Problem
3. Additional Problems
4. Additional Solutions
5. Learned Skills

## Original Problem
This project was inspired by the need to collect items in [Tanuki Project](https://github.com/JordanChwalik/TanukiProject).
I originally believed the problem to be related to the class of node that I had designated for my player character and
the items I wanted to collect and their unique collision detection tools.

I had attempted to create collectible items that would disappear when they came in contact with the player while
granting an item that would be added to a player inventory. I experimented with mixes of the player and collectible
being Node2D (the most abstract parent class), RigidBody2D (a physics object that can have forces applied to them
like gravity), CharacterBody2D (a different physics object with more support for user input than RigidBody2D), 
and Area2D (a simpler object that inhabits a space but doesn't have native physics support).

Each of these node types are capable of having child nodes that grant them collision areas that can be interacted with.
Physics objects are considered to have "bodies" which are detected differently than areas and so various
attempts were made to see if my initial attempts were calling methods that were expecting a physics object but
were receiving a 2D area and vice versa.

Traditionally all nodes communicate with each other using signals which to my understanding follow the observer pattern
of programming where a connection is formed between nodes and if a change occurs in one of the nodes, it notifies any
observers it has of those changes which then perform the necessary actions.

## Solution to Original Problem
When following the tutorial for Godot's first 2D game, the player object is represented as an Area2D object and
enemies are created that are RigidBody2D objects. Area2D objects can be moved around by creating a vector that follows
the user input and directly modifies the Area2D objects position element. The [Godot 2D game tutorial](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html)
writes that code as so:
```
func _process(delta):
  var velocity = Vector2.ZERO # The player's movement vector.
  if Input.is_action_pressed("move_right"):
    velocity.x += 1
  if Input.is_action_pressed("move_left"):
    velocity.x -= 1
  if Input.is_action_pressed("move_down"):
    velocity.y += 1
  if Input.is_action_pressed("move_up"):
    velocity.y -= 1

  if velocity.length() > 0:
    velocity = velocity.normalized() * speed
    $AnimatedSprite2D.play()
  else:
    $AnimatedSprite2D.stop()

  position += velocity * delta
  position = position.clamp(Vector2.ZERO, screen_size)
```

What I did not know when starting this project is that physics objects can be moved in this same manner,
**but** they will not check for collisions when moved this way. Because my player is a physics object,
regardless of what I made the collectible item, it could not detect an collisions when moved this way.
Instead I had to look through extensive documentation to find that a RigidBody2D inherits a movement method
called "move_and_collide()" from its parent class PhysicsBody2D. This method can move physics objects
and allow objects to register collisions from that movement.

## Additional Problems
1. Instaniate objects in random location
2. Connect signals from instaniated objects to existing objects
4. Prevent player from leaving play area

## Additional Solutions
### Instantiate objects in random location
Before this project I had only seen instantiation at set points (along a path or at a marker) and so I
wanted to see if objects could be instantiated at any random coordinates.
After some experimentation, I learned that the godot engine stores a "position" element in a simple
object that stores an x and y value. In my simplified testing ground, I knew the exact coordinates that
were being used as a boundary and so I randomly created an x and y value in the bounds of the screen
and assigned them to a new collectible object. I then added that object to the program tree (Godot's way
of tracking objects) and randomly placed objects became possible.

### Connect Signals from Instantiated Objects to Existing Objects
Prior to this project I had only used the UI to connect signals. When you select a node to edit in Godot,
a list of signals that node can send are listed. Native signals such as "body_entered" will send when a
physics object's collision space is entered by another physics body. Custom signals can also be designated
and "emitted" by any function possesed by a node. To connect these signals (native or custom) to another node,
they must be placed in a scene together, but those objects might not be in the same scene when the program begins
to run.

In this instance, after collecting an object, i wanted to create another one in a new location. But that newly
created node will need to connect its signals to the main scene in order to communicate when it has been collected
and a new one will need to be created. This led me to discover the connect method which allows a newly
instantiated node to connect its signals to any other node in the scene that might want to observe it. The
code that accomplishes this is:
```
# Connect the signal from the collectible to current node (main)
collectible.get_collected.connect(_on_collectible_get_collected)
```
### Prevent Player from Leaving Play Area
I tested a StaticBody2D object and found that when given a collision shape, the player can not pass through it.
I then created a box out of these StaticBody2D objects and placed it around the playable area.

This does have the pitfall of creating extra work if I want to change the size of the play window at a later date.
The current structure would require me to resize those boundaries for every screen size I want this program to
run on.

## Learned Skills
1. Move physics objects with user input
2. Detect collisions between physics objects
3. Instantiate objects after a scene initially loads
4. Connect signals from objects added later
5. Use StaticBody2D objects
