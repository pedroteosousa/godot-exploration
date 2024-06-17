@tool
extends FSMTransition

func _on_transition(_delta, _actor, _blackboard: Blackboard):
	%AnimatedSprite2D.play("idle")

func is_valid(player, _blackboard: Blackboard):
	return player.should_jump() and player.can_double_jump and player.has_double_jump
