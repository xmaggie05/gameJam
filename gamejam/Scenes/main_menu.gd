extends Control

@onready var button: Button = $MainMenu/Button

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	print("hello")
	get_tree().change_scene_to_file("res://Levels/airplane_level.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
