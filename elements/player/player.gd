extends CharacterBody2D

@export var speed: float
@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_ground: float
@export var terminal_velocity: float

@export var dash_distance: float = 32
@export var dash_buffer_size: int = 10
var dash_buffer = 0
var can_dash = false
@export var has_dash = false

@export var jump_buffer_size: int = 10
var jump_buffer = 0

@export var block_buffer_size: int = 10
var block_buffer = 0

@onready var jump_velocity = -2.0 * jump_height / jump_time_to_peak
@onready var jump_gravity = 2.0 * jump_height / jump_time_to_peak / jump_time_to_peak
@onready var fall_gravity = 2.0 * jump_height / jump_time_to_ground / jump_time_to_ground

var can_double_jump = false
@export var has_double_jump = false

var is_blocking = false

var looking_down = false

var facing: Vector2 = Vector2.RIGHT

func update_horizontal_movement():
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
		$AnimatedSprite2D.flip_h = direction < 0
		facing.x = direction
		facing = facing.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func update_vertical_movement(delta):
	velocity.y += get_gravity() * delta
	if velocity.y > terminal_velocity:
		velocity.y = terminal_velocity

func get_gravity():
	if velocity.y < 0:
		return jump_gravity
	else:
		return fall_gravity

func should_jump():
	return jump_buffer > 0

func should_block():
	return block_buffer > 0

func should_dash():
	return dash_buffer > 0

func is_looking_down():
	return looking_down

func _physics_process(_delta):
	if Input.is_action_just_pressed("block"):
		block_buffer = block_buffer_size
	elif block_buffer > 0:
		block_buffer -= 1
	
	if Input.is_action_just_pressed("dash"):
		dash_buffer = dash_buffer_size
	elif dash_buffer > 0:
		dash_buffer -= 1

	if Input.is_action_just_pressed("jump"):
		jump_buffer = jump_buffer_size
	elif jump_buffer > 0:
		jump_buffer -= 1
	
	if Input.is_action_pressed("down") and is_on_floor():
		$Camera2D.drag_vertical_offset = 1
		looking_down = true
	else:
		$Camera2D.drag_vertical_offset = 0
		looking_down = false

	move_and_slide()

func die():
	get_tree().reload_current_scene()

func _on_hitbox_body_entered(_body):
	if not is_blocking:
		die()
	$ParrySound.play()
