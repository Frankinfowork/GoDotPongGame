extends Node2D

var PlayerScore = -2
var PlayerScoreDer = -2

func _process(delta):
	$MarcadorPlayer.text = str(PlayerScore)
	$MarcadorPlayerDer.text = str(PlayerScoreDer)

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	$Ball.reset_ball()

func _ready():
	pass # Replace with function body.


func _on_ArcoPlayerIzk_body_entered(body):
	PlayerScoreDer += 1
	_restart_game()

func _on_ArcoPlayerDer2_body_entered(body):
	PlayerScore += 1
	_restart_game()
