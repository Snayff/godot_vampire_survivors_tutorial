extends CharacterBody2D

var health: float = 100.0

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()

	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE: float = 5.0
	var overlapping_mobs: Array[Node2D] = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * DAMAGE_RATE * delta

		if health <= 0.0:
			pass