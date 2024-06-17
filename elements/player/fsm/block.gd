@tool
extends FSMTransition

func _on_transition(_delta, _actor, _blackboard: Blackboard):
	pass

func is_valid(player, _blackboard: Blackboard):
	return player.should_block()
