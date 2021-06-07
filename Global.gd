extends Node

const SAVE_DIR = "res://saves/"
var data_path = "res://data.dat"

var data = {
	"Level1": {"m": 99, "s": 99, "ms": 9, "points": 9},
	"Level2": {"m": 99, "s": 99, "ms": 9, "points": 9},
	"Level3": {"m": 99, "s": 99, "ms": 9, "points": 9},
}

var read_data

func _ready():
	var dir = Directory.new()
	if dir.dir_exists(SAVE_DIR):
		dir.make_dir(SAVE_DIR)
	
	var file = File.new()
	if file.file_exists(data_path):
		read(file)
	else: 
		var error = file.open(data_path, File.WRITE)
		if error == OK:
			file.store_var(data)
			file.close()
		read(file)

func save_data():
	var file = File.new()
	if file.file_exists(data_path):
		var error = file.open(data_path, File.WRITE)
		if error == OK:
			file.store_var(data)
			file.close()

func read(file):
	var error = file.open(data_path, File.READ)
	if error == OK:
		data = file.get_var(true)
		file.close()

