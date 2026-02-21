extends Timer

var mintime = 1.0
var maxtime = 4.0

func _ready():
	timeout.connect(randtime)
	randtime()
	start()

func randtime():
	wait_time = randf_range(mintime, maxtime)
	start()
