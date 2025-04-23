extends CharacterBody2D


var SPEED = 130.0
const JUMP_VELOCITY = -350.0

const DASH_SPEED = 500
var dashing = false
var can_dash = true
var Jumping = false



func _physics_process(delta: float) -> void:
	

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		Jumping = false
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("roll")
		Jumping = true
		
		

	if Input.is_action_just_pressed("dash") and can_dash and $CanvasLayer/DashBar.value >0:
		dashing = true
		can_dash = false
		$Dash_Timer.start()
		$dash_again_timer.start()
		
		$CanvasLayer/DashBar.value -= 100
		$Timer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction !=0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h=direction <0
		if not Jumping:
			$AnimatedSprite2D.play("run")

			
		if dashing:
			velocity.x = direction * DASH_SPEED
	
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not Jumping:
			$AnimatedSprite2D.play("idel")
		
		
	

	move_and_slide()

#stop dashing
func _on_dash_timer_timeout() -> void:
	dashing = false


func _on_dash_again_timer_timeout() -> void:
	can_dash = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemys"):
		print("You Died")
		get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	$CanvasLayer/DashBar.value = 100
