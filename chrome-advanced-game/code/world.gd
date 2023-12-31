extends Node2D
var scene_to_spawn = preload("res://scenes/enemy/enemy.tscn")
var text_spown = preload("res://scenes/main/text.tscn")
var end = false
var diffcult:int
var lastspeed
var spowned : Array
var score = 0
var start_speed = 400
func _physics_process(delta):
	pass
	
	
func creator():
	var new_scene_instance = scene_to_spawn.instance()
	get_tree().get_root().add_child(new_scene_instance)
	new_scene_instance.speed = speedCalculator()
	new_scene_instance.position = $pos.position
	new_scene_instance.scale = Vector2(1,sizeCreator())
	lastspeed = new_scene_instance.speed
	spowned.append(new_scene_instance)
	
	
	
func sizeCreator() -> float:
	if score <= 100:
		var pos = rand_range(1.00,1.2)
		return pos
	elif score <= 400:
		var pos = rand_range(1.2,1.43444543)
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
		return speed
	elif score <= 20:
		var speed = rand_range(400,500)
		return speed
	elif score <= 100:
		var speed = rand_range(400,700)
		return speed
	elif score <= 300:
		var speed = rand_range(500,800)
		return speed
	elif score <= 600:
		var speed = rand_range(600,900)
		return speed
	elif score <= 1000:
		var speed = rand_range(800,1100)
		return speed
	else:
		return start_speed



func _on_player_end():
	end = true
	return 


func _on_enemy_score():
	score += 1
	
func calculatepos():
	if not spowned.empty():
		for i in range(spowned.size() - 1):
			var position = spowned[i].position.distance_to($player.position)
			var text_spown_instance = text_spown.instance()
			get_tree().get_root().add_child(text_spown_instance)
			text_spown_instance.text = position
			var text_pos = spowned[i].position
			text_spown_instance.position = Vector2(text_pos.x, text_pos.y+21) 
			get_tree().get_root().remove_child(text_spown_instance)      
	
	
	
	
