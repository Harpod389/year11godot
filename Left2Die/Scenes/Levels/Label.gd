extends Label

#This function is a code that makes the text "SCORE" appear in the top left of the screen and also makes sure that the number is updated every time the player kills the zombie 
func _process(delta):
	text= "SCORE: " + str(GameManager.score)
