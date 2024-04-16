extends Area2D

signal reset()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if not event.is_pressed():
		return
	reset.emit()


func _on_selected_cards_card_selected(card_type):
	visible = true

func _on_selected_cards_clear_hand():
	visible = false


func _on_mouse_exited():
	$AnimatedSprite2D.frame = 0


func _on_mouse_entered():
		$AnimatedSprite2D.frame = 1


func _on_selected_cards_update_hand(index):
	if index == 0:
		_on_selected_cards_clear_hand()
