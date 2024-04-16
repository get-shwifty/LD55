extends Node2D

const DATA = [
"Calm emptyness.",
"Flames, Warmth, 
Heat.",
"Wind, Breath, 
Movement.",
"Rock, Forest, 
Wild.",
"Flow, Rain, 
River.",
"Vision, Hunt, 
Predation.",
"Courage, Honesty.",
"Stealth, Speed.",
"Wisdom, Acceptance.",
"Strength, Endurance.",
"Rally, Track, 
Companionship.",
"Essence of Healing, 
Rejuvanation.",
"Essence of Discordance, 
Entropy.",
"Essence of Endings...
and Beginnings.",
"Essence of Stability, 
Cohesion.",
"??????? ???
??????????"
]

func set_node(node):
	$title.frame = node
	$desc.text = "[center]" + DATA[node] + "[/center]"
