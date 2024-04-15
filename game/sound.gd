extends Node

var card_counter = 0
var card_counter_max = 3

var sound_counter = 0
var sound_counter_max = 3

var ctx: SoundSystemBoomBoom = null

func set_card():
	var i = card_counter % card_counter_max
	ctx.set_card.get_child(i).play()
	card_counter += 1

func write():
	var i = sound_counter % sound_counter_max
	ctx.write.get_child(i).play()
	sound_counter += 1
