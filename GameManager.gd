extends Node

#   2   3
# 1       4
#     0
#
#     5
# 10      6
# 9       7
#     8
#
#    11
# 14    12
#    13
#
#    15

const CardType = Enums.CardType

@onready var attrape_reve = $"../AttrapeReve"
@onready var cards_hand = $"../card_hand"

const OPPOSITE = {
	1: 3, 3: 1, 2: 4, 4: 2,
	5: 8, 8: 5, 10: 7, 7: 10, 6: 9, 9: 6,
	11: 13, 13: 11, 14: 12, 12: 14
}
const DOWN = {
	1: 0, 2: 0, 3: 0, 4: 0,
	5: 8, 6: 8, 7: 8, 9: 8, 10: 8,
	11: 13, 12: 13, 14: 13
}
const TRANSFORM = { 0: 5, 5: 0, 8: 11, 11: 8 }

var path_nodes = [0]
var path_cards = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_selected_cards_clear_hand()

func step(card: CardType, coeff=1):
	var cur = path_nodes[-1]
	var next = -1
	if card == CardType.Clockwise:
		if cur < 5:
			next = (cur + coeff) % 5
		elif cur < 11:
			next = ((cur - 5 + coeff) % 6) + 5
		elif cur < 15:
			next = ((cur - 11 + coeff) % 4) + 11
		step_one(next)
	elif card == CardType.Anticlockwise:
		if cur < 5:
			next = (cur - coeff + 5) % 5
		elif cur < 11:
			next = ((cur - 5 - coeff + 6) % 6) + 5
		elif cur < 15:
			next = ((cur - 11 - coeff + 4) % 4) + 11
		step_one(next)
	elif card == CardType.Repeat:
		if len(path_cards) >= 1:
			step_repeat(path_cards[-1])
	elif card == CardType.Repeat2:
		var previous_card = -1
		var ratio = 1
		if len(path_cards) >= 2 and path_cards[-1] == CardType.Repeat:
			previous_card = path_cards[-2]
			if previous_card == CardType.Repeat:
				previous_card = -1
				if len(path_cards) >= 3 and path_cards[-2] == CardType.Repeat:
					previous_card = path_cards[-3]
					ratio = 2
		if previous_card == CardType.Clockwise or \
			previous_card == CardType.Anticlockwise:
			if cur < 5:
				step_repeat(CardType.Repeat, ratio)
				step_repeat(CardType.Repeat, ratio)
				step_repeat(CardType.Repeat, ratio)
				step_repeat(CardType.Repeat, ratio)
			elif cur < 11:
				step_repeat(CardType.Repeat, ratio)
				step_repeat(CardType.Repeat, ratio)
	elif card == CardType.Opposite:
		if cur in OPPOSITE:
			step_one(OPPOSITE[cur])
	elif card == CardType.Transform:
		if len(path_nodes) >= 3 and cur in TRANSFORM:
			step_one(TRANSFORM[cur])
	elif card == CardType.Down:
		if cur in DOWN:
			step_one(DOWN[cur])
	elif card == CardType.Tri:
		if cur == 11:
			rope_show(11, 12)
			rope_show(11, 13)
			rope_show(11, 14)
			path_nodes.append(12)
			path_nodes.append(14)
			path_nodes.append(13)
		if cur == 5:
			rope_show(5, 6)
			rope_show(5, 7)
			rope_show(5, 8)
			rope_show(5, 9)
			rope_show(5, 10)
			path_nodes.append(6)
			path_nodes.append(7)
			path_nodes.append(9)
			path_nodes.append(10)
			path_nodes.append(8)
	elif card == CardType.FinalTransform:
		if cur == 13: # TODO need all nodes?
			step_one(15)

func step_one(next):
	if next < 0:
		return
	if len(path_nodes) >= 2 and path_nodes[-2] == next:
		var remove_node = path_nodes.pop_back()
		rope_hide(path_nodes[-1], remove_node)
	else:
		rope_show(path_nodes[-1], next)
		path_nodes.append(next)

func step_repeat(previous_card, ratio=1):
	if previous_card == CardType.Opposite or \
		previous_card == CardType.Transform:
			step(previous_card)
	elif previous_card == CardType.Clockwise:
		step(CardType.Anticlockwise)
		step(CardType.Clockwise, 2)
	elif previous_card == CardType.Anticlockwise:
		step(CardType.Clockwise)
		step(CardType.Anticlockwise, 2)
	elif previous_card == CardType.Repeat:
		if len(path_cards) >= 2:
			var pprevious_card = path_cards[-1-ratio]
			if pprevious_card == CardType.Clockwise or \
				pprevious_card == CardType.Anticlockwise:
				step(pprevious_card)
			step_repeat(pprevious_card)

func get_rope(from, to):
	return str(min(from, to)) + " " + str(max(from, to))
	
func rope_show(previous, next):
	var rope = get_rope(previous, next)
	attrape_reve.show_rope(rope)
	
func rope_hide(previous, last_to_remove):
	var rope = get_rope(previous, last_to_remove)
	attrape_reve.hide_rope(rope)

func _on_selected_cards_card_selected(card):
	step(card)
	path_cards.append(card)
	for i in range(16):
		attrape_reve.hide_node(i)
	for i in path_nodes:
		attrape_reve.show_node(i)
	if len(path_nodes) >= 2:
		attrape_reve.show_particles(path_nodes[-1])
	else:
		attrape_reve.hide_particles()
	
	# TODO new card if all symbols are enabled


func _on_selected_cards_clear_hand():
	path_cards = []
	path_nodes = [0]
	attrape_reve.clear_all()
	attrape_reve.show_node(0)
	attrape_reve.hide_particles()

	if len(cards_hand.card_list) >= 5:
		attrape_reve.set_discovery_step(2)
	if len(cards_hand.card_list) >= 7:
		attrape_reve.set_discovery_step(3)
	if len(cards_hand.card_list) >= 11:
		attrape_reve.set_discovery_step(4)

