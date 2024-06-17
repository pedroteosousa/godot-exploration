extends CharacterBody2D

@export var speed = 20
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing = Vector2.LEFT

func turn():
	facing *= -1
	%FloorRayCast2D.position.x *= -1
	$PlayerRayCast2D.target_position.x *= -1
	%FrontRayCast2D.target_position.x *= -1
	%AnimatedSprite2D.flip_h = not %AnimatedSprite2D.flip_h

func knockback():
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if $PlayerRayCast2D.is_colliding() and is_on_floor():
		$FiniteStateMachine.fire_event("wind_up")
	move_and_slide()
