extends Area2D

const SPEED = 5

func _ready():
	connect("body_entered", get_parent().get_parent(),"on_hit")

func _physics_process(_delta):
	global_position.x -= SPEED
	if global_position.x < global_position.x-100:
		queue_free()


func _on_Projectile_body_entered(body):
	call_deferred("free")
