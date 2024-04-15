extends Node2D
@onready var _ink_player: InkPlayer = $InkPlayer
@onready var game_dialogue: DialogeUI = $"Dialogue UI"
@onready var start_dialogue: DialogeUI = $"StartBackground/Dialogue UI"
@onready var character_selection = $Fond/Perso
@onready var dialogue = start_dialogue

var start_window = true

func start_game():
	start_window = false
	dialogue = game_dialogue
	$StartBackground/AnimationPlayer.play("hide")

func _ready():
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.create_story()
	game_dialogue.listener = self
	start_dialogue.listener = self
	
	#start_game()
	
func is_perso(t):
	return ['hototo', 'kaya', 'aponi', 'petrel', 'hyij'].has(t)


func _story_loaded(successfully: bool):
	if !successfully:
		return
	#_continue_story()
	_skip_until_start()

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
	

func execute_tags(tags):
	for t in tags:
		if is_perso(t):
			character_selection.select_perso(t)
		if t == "hide":
			character_selection.select_perso("")
		if t == "clear":
			dialogue.clear()
		if t == "start":
			start_game()
			
func _skip_until_start():
	start_game()
	var finished = false
	while not finished:
		#print('loop ' + str(_ink_player.can_continue))
		while _ink_player.can_continue:
			_ink_player.continue_story()
		if _ink_player.has_choices:
			for c in _ink_player.current_choices:
				if c.tags and c.tags.has('start'):
					finished = true
			var index = _ink_player.current_choices.size()-1
			print(_ink_player.current_choices[index].text)
			_ink_player.choose_choice_index(index)
	_continue_story()

func _continue_story():
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()

		# This text is a line of text from the ink story.
		# Set the text of a Label to this value to display it in your game.
		var type = 1
		var tags = _ink_player.current_tags

		dialogue.add_dialogue(text, type, tags)

	if _ink_player.has_choices:
		## 'current_choices' contains a list of the choices, as strings.
		#for choice in _ink_player.current_choices:

		dialogue.add_choices(_ink_player.current_choices)
		#for c in _ink_player.current_choices:
			#if c.tags:
				#print(c.tags)
		# '_select_choice' is a function that will take the index of
		# your selection and continue the story by calling again
		# `_continue_story()`.
		#_select_choice(0)

	else:
		# This code runs when the story reaches it's end.
		print("The End")


func _on_selected_cards_card_selected(card_type):
	print('selected')
	print(card_type)


func _on_selected_cards_clear_hand():
	print('clear hand')
