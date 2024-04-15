extends Node

@onready var attrape_reve = $"../AttrapeReve"
@onready var cards_hand = $"../card_hand"

var last_node = 0
var current_node = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_selected_cards_card_selected(card_type):
	pass


func _on_selected_cards_clear_hand():
	last_node = 0
	current_node = 0
	attrape_reve.clear_all()
