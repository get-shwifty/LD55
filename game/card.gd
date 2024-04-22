extends Node2D
class_name Card

const CardType = Enums.CardType

@export var card_type: CardType = CardType.Clockwise

var total_width = 56

# 0 available 1 hover 2 selected 3 unselect 90 hover select 99 selected top
var state = 0
var trigger_select = false

var hand = null

var original: Card = null
var speed = 4
var in_pos = false
var shake = false

func type_to_background(type: CardType):
	if type == CardType.FinalTransform:
		return 1
	return 0

const LABELS_EN = [
	"Clockwise",
	"Counter-clockwise twice",
	"Repeat",
	"Repeat infinitely",
	"Mirror left/right",
	"Cross the bridge",
	"Drop to bottom",
	"Fill a circle from top",
	"Cross the final bridge",
]

const LABELS_FR = [
	"Horaire",
	"Antihoraire, deux fois",
	"Répétition",
	"Repétition infinie",
	"Symétrie gauche/droite",
	"Traverser le pont",
	"Chutter en bas",
	"Remplir un cercle depuis le haut",
	"Traverser le dernier pont",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var LABELS = LABELS_FR if get_parent().get_parent().language == "Francais" else LABELS_EN
	$Node2D/Node2D/Background.frame = type_to_background(card_type)
	$Node2D/Node2D/Symbol.frame = card_type
	$Node2D/Node2D/ToolTip/Background2.frame = $Node2D/Node2D/Background.frame
	$Node2D/Node2D/ToolTip/CenterContainer/Label.text = "[center]" + LABELS[card_type] + "[/center]"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 3:
		move_back()
	if shake:
		if state != 2:
			var now = Time.get_ticks_msec() / 30
			$Node2D/Node2D.wobble = false
			$Node2D/Node2D.position.x = 1.0 * sin(now)
			$Node2D/Node2D.position.y = 0.3 * cos(now)
		else:
			$Node2D/Node2D.wobble = true
	
func update_shape(visible_width: int):
	var shape = $Area2D/CollisionShape2D
	var width_diff = total_width - visible_width
	shape.position = Vector2(-width_diff/2, 0)
	shape.shape.size = Vector2(visible_width, shape.shape.size.y)
	
func hover():
	if (state == 99 or state == 90) and in_pos:
		hand.trigger_hover_selected(self)
		return
	if state != 0:
		return
	state = 1
	if card_type == CardType.FinalTransform:
		$Node2D/Node2D/Background.modulate = Color(0.282,0,1,1)
		$Node2D/Node2D/ToolTip/Background2.modulate = Color(0.282,0,1,1)
	else:
		$Node2D/Node2D/Background.modulate = Color(0,1,1,1)
		$Node2D/Node2D/ToolTip/Background2.modulate = Color(0,1,1,1)
	if card_type == CardType.Clockwise:
		$Node2D/Node2D/Hover.show()
		$Node2D/Node2D/Hover.play('01')
	#$Node2D/Node2D/Symbol.modulate = Color(0,1,1,1)
	$Node2D/Node2D/ContourCarte.visible = false
	z_index = 99
	$AnimationPlayer.play("up")
	Sound.ctx.card_hover.play()
	
func stop_hover():
	if state == 90 or state == 99:
		hand.stop_hover_selected(self)
		return
	if state != 1:
		return
	state = 0
	$Node2D/Node2D/Background.modulate = Color(1,1,1,1)
	$Node2D/Node2D/ToolTip/Background2.modulate = Color(1,1,1,1)
	$Node2D/Node2D/Hover.hide()
	$Node2D/Node2D/Symbol.modulate = Color(1,1,1,1)
	$Node2D/Node2D/ContourCarte.visible = false
	z_index = 0
	$AnimationPlayer.play_backwards("up")
	
func set_available():
	state = 0
	$Node2D/Node2D/Background.modulate = Color(1,1,1,1)
	$Node2D/Node2D/ToolTip/Background2.modulate = Color(1,1,1,1)
	$Node2D/Node2D/Symbol.modulate = Color(1,1,1,1)
	$Node2D/Node2D/ContourCarte.visible = false
	z_index = 0
	
func select():
	if state == 90:
		hand.clear_card(self)
		return
	if state != 1:
		return
	stop_hover()
	state = 2
	trigger_select = true
	if card_type == CardType.FinalTransform:
		$Node2D/Node2D/Background.modulate = Color(0.5,0.5,2,1)
		$Node2D/Node2D/Symbol.modulate = Color(1,1,1,0.4)
	else:
		$Node2D/Node2D/Background.modulate = Color(2,2,2,1)
		$Node2D/Node2D/Symbol.modulate = Color(1,1,1,0.4)
	#$Node2D/Node2D/ContourCarte.visible = true
	Sound.set_card()
	
func set_selected_hover():
	if state != 99:
		return
	state = 90
	$Node2D/Node2D/Background.modulate = Color(2,1,1,1)
	
func no_selected_hover():
	if state != 90:
		return
	state = 99
	$Node2D/Node2D/Background.modulate = Color(1,1,1,1)
	
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
		if event.button_index != 1:
			return
		select()
