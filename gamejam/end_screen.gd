extends Control

@onready var scoreLabel = $scoreLabel/Control/scoreLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scoreLabel.text = "FINAL SCORE: %d" % Global.score
	$highScoreLabel.text = "HIGH SCORE: %d" % Global.high_score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/airplane_level.tscn")
