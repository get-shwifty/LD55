extends PanelContainer

var text = ''
var center = false

func write():
	var final = text
	if center:
		final = '[center]'+text+'[/center]'
	$RichTextLabel.text = final
	$AnimationPlayer.play("fade_in")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
