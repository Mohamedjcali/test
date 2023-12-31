extends Node2D
var start_speed = -400
var scene_to_spawn = preload("res://scenes/enemy/enemy.tscn")
var spowned : Array
var score = 0
var text_spown = preload("res://scenes/main/text.tscn")


func _physics_process(delta):
	$Label.text = str(score)
	var raondon = randi() %100
	if raondon == 50:
		creator()
		

func creator():
	var new_scene_instance = scene_to_spawn.instance()
	get_tree().get_root().add_child(new_scene_instance)
	new_scene_instance.speed = -400
	new_scene_instance.position = $pos.position
	new_scene_instance.scale = Vector2(1,sizeCreator())
	spowned.append(new_scene_instance)
	
func sizeCreator() -> float:
	if score <= 100:
		var pos = rand_range(1.00,1.2)
		return pos
	elif score <= 400:
		var pos = rand_range(1.2,1.43444543)
		return pos
	elif score <= 900:
		var pos = rand_range(1.4,1.68733333)
		return pos
	elif score <= 1000:
		var pos = rand_range(1.5,1.79999999)
		return pos
		
	return 1.000
	
	
func speedCalculator() -> int:
	if score == 0:
		var speed = start_speed
		return -speed
	elif score <= 20:
		var speed = rand_range(400,500)
		return speed
	elif score <= 100:
		var speed = rand_range(400,700)
		return -speed
	elif score <= 300:
		var speed = rand_range(500,800)
		return -speed
	elif score <= 600:
		var speed = rand_range(600,900)
		return -speed
	elif score <= 1000:
		var speed = rand_range(800,1100)
		return -speed
	else:
		return start_speed
		

func _on_killer_body_entered(body):
	score += 1
	spowned.remove(0)
	body.queue_free()




func _on_killer2_body_entered(body):
	body.queue_free()
