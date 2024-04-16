extends Node2D
class_name CardHand

const CardType = Enums.CardType
const CARD_SCENE = preload('res://game/carte.tscn');

@onready var selected_hand: CardHand = $"../selected_cards"
@onready var spirit = $'../SpiritSpawn'
@onready var reset_button = $'../Reset'

@export var is_hand: bool = false
@export var nb = 6
@export var y_max_offset = 30
@export var max_width = 250

signal card_selected(card_type: CardType)
signal clear_hand()
signal update_hand(index: int)


var card_pool = [CardType.Clockwise]
var card_future_list = [
	CardType.Anticlockwise,
	CardType.Opposite,
	CardType.Down,
	CardType.Transform,
	CardType.Repeat,
	CardType.Transform,
	CardType.Repeat2,
	CardType.Tri
]
var card_list = []

var card_width = 56
var min_dist = 15
var max_dist = card_width -8
var positions = []


var move_speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	get_next_card()
	pass
	#if is_hand:
		#get_cards()
		#await get_tree().create_timer(2).timeout
		#test()
		
func clear():
	for card in card_list:
		card.queue_free()
	card_list.clear()
	positions.clear()
	if is_hand:
		selected_hand.clear()
	if not is_hand:
		visible = true
		clear_hand.emit()
		
func trigger_hover_selected(card):
	if is_hand:
		return
	var index = card_list.find(card)
	hover_index = index
	for i in range(card_list.size()):
		var c = card_list[i]
		if i < index:
			c.no_selected_hover()
		else:
			c.set_selected_hover()


var hover_index = null
func stop_hover_selected(card):
	#await get_tree().create_timer(0.1).timeout
	var i = card_list.find(card)
	if hover_index != null and i > hover_index:
		return
	card.no_selected_hover()
	if i == hover_index:
		hover_index = null
		for l in range(card_list.size()):
			if l > i:
				stop_hover_selected(card_list[l])
	
func send_back():
	visible = true
	if is_hand:
		return
	for card in card_list:
		card.send_back()
	card_list.clear()
	clear_hand.emit()


func get_cards():
	clear()
	for c in card_pool:
		give_card(c)
	if selected_hand:
		selected_hand.clear()
		
func add_available_card(type: CardType):
	if not is_hand:
		return
	card_pool.append(type)
	
	
func get_next_card():
	add_available_card(card_future_list.pop_front())
	
func clear_card(card):
	if is_hand:
		return
	var index = card_list.find(card)
	for i in range(card_list.size()):
		var c = card_list[i]
		if i >= index:
			c.send_back()

	card_list = card_list.slice(0, index)
	update_hand.emit(index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_hand:
		pass
		if Input.is_action_just_pressed("shuffle"):
			if card_future_list:
				add_available_card(card_future_list.pop_front())
			get_cards()
	else:
		if Input.is_action_just_pressed("escape"):
			if reset_button.visible:
				send_back()
		elif Input.is_action_just_pressed("right_click"):
			if card_list.size():
				clear_card(card_list[-1])
		#if Input.is_action_just_pressed("shuffle"):
			#clear_hand.emit()
		
	
	for i in card_list.size():
		var card = card_list[i]
		var new_pos = card.position.move_toward(positions[i], move_speed)
		if new_pos.distance_to(card.position) < 2:
			card.in_pos = true
		card.position = new_pos
		
	trigger_card_selection()


func select_card(card):
	var clone = CARD_SCENE.instantiate()
	clone.card_type = card.card_type
	clone.state = 99
	clone.original = card
	clone.hand = self
	var pos = card.global_position
	add_child(clone)
	clone.global_position = pos
	card_list.append(clone)
	compute_positions()
	card_selected.emit(card.card_type)
	
func trigger_card_selection():
	if not is_hand:
		return
	for card in card_list:
		if card.trigger_select:
			if spirit.current_spirit != null:
				card.set_available()
				card.trigger_select = false
				continue
			card.trigger_select = false
			selected_hand.select_card(card)


func give_card(type: CardType):
	var card = CARD_SCENE.instantiate()
	card.card_type = type
	add_child(card)
	if card_list.size() == 0:
		card.position = Vector2(0,0)
	else:
		var last_card = card_list[card_list.size()-1]
		card.position = last_card.position + Vector2(max_dist, 0)
	card_list.append(card)
	compute_positions()

func compute_positions():
	var n = card_list.size()
	var min_width = card_width + ((n-1) * min_dist)
	var card_dist = min_dist
	var bonus_width = max_width - min_width
	if n > 1 && bonus_width > 0:
		card_dist = min(card_dist + bonus_width / (n-1), max_dist)
	
	var final_width = card_width + ((n-1) * card_dist)
	
	var offset = final_width / 2.0 - card_width/2
	
	var y_offsets = []
	y_offsets.resize(n)
	y_offsets.fill(0)
	if n > 1:
		var ratio_offset = 0
		for i in range(n):
			var dist_from_center = abs((n/2.0) - (i+0.5)) / (n/2.0)
			var ratio = sqrt((1 - dist_from_center))
			if i == 0:
				ratio_offset = ratio
			y_offsets[i] = (ratio-ratio_offset) * y_max_offset
	
	positions.clear()
	for i in range(n):
		var p = -offset + (i * card_dist)
		positions.append(Vector2(p, -y_offsets[i]))
		
	for i in range(card_list.size()):
		var card = card_list[i]
		if i < card_list.size()-1:
			card.update_shape(min(card_dist, card.total_width))
			
func test():
	var counter = 0
	while true:
		if counter < 5:
			#print('size ' + str(card_list.size()))
			for c in card_list:
				if c.state == 0:
					#print('should select')
					c.state = 1
					c.select()
					break
			counter += 1
		else:
			selected_hand.send_back()
			counter = 0
		await get_tree().create_timer(0.5).timeout

func _on_reset_reset():
	send_back()
