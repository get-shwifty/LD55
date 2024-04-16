extends Area2D

@onready var game_manager = $'../GameManager'
@onready var spawner = $'../SpiritSpawn'

signal summon()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_manager.path_nodes.size() == 0:
		visible = false
	elif game_manager.path_nodes.size() == 1 and game_manager.path_nodes[-1] == 0:
		visible = false


func _on_input_event(viewport, event, shape_idx):
	if not event.is_pressed():
		return
	summon.emit()



func _on_mouse_entered():
	$AnimatedSprite2D.frame = 1


func _on_mouse_exited():
	$AnimatedSprite2D.frame = 0


func _on_selected_cards_card_selected(card_type):
	visible = true
	

func _on_selected_cards_clear_hand():
	visible = false
