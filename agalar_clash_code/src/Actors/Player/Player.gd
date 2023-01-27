extends Actors
# Called when the node enters the scene tree for the first time.
var max_speed = 1000
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		velocity = speed * calculateInput()
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	

func calculateInput() -> Vector2:
	var vector: Vector2 = Vector2(0,0)
	vector.x= Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	
	if Input.is_action_just_pressed("jump"):
		vector.y = -1
	return vector
