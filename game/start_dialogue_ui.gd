extends ScrollContainer
class_name StartDialogeUI

@export var center_all = false

var max_scroll_length = 0 
@onready var scrollbar = get_v_scroll_bar()

var text_buffer = []
var option_buffer = []
var is_writing = false
var tag_buffer = []

var select_language_mode = true
var first = true

func _ready(): 
	scrollbar.changed.connect(handle_scrollbar_changed)
	max_scroll_length = scrollbar.max_value

func handle_scrollbar_changed():
	if max_scroll_length != scrollbar.max_value: 
		max_scroll_length = scrollbar.max_value 
		self.scroll_vertical = max_scroll_length

@onready var DIALOGUE = preload("res://game/fade_dialogue_text.tscn")
@onready var OPTIONS = preload("res://game/dialogue_option_list.tscn")

var listener = null

var spacing_buffer = "\n"
		
func select_option(option):
	if select_language_mode:
		listener.select_language(option)
		return
	
	listener.select_choice(option.index)
	if option.tags:
		listener.execute_tags(option.tags)

func add_dialogue(text, type, tags):
	for t in tags:
		if t == "p":
			type = 0
		if t == "c":
			type = 2
	text = text + spacing_buffer;
	text_buffer.append([text, type, tags])
	
func notify_write_end():
	is_writing = false
	if tag_buffer:
		execute_tags()

func execute_tags():
	listener.execute_tags(tag_buffer)
	tag_buffer = []
	

func _process(delta):
	if text_buffer.size() and not is_writing:
		write_text_from_buffer()
	elif option_buffer.size() and not is_writing:
		write_options_from_buffer()

func write_text_from_buffer():
	var text_req = text_buffer[0]
	var text = text_req[0]
	var type = text_req[1]
	is_writing = true
	var dial = DIALOGUE.instantiate()
	dial.text = text
	dial.listener = self
	dial.center = center_all
	tag_buffer = text_req[2]
	
	if !select_language_mode && first:
		dial.bigger = true
		first = false
	
	$VBoxContainer.add_child(dial)
	text_buffer.pop_front()
	
func write_options_from_buffer():
	var options = OPTIONS.instantiate()
	options.options = option_buffer
	options.listener = self
	$VBoxContainer.add_child(options)
	option_buffer.clear()

func add_choices(choices):
	option_buffer = choices

func clear():
	for c in $VBoxContainer.get_children():
		c.queue_free()
	

#func scroll_bottom():
	#ensure_control_visible()
