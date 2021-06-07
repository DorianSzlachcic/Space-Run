extends Node2D

onready var start = $Start
onready var howto = $HowTo
onready var credits = $Credits
onready var levels = $LevelSelect

func _ready():
	start.visible = true
	howto.visible = false
	credits.visible = false
	levels.visible = false
	get_bests()

func get_bests():
	var global1 = Global.data["Level1"]
	var global2 = Global.data["Level2"]
	var global3 = Global.data["Level3"]
	if global1["s"] < 10:
		levels.get_node("BestTime1").set_text(str(global1["m"])+".0"+str(global1["s"])+"."+str(global1["ms"]))
	else:
		levels.get_node("BestTime1").set_text(str(global1["m"])+"."+str(global1["s"])+"."+str(global1["ms"]))
	levels.get_node("Points1").set_text(str(global1["points"]))
	if global2["s"] < 10:
		levels.get_node("BestTime2").set_text(str(global2["m"])+".0"+str(global2["s"])+"."+str(global2["ms"]))
	else:
		levels.get_node("BestTime2").set_text(str(global2["m"])+"."+str(global2["s"])+"."+str(global2["ms"]))
	levels.get_node("Points2").set_text(str(global2["points"]))
	if global3["s"]<10:
		levels.get_node("BestTime3").set_text(str(global3["m"])+".0"+str(global3["s"])+"."+str(global3["ms"]))
	else:
		levels.get_node("BestTime3").set_text(str(global3["m"])+"."+str(global3["s"])+"."+str(global3["ms"]))
	levels.get_node("Points3").set_text(str(global3["points"]))

func _on_Button5_pressed():
	start.visible = true
	howto.visible = false
	credits.visible = false
	levels.visible = false


func _on_Button3_pressed():
	howto.visible = true
	start.visible = false


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_Button4_pressed():
	credits.visible = true
	start.visible = false


func _on_Button2_pressed():
	levels.visible = true
	start.visible = false


func _on_Level1_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_Level2_pressed():
	get_tree().change_scene("res://Scenes/Level2.tscn")


func _on_Level3_pressed():
	get_tree().change_scene("res://Scenes/Level3.tscn")
