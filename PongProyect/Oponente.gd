extends KinematicBody2D

var speed = 600
var direction = Vector2.ZERO
var reaction_dist_x = 0
var reaction_dist_y = 0

onready var ball = get_parent().find_node('Ball')

func _ready():
	randomize()
	
	var window_width = OS.get_window_size().x
	var shape_height = find_node('CollisionShape2D').shape.extents.y
	reaction_dist_x = window_width
	reaction_dist_y = shape_height
	reaction_dist_x -= window_width * 0.35 #easy
	reaction_dist_y -= shape_height * 0.5 #easy
	direction.y = [-1, 1][_random_select()]

func _physics_process(delta):
	var delta_y = ball.position.y - position.y
	
	if ball.position.x > reaction_dist_x && ball.direction.x > 0 && abs(delta_y) > reaction_dist_y:
		direction = Vector2(0, delta_y).normalized()
		move_and_slide(direction * speed)
	else:
		var collide = move_and_collide(direction * speed * delta)
		if collide:
			direction.y *= -1

func _random_select():
	return int(randf() > 0.5)
