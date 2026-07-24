extends Area2D
var semente = Dados.semente
var plantar = "nao"
var terra = "nao"
var tem_planta = "nao"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	# Começa de dia: ColorRect completamente transparente
	$"../borboleta/ColorRect".self_modulate = Color(1, 1, 1, 0)
	
	#await get_tree().create_timer(5.0).timeout
	#$"../borboleta/AnimationPlayer".play("noite")
	#await get_tree().create_timer(10.0).timeout
	#$"../borboleta/AnimationPlayer".play("dia")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../segura_informacoes/semente_tomate".text = str(semente)
	
	if terra == "sim" and tem_planta == "nao":
		if semente >= 1 and Input.is_action_just_pressed("ui_accept"):	
			semente -= 1
			show()
			tem_planta = "sim"
			$AnimatedSprite2D.frame = 0
			await get_tree().create_timer(3.0).timeout
			$AnimatedSprite2D.frame = 1
			await get_tree().create_timer(5.0).timeout
			$AnimatedSprite2D.frame = 2
			await get_tree().create_timer(7.0).timeout
			$AnimatedSprite2D.frame = 3
			await get_tree().create_timer(10.0).timeout
			$AnimatedSprite2D.frame = 4
			await get_tree().create_timer(12.0).timeout
			$AnimatedSprite2D.frame = 5
			tem_planta = "nao"

# aqui ve se ta na terra
func _on_body_entered(body: Node2D) -> void:
	$"../borboleta/AnimationPlayer".play("voando")
	terra = "sim"
	pass
	

# aqui ve se saiu
func _on_sementes_body_exited(body: Node2D) -> void:
	terra = "nao"
	pass # Replace with function body.
