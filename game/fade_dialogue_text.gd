extends PanelContainer

var text = ''
var center = false
var listener = null
var bigger = false

func write():
	var final = text
	if bigger:
		pass
		#final = '[b]'+final+'[/b]'
	if center:
		final = '[center]' + final + '[/center]'
	$RichTextLabel.text = final
	$AnimationPlayer.play("fade_in")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.modulate = Color(1,1,1,0)
	write()
	if bigger:
		pass
		$RichTextLabel.add_theme_font_size_override("normal_font_size", 22)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	listener.notify_write_end()
