@tool
extends FSMTransition

func _on_transition(_delta, player, _blackboard: Blackboard):
	player.can_dash = false

func is_valid(player, _blackboard: Blackboard):
	return player.should_dash() and player.can_dash and player.has_dash
