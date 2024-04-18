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
@onready var spirit_desc = $"../SpiritDesc"

const OPPOSITE = {
	2: 3, 3: 2, 1: 4, 4: 1,
	10: 6, 6: 10, 9: 7, 7: 9,
	14: 12, 12: 14
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

func step(card: CardType):
	var cur = path_nodes[-1] if path_nodes else 0
	var next = -1
	if card == CardType.Clockwise:
		if cur < 5:
			next = (cur + 1) % 5
		elif cur < 11:
			next = ((cur - 5 + 1) % 6) + 5
		elif cur < 15:
			next = ((cur - 11 + 1) % 4) + 11
		step_one(next)
	elif card == CardType.Anticlockwise:
		if cur < 5:
			next = (cur - 2 + 5) % 5
		elif cur < 11:
			next = ((cur - 5 - 2 + 6) % 6) + 5
		elif cur < 15:
			next = ((cur - 11 - 2 + 4) % 4) + 11
		step_one(next)
	elif card == CardType.Repeat:
		if len(path_cards) >= 1:
			step(path_cards[-1])
	elif card == CardType.Repeat2:
		if len(path_cards) >= 1:
			var previous_card = path_cards[-1]
			var ratio = 1
			var double = false
			if previous_card == CardType.Repeat and len(path_cards) >= 2:
				previous_card = path_cards[-2]
				double = true
			if previous_card == CardType.Clockwise or \
				previous_card == CardType.Anticlockwise:
				if not double:
					step(previous_card)
				if cur < 15:
					step(previous_card)
				if 11 <= cur and cur <= 14:
					step(previous_card)
				if previous_card == CardType.Clockwise and 5 <= cur and cur <= 10:
					step(previous_card)
					step(previous_card)
					step(previous_card)
				if cur < 5:
					step(previous_card)
					step(previous_card)
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
	
	check_all_visited()
	update_display()

func check_all_visited():
	if path_nodes:
		var visited = {}
		for node in path_nodes:
			visited[node] = true
		var all_visited = len(visited) == 15

		if all_visited and len(cards_hand.card_pool) < 10 and len(path_nodes) >= 14:
			attrape_reve.set_discovery_step(4)
			cards_hand.add_available_card(CardType.FinalTransform)
			cards_hand.give_card(CardType.FinalTransform)
		
		cards_hand.card_list[-1].shake = len(cards_hand.card_pool) == 10 and path_nodes[-1] == 13
	

func update_display():
	for i in range(16):
		attrape_reve.hide_node(i)
	for i in range(1, len(path_nodes)):
		attrape_reve.show_node(path_nodes[i])

	if len(path_nodes) >= 2:
		spirit_desc.show()
		spirit_desc.set_node(path_nodes[-1])
		attrape_reve.show_particles(path_nodes[-1])
	else:
		spirit_desc.hide()
		attrape_reve.hide_particles()

func _on_selected_cards_clear_hand():
	path_cards = []
	path_nodes = [0]
	attrape_reve.clear_all()
	attrape_reve.hide_particles()
	spirit_desc.hide()

	if len(cards_hand.card_list) >= 5:
		attrape_reve.set_discovery_step(2)
	if len(cards_hand.card_list) >= 7:
		attrape_reve.set_discovery_step(3)



func _on_selected_cards_update_hand(index):
	var remain = path_cards.slice(0, index)
	_on_selected_cards_clear_hand()
	for r in remain:
		_on_selected_cards_card_selected(r)
