extends Node2D

@export var skip = false
@export var skip_to: String = ""


@onready var _ink_player: InkPlayer = $InkPlayer
@onready var game_dialogue: DialogeUI = $"Dialogue UI"
@onready var start_dialogue: StartDialogeUI = $"StartBackground/Dialogue UI"
@onready var character_selection = $Fond/Perso
@onready var dialogue = start_dialogue
@onready var card_hand = $card_hand
@onready var spirit_spawn = $SpiritSpawn
@onready var summon_button = $Summon
@onready var reset_button = $Reset
@onready var game_manager = $GameManager
@onready var dream_catcher = $AttrapeReve
@onready var wrong = $Wrong

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
	reset_button.visible = false
	wrong.visible = false
	summon_button.visible = false
	
	#start_game()
	
func is_perso(t):
	return ['hototo', 'kaya', 'aponi', 'petrel', 'hyij'].has(t)


func _story_loaded(successfully: bool):
	if !successfully:
		return

	if skip:
		_skip_until_start()
	else:
		_continue_story()

func select_choice(index: int):
	_ink_player.choose_choice_index(index)
	await get_tree().physics_frame
	_continue_story()
	
func _process(delta):
	pass
	#if Input.is_action_just_pressed("escape"):
		#reset()
		
#func reset():
	#_ink_player.reset()
	#dialogue.clear()
	#_continue_story()
	#

func execute_tags(tags):
	for t in tags:
		if is_perso(t):
			character_selection.select_perso(t)
		if t == "hide":
			character_selection.select_perso("")
		if t == "clear":
			dialogue.clear()
			card_hand.clear()
			dream_catcher.clear_all()
			spirit_spawn.hide_spirit()
		if t == "add_rune":
			card_hand.get_next_card()
			pass
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
		print('path: ' + _ink_player.get_current_path())
		var text = _ink_player.continue_story()

		# This text is a line of text from the ink story.
		# Set the text of a Label to this value to display it in your game.
		var type = 1
		var tags = _ink_player.current_tags
		print(text + '  ' + str(tags))
		dialogue.add_dialogue(text, type, tags)

	if _ink_player.has_choices:
		## 'current_choices' contains a list of the choices, as strings.
		#for choice in _ink_player.current_choices:
		var choices = _ink_player.current_choices
		for c in choices:
			print(c.text + '   ' + str(c.tags))
		if not manage_craft(choices):
			dialogue.add_choices(choices)
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

var possible_spirits = []
var is_crafting = false
func start_craft(spirits):
	wrong.visible = false
	print(spirits)
	card_hand.get_cards()
	is_crafting = true
	possible_spirits = spirits
	summon_button.visible = true
	
func stop_craft():
	card_hand.selected_hand.clear()
	card_hand.clear()
	is_crafting = false
	possible_spirits.clear()

func try_summon(spirit):
	print('try spirit: ' + spirit)
	if possible_spirits.has(spirit):
		reset_button.visible = false
		card_hand.selected_hand.visible = false
		summon(spirit)
	else:
		spirit_spawn.show_spirit(spirit)
		wrong.visible = true
		card_hand.selected_hand.visible = false

func summon(spirit):
	spirit_spawn.show_spirit(spirit)
	summon_button.visible = false
	#card_hand.selected_hand.clear()
	
	var index = possible_spirits.find(spirit)
	_ink_player.choose_choice_index(index)
	#_ink_player.continue_story()
	_continue_story()
	
func manage_craft(choices):
	var choice = choices[0]
	if not choice.tags or not choice.tags.has("spirit_choice"):
		return false
	_ink_player.choose_choice_index(0)
	_ink_player.continue_story()
	var next_choices = _ink_player.current_choices
	for c in next_choices:
		print(c.text)
	var spirits = []
	for c in next_choices:
		spirits.append(c.text)
	start_craft(spirits)
	return true

func cannot_summon():
	print('cannot summon')
	start_craft(possible_spirits)

func _on_selected_cards_card_selected(card_type):
	print('selected')
	print(card_type)


func _on_selected_cards_clear_hand():
	print('clear hand')


func _on_summon_summon():
	if game_manager.path_nodes.size() == 0:
		cannot_summon()
	var index = game_manager.path_nodes[-1]
	var spirit = Enums.spirit_map[index]
	try_summon(spirit)
