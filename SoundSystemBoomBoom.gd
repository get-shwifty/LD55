extends Node
class_name SoundSystemBoomBoom

const EPILOGUE_MUSIC = preload("res://resources/sounds/Sorcerers choice.ogg")

@onready var background = $Background
@onready var invocation = $Invocation
@onready var card_hover = $CardHover
@onready var set_card = $SetCard
@onready var write = $Write

# Called when the node enters the scene tree for the first time.
func _ready():
	Sound.ctx = self

func launch_epilogue():
	$Background.set_stream(EPILOGUE_MUSIC)
	$Background.play()
