@tool
extends FSMState

var jumped = false

func _on_enter(skeleton, _blackboard: Blackboard):
	jumped = false
	skeleton.velocity.y -= 120
	skeleton.velocity.x = 50 * skeleton.facing.x

func _on_update(_delta, skeleton, _blackboard: Blackboard):
	if not skeleton.is_on_floor():
		jumped = true
	if skeleton.is_on_floor() and jumped:
		get_parent().fire_event("idle")

func _on_exit(_actor, _blackboard: Blackboard):
	pass
