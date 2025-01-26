extends ProgressBar


var parent
var max_value_amount
var min_value_amount

var parent_position
func _ready():
	parent = get_parent()
	max_value_amount = parent.health_max
	min_value_amount = parent.health_min
	
func _process(delta):
	parent_position = get_parent().position
	self.position = parent_position + Vector2(-35, -50) 
	value = parent.health
	if parent.health != max_value_amount:
		self.visible = true
		if parent.health == min_value_amount:
			self.visible = false
	else:
		self.visible = false
	if value <= 0:
		get_tree().paused = true
