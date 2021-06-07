extends StaticBody2D

var projectile = load("res://Scenes/Projectile.tscn")

export var delay = 1.5

onready var animation = $AnimatedSprite
onready var timer = $Timer
onready var audio = $AudioStreamPlayer2D

func _on_Timer_timeout():
	audio.play(0)
	animation.play("default")
	timer.wait_time = delay
	self.add_child(projectile.instance())

func _on_AnimatedSprite_animation_finished():
	animation.stop()
	animation.frame = 0
	timer.start(delay)
