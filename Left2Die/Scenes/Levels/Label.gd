extends Label


func _process(delta):
	text= "SCORE: " + str(GameManager.score)
