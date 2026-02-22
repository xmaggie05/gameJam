extends Control
@onready var scoreLabel = $scoreLabel

func _process(delta):
	scoreLabel.text = "SCORE: %d" % Global.score
	
