extends Node2D

#   2   3
# 1       4
#     0
#
#     5
# 10      6
# 9       7
#     8
#    11
#
#    12
# 15    13
#    14
#
#    16

@onready var animation = $AnimationPlayer
@onready var ropes_sprite = preload("res://ropes.tscn")
@onready var nodes_sprite = preload("res://illuminated_nodes.tscn")

var current_node = 0
var illuminated_nodes = {}
var shown_ropes = {}
var discovery_step = 1

enum Card {
	CLOCKWISE, ANTICLOCKWISE, SYMMETRY, DOWN, TRANSFORM
}
const ROPE_TO_FRAME = {
	"0 1" = 5,
	"0 2" = 2,
	"0 3" = 0,
	"0 4" = 1,
	"1 2" = 4,
	"1 3" = 7,
	"1 4" = 8,
	"2 3" = 6,
	"2 4" = 8,
}
const NODE_TO_FRAME = [0, 1, 2, 3, 4, 5, 6, 10, 9]


# Called when the node enters the scene tree for the first time.
func _ready():
	#animation.play("AttrapeReveGrand2")
	#animation.queue("AttrapeReveGrand3")
	#animation.queue("AttrapeReveGrand4")
	show_rope("1 2")
	show_rope("1 4")
	show_rope("0 3")
	hide_rope("0 3")
	set_discovery_step(2)
	set_discovery_step(3)
	show_node(0)
	show_node(5)
	show_node(6)
	hide_node(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func ensure_rope(rope):
	if rope not in shown_ropes:
		shown_ropes[rope] = ropes_sprite.instantiate()
		shown_ropes[rope].frame = ROPE_TO_FRAME[rope]
		add_child(shown_ropes[rope])

func show_rope(rope):
	ensure_rope(rope)

	shown_ropes[rope].modulate = Color(Color.WHITE, 0.0)
	var tween = get_tree().create_tween()
	tween.tween_property(shown_ropes[rope], "modulate", Color(Color.WHITE, 1.0), 0.15)

func hide_rope(rope):
	ensure_rope(rope)

	shown_ropes[rope].modulate = Color(Color.WHITE, 1.0)
	var tween = get_tree().create_tween()
	tween.tween_property(shown_ropes[rope], "modulate", Color(Color.WHITE, 0.0), 0.15)

func set_discovery_step(step):
	if discovery_step >= step:
		return
	discovery_step = step
	animation.queue("AttrapeReveGrand" + str(step))

func ensure_node(node):
	if node not in illuminated_nodes:
		illuminated_nodes[node] = nodes_sprite.instantiate()
		illuminated_nodes[node].frame = NODE_TO_FRAME[node]
		add_child(illuminated_nodes[node])

func show_node(node):
	ensure_node(node)

	illuminated_nodes[node].modulate = Color(Color.WHITE, 0.0)
	var tween = get_tree().create_tween()
	tween.tween_property(illuminated_nodes[node], "modulate", Color(Color.WHITE, 1.0), 0.15)

func hide_node(node):
	ensure_node(node)

	illuminated_nodes[node].modulate = Color(Color.WHITE, 1.0)
	var tween = get_tree().create_tween()
	tween.tween_property(illuminated_nodes[node], "modulate", Color(Color.WHITE, 0.0), 0.15)
