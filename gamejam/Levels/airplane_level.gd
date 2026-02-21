extends Node2D

@onready var airplane: CharacterBody2D = $AirplaneLevel/Airplane
@onready var bird: Area2D = $AirplaneLevel/bird


func _ready():
	pass
	
func _process(delta: float) -> void:
	pass
	
func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
