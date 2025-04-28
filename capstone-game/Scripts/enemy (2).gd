extends CharacterBody2D

@export var Speed = 100

var direction = 1

@onready var ray_cast_right = $"RayCast right"
@onready var ray_cast_left = $"RayCast left"
@onready var enemy_sprite = $Enemy

func _process(delta):
	if ray_cast_left.is_colliding():
		direction = 1
		enemy_sprite.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		enemy_sprite.flip_h = true
		
	position.x += direction * Speed * delta
		
		
	move_and_slide()
