extends PanelContainer

@onready var OPTION = preload("res://game/dialogue_option.tscn")
var options = []
var listener = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(options.size()):
		var option = options[i]
		var op = OPTION.instantiate()
		op.text = option
		op.index = i
		op.listener = self
		$MarginContainer/VBoxContainer.add_child(op)

func select_option(option):
	listener.select_option(option.index)
	#queue_free()
	await get_tree().physics_frame
	visible = false
	#var children = $MarginContainer/VBoxContainer.get_children()
	#for c in children:
		#if c != option:
			#self.remove_child(c)
			#c.queue_free()
	#option.end_selection()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
