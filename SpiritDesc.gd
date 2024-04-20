extends Node2D

const DATA_EN = [
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

const DATA_FR = [
"Calme vacuité.",
"Flammes, Chaleur, 
Braises.",
"Vent, Souffle, 
Mouvement.",
"Roche, Forêt, 
Nature.",
"Humidité, Pluie, 
Rivière.",
"Vision, Chasse, 
Prédation.",
"Courage, Honnêteté.",
"Discrétion, Vitesse.",
"Sagesse, Acceptation.",
"Force, Endurance.",
"Flaire, Pistage, 
Esprit de meute.",
"Incarnation du soin, 
Rajeunissement.",
"Incarnation de la Discorde, 
Entropie.",
"Incarnation de la Fin...
et du Commencement.",
"Incarnation de la Stabilité, 
Cohésion.",
"??????? ???
??????????"
]

func set_node(node):
	var DATA = DATA_FR if get_parent().language == "Francais" else DATA_EN
	$title.frame = node
	$desc.text = "[center]" + DATA[node] + "[/center]"
