@tool
extends FSMState

func _on_enter(player, _blackboard: Blackboard):
	$Timer.start()
	player.velocity.y = 0
	player.velocity.x = player.dash_distance * player.facing.x / $Timer.wait_time

func _on_update(_delta, _actor, _blackboard: Blackboard):
	pass

func _on_exit(_actor, _blackboard: Blackboard):
	$Timer.stop()

func _on_timer_timeout():
	get_parent().fire_event("fall")
