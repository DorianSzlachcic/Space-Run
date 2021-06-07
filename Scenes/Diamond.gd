extends Area2D

signal point
onready var audio = $AudioStreamPlayer2D
onready var coll = $CollisionShape2D

func _ready():
	connect("point", get_parent(), "on_diamond")

func _on_Diamond_body_entered(_body):
	emit_signal("point")
	audio.play(0)
	visible = false
	coll.set_deferred("disabled", true)


func _on_AudioStreamPlayer2D_finished():
	queue_free()
