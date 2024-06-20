extends Area2D

var travelled_distance: float = 0

func _physics_process(delta: float) -> void:
	const SPEED: float = 1000.0
	const RANGE: float = 1200.0

	# get current rotation and get the direction of that rotation
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta  # move forward based on rotation

	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()

	if body.has_method("take_damage"):
		body.take_damage()
