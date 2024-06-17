@tool
extends FSMState

func sign(x):
	if x > 0:
		return 1
	elif x < 0:
		return -1
	return 0

func _on_enter(skeleton, _blackboard: Blackboard):
	$Timer.start()
	%AnimatedSprite2D.play("attack")
	skeleton.velocity.x = 0

func _on_update(_delta, skeleton, _blackboard: Blackboard):
	var player = get_tree().get_first_node_in_group("player")
	var direction = player.position - skeleton.position
	if sign(skeleton.facing.x) != sign(direction.x):
		skeleton.turn()

func _on_exit(_actor, _blackboard: Blackboard):
	$Timer.stop()

func _on_timer_timeout():
	pass

func _on_animated_sprite_2d_animation_finished():
	get_parent().fire_event("attack")
