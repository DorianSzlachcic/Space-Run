extends CanvasLayer

onready var animation = $AnimationPlayer
func _ready():
	animation.play("animation")
