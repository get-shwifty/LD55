extends Node2D

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

@onready var animation = $AnimationPlayer
@onready var nodes_pos = $NodesPos
@onready var particles = $Particles
@onready var ropes_sprite = preload("res://ropes.tscn")
@onready var nodes_sprite = preload("res://illuminated_nodes.tscn")

@onready var attrape1 = $AttrapeReveGrand
@onready var attrape2 = $AttrapeReveGrand2
@onready var attrape3 = $AttrapeReveGrand3
@onready var attrape4 = $AttrapeReveGrand4

var illuminated_nodes = {}
var shown_ropes = {}
var discovery_step = 1
var current_particle = 0

const ROPE_TO_FRAME = {
	"0 1" = 5, "0 2" = 2, "0 3" = 0, "0 4" = 1,
	"1 2" = 4, "1 3" = 7, "1 4" = 8,
	"2 3" = 6, "2 4" = 27, "3 4" = 3,
	"0 5" = 29,
	"5 6" = 14, "5 7" = 19, "5 8" = 15, "5 9" = 18, "5 10" = 9,
	"6 7" = 13, "6 8" = 30, "6 9" = 16, "6 10" = 32,
	"7 8" = 12, "7 9" = 20, "7 10" = 17,
	"8 9" = 11, "8 10" = 31, "9 10" = 10,
	"8 11" = 28,
	"11 12" = 26, "11 13" = 22, "11 14" = 23,
	"12 13" = 25, "12 14" = 21, "13 14" = 24,
	"13 15" = 33
}
const NODE_TO_FRAME = [0, 1, 2, 3, 4, 5, 6, 10, 9, 8, 7, 11, 12, 13, 14, 15]


# Called when the node enters the scene tree for the first time.
func _ready():
	#animation.play("AttrapeReveGrand2")
	#set_discovery_step(2)
	#set_discovery_step(3)
	#set_discovery_step(4)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var now = Time.get_ticks_msec()
	var x = sin(now / 2000.) * 6
	attrape1.position.x = x * 0.25
	attrape2.position.x = x * 0.5
	attrape3.position.x = x * 0.75
	attrape4.position.x = x
	for i in illuminated_nodes.keys():
		if i < 5:
			illuminated_nodes[i].position.x = attrape1.position.x
		elif i < 11:
			illuminated_nodes[i].position.x = attrape2.position.x
		elif i < 15:
			illuminated_nodes[i].position.x = attrape3.position.x
		elif i == 15:
			illuminated_nodes[i].position.x = attrape4.position.x
	for rope in shown_ropes.keys():
		var i = int(rope.split(" ")[1])
		if i < 5:
			shown_ropes[rope].position.x = attrape1.position.x
		elif i < 11:
			shown_ropes[rope].position.x = attrape2.position.x
		elif i < 15:
			shown_ropes[rope].position.x = attrape3.position.x
		elif i == 15:
			shown_ropes[rope].position.x = attrape4.position.x
	if current_particle < 5:
		particles.offset.x = attrape1.position.x
	elif current_particle < 11:
		particles.offset.x = attrape2.position.x
	elif current_particle < 15:
		particles.offset.x = attrape3.position.x
	elif current_particle == 15:
		particles.offset.x = attrape4.position.x

func ensure_rope(rope):
	if rope not in shown_ropes:
		shown_ropes[rope] = ropes_sprite.instantiate()
		shown_ropes[rope].name = rope
		shown_ropes[rope].frame = ROPE_TO_FRAME[rope]
		shown_ropes[rope].modulate = Color(Color.WHITE, 0.0)
		add_child(shown_ropes[rope])

func show_rope(rope):
	ensure_rope(rope)

	var tween = create_tween()
	tween.tween_property(shown_ropes[rope], "modulate", Color(Color.WHITE, 1.0), 0.15)

func hide_rope(rope):
	ensure_rope(rope)

	var tween = create_tween()
	tween.tween_property(shown_ropes[rope], "modulate", Color(Color.WHITE, 0.0), 0.15)

func set_discovery_step(step):
	if discovery_step >= step:
		return
	discovery_step = step
	animation.queue("AttrapeReveGrand" + str(step))

func ensure_node(node):
	if node not in illuminated_nodes:
		illuminated_nodes[node] = nodes_sprite.instantiate()
		illuminated_nodes[node].frame = node
		illuminated_nodes[node].modulate = Color(Color.WHITE, 0.0)
		add_child(illuminated_nodes[node])

func show_node(node):
	ensure_node(node)

	var tween = create_tween()
	tween.tween_property(illuminated_nodes[node], "modulate", Color(Color.WHITE, 1.0), 0.15)

func hide_node(node):
	ensure_node(node)

	var tween = create_tween()
	tween.tween_property(illuminated_nodes[node], "modulate", Color(Color.WHITE, 0.0), 0.15)

func show_particles(node):
	particles.show()
	particles.position = nodes_pos.position + nodes_pos.get_child(node).position
	current_particle = node
	
func hide_particles():
	particles.hide()

func clear_all():
	hide_particles()
	for rope in shown_ropes.keys():
		hide_rope(rope)
	for node in illuminated_nodes.keys():
		hide_node(node)
