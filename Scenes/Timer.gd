extends RichTextLabel

var ms = 0
var s = 0
var m = 0

func _process(_delta):
	if ms>9:
		s += 1
		ms = 0
	if s>59:
		m+=1
		s=0
	
	if s < 10:
		set_text(str(m) + ".0" + str(s) + "." + str(ms))
	if s >= 10:
		set_text(str(m) + "." + str(s) + "." + str(ms))



func _on_Timer_timeout():
	ms += 1
