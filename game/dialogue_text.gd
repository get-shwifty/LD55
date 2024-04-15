extends PanelContainer

var type = 0
var text = ''
var text_buffer = ''
var speed = 2
var listener = null
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	text_buffer = text
	#$MarginContainer/PanelContainer/MarginContainer/RichTextLabel4.text = text
	type = randi_range(0, 2)

	var style = $MarginContainer/PanelContainer.get_theme_stylebox("panel", "")
	
	if type == 0:
		$MarginContainer.add_theme_constant_override("margin_left", 20)
		$MarginContainer.add_theme_constant_override("margin_right", 0)
		style.bg_color = Color(1,0,0)
		#$MarginContainer/PanelContainer.add_theme_constant_override("bg_color", Color(255,0,0))
	
	
	if type == 1:
		$MarginContainer.add_theme_constant_override("margin_left", 10)
		$MarginContainer.add_theme_constant_override("margin_right", 10)
		style.bg_color = Color(0,0,0,0)
	if type == 2:
		$MarginContainer.add_theme_constant_override("margin_left", 0)
		$MarginContainer.add_theme_constant_override("margin_right", 20)
		style.bg_color = Color(0,0,1)
		
	
	$MarginContainer/PanelContainer.add_theme_stylebox_override("panel", style)

func write_to_text():
	var to_write_n = min(speed, text_buffer.length())
	var to_write = text_buffer.left(to_write_n)
	text_buffer = text_buffer.erase(0, to_write_n)
	$MarginContainer/PanelContainer/MarginContainer/RichTextLabel4.text += to_write
	if text_buffer.length() == 0:
		listener.is_writing = false
		$Timer.stop()


func _process(delta):
	if Input.is_action_just_pressed("enter"):
		write_all_buffer()
		
func write_all_buffer():
	if text_buffer.length() == 0:
		return
	speed = 1000000
	write_to_text()

func _on_timer_timeout():
	if text_buffer.length():
		write_to_text()
