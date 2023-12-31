extends KinematicBody2D
var velocity = Vector2()
var jump_speed = -400
var gravity = 1100
var is_jumping = false
var freeze = false
signal end
func _physics_process(delta):
	if freeze == false:
		velocity.y += gravity * delta
		if is_on_floor():
			is_jumping = false
			if Input.is_action_just_pressed("click"):
				velocity.y = jump_speed
				is_jumping = true
		velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_player_area_entered(area):
	if area.name == "enemy":
		freeze = true
		return
