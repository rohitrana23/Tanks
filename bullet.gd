extends Area2D

var speed = 1000
var direction: float
var spawnPos: Vector2
var spawnRot: float
var time = 0

var velocity = Vector2()

@export var damage = 1
func _ready():
	global_position = spawnPos
	global_rotation = spawnRot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	time+=delta
	if time >= 10:
		queue_free()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
