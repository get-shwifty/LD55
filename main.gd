extends Node2D
@onready var _ink_player: InkPlayer = $InkPlayer
@onready var dialogue: DialogeUI = $"Dialogue UI"

func _ready():
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.create_story()
	dialogue.listener = self


func _story_loaded(successfully: bool):
	if !successfully:
		return

	_continue_story()

func select_choice(index: int):
	_ink_player.choose_choice_index(index)
	await get_tree().physics_frame
	_continue_story()
	
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		reset()
		
func reset():
	_ink_player.reset()
	dialogue.clear()
	_continue_story()

func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()

		# This text is a line of text from the ink story.
		# Set the text of a Label to this value to display it in your game.
		dialogue.add_dialogue(text, 0)

	if _ink_player.has_choices:
		## 'current_choices' contains a list of the choices, as strings.
		#for choice in _ink_player.current_choices:
		#
		dialogue.add_choices(_ink_player.current_choices)
		# '_select_choice' is a function that will take the index of
		# your selection and continue the story by calling again
		# `_continue_story()`.
		#_select_choice(0)

	else:
		# This code runs when the story reaches it's end.
		print("The End")
