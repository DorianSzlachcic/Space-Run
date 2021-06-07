extends Node2D

signal play
signal pause

var end_lvl = preload("res://Scenes/LevelEnd.tscn")
var game_over = preload("res://Scenes/GameOver.tscn")
var player_death = preload("res://Scenes/Death.tscn")
var camera = preload("res://Scenes/Camera2D.tscn")
export var current_lvl = "Path to current level"
export var next_lvl = "Path to next level"
export var data_lvl = "Level1"
var m
var s
var ms
var sth = 0
var points = 0
var death_position
var projectile_coll
onready var richText = $Scheme/HUD/RichTextLabel
onready var player = $Player

enum{
	MOVE,
	END_LVL
}

func _ready():
	connect("play", get_tree().root.get_node("/root/GlobalAudioStreamPlayer"),"on_play")
	connect("pause", get_tree().root.get_node("/root/GlobalAudioStreamPlayer"),"on_pause")
	emit_signal("play")

func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene(current_lvl)

func on_finished_run():
	audio_pause()
	player.state = END_LVL
	var global_data = Global.data[data_lvl]
	if ((global_data["m"]*600)+(global_data["s"]*10) + global_data["ms"])>=((richText.m*600)+(richText.s*10)+richText.ms):
		global_data["m"] = richText.m
		global_data["s"] = richText.s
		global_data["ms"] = richText.ms
		global_data["points"] = points
	
	m = richText.m
	s = richText.s
	ms = richText.ms
	
	
	richText.get_node("Timer").paused = true
	self.add_child(end_lvl.instance())

func on_hit(body):
	if body == player:
		if sth == 0:
			audio_pause()
			richText.get_node("Timer").paused = true
			death_position = player.global_position
			var camera_position = player.get_node("Camera2D").global_position
			var camera_limit_b = player.get_node("Camera2D").limit_bottom
			var camera_limit_t = player.get_node("Camera2D").limit_top
			var camera_limit_r = player.get_node("Camera2D").limit_right
			player.call_deferred("queue_free")
			
			var PlayerDeath = player_death.instance()
			add_child(PlayerDeath)
			PlayerDeath.global_position = death_position
			
			var DeathCamera = camera.instance()
			add_child(DeathCamera)
			DeathCamera.global_position = camera_position
			DeathCamera.limit_bottom = camera_limit_b
			DeathCamera.limit_top = camera_limit_t
			DeathCamera.limit_right = camera_limit_r
			
			var GameOver = game_over.instance()
			add_child(GameOver)
			sth +=1

func on_diamond():
	points += 1

func change_lvl():
	get_tree().change_scene(next_lvl)

func audio_pause():
	emit_signal("pause")

