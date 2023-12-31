extends KinematicBody2D

export var difficult : int
export var speed : int
export var direction : int
var gravity = 800
var velocity = Vector2()
var freeze = false
var sizes = [Vector2(16,61),Vector2(16,50),Vector2(16,34)]
var positions = [Vector2(16,61),Vector2(16,50),Vector2(16,34)]
signal score
func _ready():
	pass
	
func _physics_process(delta):
	if freeze == false:
		velocity.y += gravity * delta
		velocity.x = speed
		move_and_slide(velocity)
	





func _on_enemy_area_entered(area):
	if area.name == "player":
		freeze = true
		return
		


func _on_score_area_entered(area):
	if area.name == "player":
		emit_signal("score")
