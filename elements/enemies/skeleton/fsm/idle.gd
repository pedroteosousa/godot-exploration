@tool
extends FSMState

func _on_enter(skeleton, _blackboard: Blackboard):
	%AnimatedSprite2D.play("idle")
	skeleton.velocity.x = 0
	$Timer.start()

func _on_update(_delta, _actor, _blackboard: Blackboard):
	pass

func _on_exit(_actor, _blackboard: Blackboard):
	$Timer.stop()

func _on_timer_timeout():
	get_parent().actor.turn()
	get_parent().fire_event("walk")
