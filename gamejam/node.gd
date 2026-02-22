extends Node
var mintime = 0.8
var maxtime = 2.5

func _ready():
	randomize()

func player_landed():
	var delay = randf_range(mintime, maxtime)
	await get_tree().create_timer(delay).timeout
	spawn_obstacle()

func spawn_obstacle():
	# your obstacle creation code here
	pass
