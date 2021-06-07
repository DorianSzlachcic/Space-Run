extends CanvasLayer

onready var animation = $AnimationPlayer
onready var timeText = $Label2
onready var pointsText = $Label4

signal change_lvl

var m = 0
var s = 0
var ms = 0
var points = 0


func _ready():
	connect("change_lvl",get_parent(),"change_lvl")
	connect("change_lvl",get_tree().root.get_node("/root/Global"),"save_data")
	m = get_parent().m
	s = get_parent().s
	ms = get_parent().ms
	if s < 10:
		timeText.set_text(str(m) + ".0" + str(s) + "." + str(ms))
	elif s >= 10:
		timeText.set_text(str(m) + "." + str(s) + "." + str(ms))
	
	points = get_parent().points
	pointsText.set_text(str(points))
	
	animation.play("animation")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("change_lvl")
