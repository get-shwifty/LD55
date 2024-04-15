extends ScrollContainer
class_name DialogeUI

var max_scroll_length = 0 
@onready var scrollbar = get_v_scroll_bar()

var text_buffer = []
var option_buffer = []
var is_writing = false

func _ready(): 
	scrollbar.changed.connect(handle_scrollbar_changed)
	max_scroll_length = scrollbar.max_value

func handle_scrollbar_changed(): 
	if max_scroll_length != scrollbar.max_value: 
		max_scroll_length = scrollbar.max_value 
		self.scroll_vertical = max_scroll_length

@onready var DIALOGUE = preload("res://game/dialogue_text.tscn")
@onready var OPTIONS = preload("res://game/dialogue_option_list.tscn")

var listener = null

		
func select_option(index):
	listener.select_choice(index)

func add_dialogue(text, type):
	text_buffer.append(text)
	

func _process(delta):
	if text_buffer.size() and not is_writing:
		write_text_from_buffer()
	elif option_buffer.size() and not is_writing:
		write_options_from_buffer()

func write_text_from_buffer():
	var text = text_buffer[0]
	is_writing = true
	var dial = DIALOGUE.instantiate()
	dial.text = text
	dial.listener = self
	
	$VBoxContainer.add_child(dial)
	text_buffer.pop_front()
	
func write_options_from_buffer():
	var options = OPTIONS.instantiate()
	options.options = option_buffer
	options.listener = self
	$VBoxContainer.add_child(options)
	option_buffer.clear()

func add_choices(choices):

	var list = []
	for c in choices:
		list.append(c.text)
	option_buffer = list

func clear():
	for c in $VBoxContainer.get_children():
		c.queue_free()
	

#func scroll_bottom():
	#ensure_control_visible()
