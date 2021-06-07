extends Area2D

signal finished_run

func _ready():
	connect("finished_run",get_parent(),"on_finished_run")




func _on_Flag_body_entered(_body):
	emit_signal("finished_run")
