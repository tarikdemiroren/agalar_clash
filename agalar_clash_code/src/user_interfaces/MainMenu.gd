extends Control
class_name mainMenu

onready var settings = $SettingsScene
onready var menu = $Container/MenuItemsContainer
onready var confirmexit = $confirmExit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func _on_Settings_pressed() -> void:
	menu.visible = false
	settings.visible = true


func _on_Quit_pressed() -> void:
	confirmexit.visible = true


func _on_confirmExit_confirmed() -> void:
	get_tree().quit()
