extends Actors
# Called when the node enters the scene tree for the first time.
var max_speed = 1000
var velocity: Vector2 = Vector2.ZERO
var is_just_on_wall = false

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		velocity = speed * calculateInput()
		
	if velocity.y <= max_falling_speed:
		velocity.y += gravity * delta
	
	set_just_on_wall()
	if is_just_on_wall:
		velocity.y = 500
	
	velocity = move_and_slide(velocity)
	velocity = dissipateVelocity(velocity, delta)

func calculateInput() -> Vector2:
	var vector: Vector2 = Vector2(0,0)
	vector.x= Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	
	if Input.is_action_just_pressed("jump"):
		vector.y = -1
	return vector

func set_just_on_wall() -> void:
	if is_on_wall() and not is_just_on_wall:
		is_just_on_wall = true
	elif is_on_wall() and is_just_on_wall:
		is_just_on_wall = false
	
func dissipateVelocity(vector: Vector2, delta: float) -> Vector2:
	if is_on_wall() and vector.y >= 0:
		vector.y -= 100*delta
	vector.x -= 20*delta 
	return vector
