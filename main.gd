extends Node2D
@onready var _ink_player: InkPlayer = $InkPlayer

func _ready():
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.create_story()


func _story_loaded(successfully: bool):
	if !successfully:
		return

	_continue_story()


func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()

		# This text is a line of text from the ink story.
		# Set the text of a Label to this value to display it in your game.
		print(text)

	if _ink_player.has_choices:
		# 'current_choices' contains a list of the choices, as strings.
		for choice in _ink_player.current_choices:
			print(choice)

		# '_select_choice' is a function that will take the index of
		# your selection and continue the story by calling again
		# `_continue_story()`.
		#_select_choice(0)

	else:
		# This code runs when the story reaches it's end.
		print("The End")
