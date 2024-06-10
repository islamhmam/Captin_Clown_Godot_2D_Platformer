extends CharacterBody2D

var speed = 100
var gravity = 19
var player
var chase = false 

func _ready():
	$AnimatedSprite2D.play("idle")
	
func _physics_process(delta):
	velocity.y +=gravity
	if chase ==true:
		if $AnimatedSprite2D.animation != "death":
			$AnimatedSprite2D.play("run")
		player = get_node("../../Player")
		var direction = (player.position - self.position)
		if direction.x > 0 :
			$AnimatedSprite2D.flip_h =true
			velocity.x = 1*speed
		if direction.x < 0 :
			$AnimatedSprite2D.flip_h =false
			velocity.x = -1*speed
	else :
		if $AnimatedSprite2D.animation != "death":
			$AnimatedSprite2D.play("idle")
		velocity.x=0
			
	move_and_slide()
	


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_hurt_area_body_entered(body):
	if body.name == "Player":
		Game.player_hp -= 1
		death()

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_enemy_death_body_entered(body):
	if body.name == "Player":
		death()
		
		
		
func death() :
	chase = false
	velocity.x = 0
	$AnimatedSprite2D.play("death")
	$EnemyDeathAudio.play()
	await $AnimatedSprite2D.animation_finished
	self.queue_free()
	
	
	
	
	
	
	
	
	
	
	

