@tool
extends FSMTransition

func _on_transition(_delta, player, _blackboard: Blackboard):
	player.can_double_jump = false

func is_valid(player, _blackboard: Blackboard):
	return player.should_jump() and player.can_double_jump and player.has_double_jump
