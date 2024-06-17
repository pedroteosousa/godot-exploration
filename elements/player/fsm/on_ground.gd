@tool
extends FSMState

func _on_enter(player, _blackboard: Blackboard):
	player.can_double_jump = true

func _on_update(_delta, player, _blackboard: Blackboard):
	player.update_horizontal_movement()

func _on_exit(_actor, _blackboard: Blackboard):
	pass
