extends Node2D
var node  = preload("res://milho.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("plantar"):
		var instance = node.instantiate()
		instance.position = $cenario_grama/Fazendeiro.position
		add_child(instance)
		
