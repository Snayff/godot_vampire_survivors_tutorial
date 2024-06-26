extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var health: int = 3

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage() -> void:
	health -= 1
	%Slime.play_hurt()

	if health == 0:
		queue_free()

		const SMOKE_SCENE: PackedScene = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke: Node = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
