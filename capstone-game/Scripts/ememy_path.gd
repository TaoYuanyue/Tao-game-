extends Path2D
@export var speed = 0.005


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PathFollow2D.progress_ratio += speed
	if $PathFollow2D.progress_ratio >= 1.0 or $PathFollow2D.progress_ratio <= 0: 
		speed = - speed
		$PathFollow2D.flip_h = !$PathFollow2D.flip_h
	
	
