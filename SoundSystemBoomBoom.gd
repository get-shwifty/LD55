extends Node
class_name SoundSystemBoomBoom


@onready var background = $Background
@onready var invocation = $Invocation
@onready var card_hover = $CardHover
@onready var set_card = $SetCard
@onready var write = $Write

# Called when the node enters the scene tree for the first time.
func _ready():
	Sound.ctx = self
	$Background.play()
