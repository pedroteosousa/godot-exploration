extends Area2D

var active = false

func _ready():
	if active:
		$AnimatedSprite2D.play("raised")

func _on_body_entered(body):
	if not active:
		# TODO: play sound
		$AnimatedSprite2D.play("raising")
		active = true
