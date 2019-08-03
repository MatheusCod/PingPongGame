extends KinematicBody2D

signal start

var speed = 0
var velocity = Vector2()
var horizontal = -1
var vertical = 1
var screen_size
var player_position
var initial_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if (Input.is_action_pressed("restart")):
		get_tree().reload_current_scene()
	var collision = move_and_collide(velocity * delta)
	if (collision):
		get_parent().get_node("Hit").play()
		speed = 200
		if(position.x > screen_size.x/2):
			player_position = get_parent().get_node("Player_2").position.y
			if (player_position < position.y):
				horizontal = -1
				vertical = 1
			elif (player_position > position.y):
				horizontal = -1
				vertical = -1
			else:
				horizontal = -1
		
		if(position.x < screen_size.x/2):
			player_position = get_parent().get_node("Player_1").position.y
			if (player_position < position.y):
				horizontal = 1
				vertical = 1
			elif (player_position > position.y):
				horizontal = 1
				vertical = -1
			else:
				horizontal = 1
	
	velocity = Vector2(horizontal, vertical)
	
	if (velocity.length() > 0):
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	move_and_slide(velocity, Vector2(1,1))


func _on_Superior_Wall_body_entered(body):
	if (body.get_name() != "Player_1" and body.get_name() != "Player_2"):
		get_parent().get_node("Wall").play()
		vertical = 1

func _on_Inferior_Wall_body_entered(body):
	if (body.get_name() != "Player_1" and body.get_name() != "Player_2"):
		get_parent().get_node("Wall").play()
		vertical = -1


func _on_Goal_1_body_entered(body):
	get_parent().get_node("Point").play()
	randomize()
	position.x = screen_size.x/2
	position.y = rand_range(1, screen_size.y - 1)
	horizontal = -1
	if(rand_range(0,1) == 1):
		vertical = 1
	else:
		vertical = -1
	speed = 100


func _on_Goal_2_body_entered(body):
	get_parent().get_node("Point").play()
	randomize()
	position.x = screen_size.x/2
	position.y = rand_range(1, screen_size.y - 1)
	horizontal = 1
	if(rand_range(0,1) == 1):
		vertical = 1
	else:
		vertical = -1
	speed = 100
