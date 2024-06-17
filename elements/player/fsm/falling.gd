@tool
extends FSMState

func _on_enter(_actor, _blackboard: Blackboard):
	pass

func _on_update(delta, player, _blackboard: Blackboard):
	player.update_vertical_movement(delta)
	player.update_horizontal_movement()

func _on_exit(_actor, _blackboard: Blackboard):
	pass
