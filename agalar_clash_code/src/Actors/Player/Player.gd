extends Actors
# Called when the node enters the scene tree for the first time.
var max_speed = 800
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	calcwelocity()
	
	if not velocity.y > max_falling_speed and not is_on_wall():
		velocity.y += gravity * delta
	
	if velocity.x >= 0:
		velocity.x = min(velocity.x, max_speed)
	else:
		velocity.x = max(velocity.x, -max_speed)
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity = dissipateVelocity(velocity, delta)

func calculateInput() -> Vector2:
	var vector: Vector2 = Vector2(0,0)
	vector.x= Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vector.y = -1

	return vector

func calcwelocity() -> void:
	if (is_on_floor()):
		velocity.x += speed * calculateInput().x
		velocity.y += jump_force * calculateInput().y
	elif (not is_on_wall() or not is_on_ceiling()):
		velocity.x += speed * calculateInput().x * 0.7
	
func dissipateVelocity(vector: Vector2, delta: float) -> Vector2:
	if is_on_wall() and vector.y <= 0:
		vector.y += 10*delta
	if is_on_floor():
		if vector.x > 0:
			vector.x -= 20
		elif vector.x < 0:
			vector.x += 20
	return vector
