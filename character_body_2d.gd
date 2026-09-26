extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var day_score = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func collect_coin():
	day_score += 10
	day_score = min(day_score, 100)

	$ProgressBar.value = day_score


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
