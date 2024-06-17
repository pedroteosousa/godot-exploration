@tool
extends FSMState

func _on_enter(player, _blackboard: Blackboard):
	if player.is_looking_down():
		player.position.y += 1
	else:
		player.velocity.y = player.jump_velocity
		$JumpSound.play()
	player.jump_buffer = 0
	get_parent().fire_event("fall")

func _on_update(_delta, _actor, _blackboard: Blackboard):
	pass

func _on_exit(_actor, _blackboard: Blackboard):
	pass
