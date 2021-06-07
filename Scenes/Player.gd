extends KinematicBody2D

const MAX_SPEED = 300
const FRICTION = 300
const ACCELERATION = 6000
const GRAVITY = 30
enum{
	MOVE,
	END_LVL
}

var state = MOVE
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
onready var sprite = $Sprite
onready var animationTree = $AnimationTree.get("parameters/playback")
onready var camera = $Camera2D
onready var audio = $AudioStreamPlayer

func _ready():
	camera.limit_right = get_parent().get_node("Scheme/Sprite").region_rect.size.x


func _physics_process(delta):
	match state:
		MOVE:
			if Input.is_action_just_pressed("acceleration"):
				move(delta)
			if Input.is_action_pressed("ui_left"):
				sprite.flip_h = true
			if Input.is_action_pressed("ui_right"):
				sprite.flip_h = false
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
			velocity.y += GRAVITY
			velocity = move_and_slide(velocity, Vector2(0,-1),false,4,0.8)
		END_LVL:
			animationTree.travel("Idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			audio.play(0)
			velocity.y = -48000*delta
		if velocity == Vector2.ZERO:
			animationTree.travel("Idle")
		if velocity.x != 0:
			animationTree.travel("Run")
	else:
		animationTree.travel("Jump")

func move(delta):
	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		velocity = velocity.move_toward(input_vector*MAX_SPEED,ACCELERATION*delta)
