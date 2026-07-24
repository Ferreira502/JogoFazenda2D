extends CharacterBody2D

var speed = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
# setup direction of movement
	var direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("direita") || Input.is_action_pressed("esquerda"):
		direction.y = 0
	elif Input.is_action_pressed("cima") || Input.is_action_pressed("baixo"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
		$AnimatedSprite2D.play("parado")
	
#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	velocity = (direction * speed)
	move_and_slide() 

	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("andando_tras")
		
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("andando_frente")


func _on_sementes_body_entered(body: Node2D) -> void:
	Dados.semente += 1


func _on_porta_casa_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://dentro_casa.tscn").call_deferred()


func _on_porta_saida_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://main.tscn").call_deferred()
