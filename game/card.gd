extends Node2D
class_name Card

const CardType = Enums.CardType

@export var card_type: CardType = CardType.Clockwise

var total_width = 56

# 0 available 1 hover 2 selected 3 unselect
var state = 0
var trigger_select = false

var original: Card = null
var speed = 4

func type_to_background(type: CardType):
	if type == CardType.FinalTransform:
		return 1
	return 0
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D/Background.frame = type_to_background(card_type)
	$Node2D/Symbol.frame = card_type



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 3:
		move_back()
	
func update_shape(visible_width: int):
	var shape = $Area2D/CollisionShape2D
	var width_diff = total_width - visible_width
	shape.position = Vector2(-width_diff/2, 0)
	shape.shape.size = Vector2(visible_width, shape.shape.size.y)
	
func hover():
	if state != 0:
		return
	state = 1
	modulate = Color(0,1,1,1)
	z_index = 99
	$AnimationPlayer.play("up")
	
func stop_hover():
	if state != 1:
		return
	state = 0
	modulate = Color(1,1,1,1)
	z_index = 0
	$AnimationPlayer.play_backwards("up")
	
func set_available():
	state = 0
	modulate = Color(1,1,1,1)
	z_index = 0
	
func select():
	if state != 1:
		return
	stop_hover()
	state = 2
	trigger_select = true
	modulate = Color(1,1,1,0.4)
	
func send_back():
	if not original:
		return
	state = 3
	
func move_back():
	global_position = global_position.move_toward(original.global_position, speed)
	if global_position == original.global_position:
		original.set_available()
		queue_free()


func _on_area_2d_mouse_entered():
	hover()


func _on_area_2d_mouse_exited():
	stop_hover()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		select()
