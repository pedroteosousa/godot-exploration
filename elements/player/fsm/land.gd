@tool
extends FSMTransition

func _on_transition(_delta, _actor, _blackboard: Blackboard):
	$LandingSound.play()

func is_valid(player, _blackboard: Blackboard):
	return player.is_on_floor()
