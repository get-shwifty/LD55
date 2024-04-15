extends PanelContainer

var text = ''
var listener = null
var selectable = true
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = text
	mouse_default_cursor_shape = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func end_selection():
	selectable = false
	mouse_default_cursor_shape = 0
	var style = get_theme_stylebox("panel", "")
	style.bg_color = Color(0.3, 0.3, 0.3)
	add_theme_stylebox_override("panel", style)
	

func _on_gui_input(event):
	if not selectable:
		return
	if event.is_pressed():
		listener.select_option(self)
