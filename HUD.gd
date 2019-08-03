extends CanvasLayer

var scores_1 = 0
var scores_2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Line.hide()

func wait():
	$Timer.set_wait_time(1)
	$Timer.start()
	$Button.hide()
	$Line.show()

func new_game():
	$Line.show()
	scores_1 = 0
	scores_2 = 0
	$Player_1.set_text(str(scores_1))
	$Player_2.set_text(str(scores_2))
	get_parent().get_node("Ball").speed = 200

func _on_Goal_1_body_entered(body):
	scores_2 += 1
	$Player_2.set_text(str(scores_2))
	if(scores_2 == 10):
		get_parent().get_node("Ball").speed = 0
		$Timer.set_wait_time(1)
		$Timer.start()


func _on_Goal_2_body_entered(body):
	scores_1 += 1
	$Player_1.set_text(str(scores_1))
	if(scores_1 == 10):
		get_parent().get_node("Ball").speed = 0
		$Timer.set_wait_time(1)
		$Timer.start()
