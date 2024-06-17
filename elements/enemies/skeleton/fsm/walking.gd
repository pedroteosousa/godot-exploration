@tool
extends FSMState

func _on_enter(skeleton, _blackboard: Blackboard):
	%AnimatedSprite2D.play("walk")
	skeleton.velocity.x = skeleton.speed * skeleton.facing.x

func _on_update(_delta, _actor, _blackboard: Blackboard):
	if not %FloorRayCast2D.is_colliding() or %FrontRayCast2D.is_colliding():
		get_parent().fire_event("idle")

func _on_exit(_actor, _blackboard: Blackboard):
	pass
