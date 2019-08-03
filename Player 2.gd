extends KinematicBody2D

export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if (Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	elif (Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if (velocity.length() > 0):
		velocity = velocity * speed
	
	position += velocity * delta
	position.y = clamp(position.y, 45, screen_size.y - 45)