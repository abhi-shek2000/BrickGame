extends RigidBody2D

const SEEDUP = 400
const MAXSPEEDn = 300000
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Brick"):
			body.queue_free()
		
		if body.get_name() == "Paddle":
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Ancor").get_global_position()
			var velocity = direction.normalized() * min(speed+SEEDUP*delta, MAXSPEEDn*delta)
			linear_velocity = velocity
	if position.y > get_viewport_rect().end.y:
		
		queue_free()