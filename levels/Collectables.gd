extends Node2D

var gem = preload("res://gem/gem.tscn")

func _on_timer_timeout():
	var gemtemp= gem.instantiate()
	var rand = RandomNumberGenerator.new()
	var randX = rand.randi_range(96 , 384)
	gemtemp.position = Vector2(randX , 448)
	get_node("Node2D").add_child(gemtemp)
	
	
