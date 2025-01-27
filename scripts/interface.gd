extends CanvasLayer

var score1 = 0
var score2 = 0
@onready var scorelabel = $ui/score
@onready var endscreen = $ui/CenterContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	endscreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if score1 == 4:
		endscreen.show()
		$ui/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Winner.text = "Player 1 Wins"
	elif score2 == 4:
		endscreen.show()
		$ui/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Winner.text = "Player 2 Wins"
	scorelabel.text = "%d : %d" % [score1,score2]
	


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")



func _on_replay_pressed():
	get_tree().reload_current_scene()
