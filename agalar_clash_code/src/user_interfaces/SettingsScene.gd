extends Control
var b
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var a = get_parent()
	if (a):
		b = a.get_node("Container/MenuItemsContainer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_fullscreenbutton_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen


func _on_returnbutton_pressed() -> void:
	self.visible = false
	b.visible = true
	
