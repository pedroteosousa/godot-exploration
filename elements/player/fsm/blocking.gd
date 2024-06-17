@tool
extends FSMState

func _on_enter(player, _blackboard: Blackboard):
	$Timer.start()
	%AnimatedSprite2D.play("block")
	player.velocity.x = 0
	player.block_buffer = 0
	player.is_blocking = true

func _on_update(_delta, _actor, _blackboard: Blackboard):
	pass

func _on_exit(player, _blackboard: Blackboard):
	player.is_blocking = false
	$Timer.stop()

func _on_timer_timeout():
	get_parent().fire_event("stop_blocking")
