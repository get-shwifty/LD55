extends PanelContainer

var type = 0
var text = ''
var text_buffer = ''
var speed = 2
var listener = null
var center_all = false

var final_text = ''
# Called every frame. 'delta' is the elapsed time since the previous frame.

func write_to_ui():
	var res = final_text
	if center_all:
		res = '[center]' + final_text + '[/center]'
	$MarginContainer/PanelContainer/MarginContainer/RichTextLabel4.text = res
	Sound.write()

func _ready():
	text_buffer = text
	if text_buffer.length() == 0:
		listener.notify_write_end()
	#$MarginContainer/PanelContainer/MarginContainer/RichTextLabel4.text = text

	var style = $MarginContainer/PanelContainer.get_theme_stylebox("panel", "")
	
	if type == 0:
		$MarginContainer.add_theme_constant_override("margin_left", 20)
		$MarginContainer.add_theme_constant_override("margin_right", 0)
		style.bg_color = Color(83/255.0, 80/255.0, 158/255.0)
		#$MarginContainer/PanelContainer.add_theme_constant_override("bg_color", Color(255,0,0))
	
	
	if type == 1:
		$MarginContainer.add_theme_constant_override("margin_left", 10)
		$MarginContainer.add_theme_constant_override("margin_right", 10)
		style.bg_color = Color(0,0,0,0)
	if type == 2:
		$MarginContainer.add_theme_constant_override("margin_left", 0)
		$MarginContainer.add_theme_constant_override("margin_right", 20)
		style.bg_color = Color(41/255.0, 40/255.0, 78/255.0)
		
	
	$MarginContainer/PanelContainer.add_theme_stylebox_override("panel", style)

func write_to_text():
	var to_write_n = min(speed, text_buffer.length())
	var to_write = text_buffer.left(to_write_n)
	text_buffer = text_buffer.erase(0, to_write_n)
	final_text += to_write
	write_to_ui()
	if text_buffer.length() == 0:
		listener.notify_write_end()
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
