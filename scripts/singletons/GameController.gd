extends Node

var Card = preload("res://scenes/Card.tscn")
var active_deck: Array = CardDictionary.default_deck
var active_hand: Array = []
var turn_count: int = 0
var hand_size: int = 7
var use_default_deck = true
var deck: Dictionary = {
	"size": 40,
	"unit": 15,
	"buff": 10,
	"defense": 7,
	"support": 8
}
var stronghold_hp: int = 5

# Define the waves structure
var waves = [
	{ "NORMAL": 3, "FAST": 0, "TANK": 0 },
	{ "NORMAL": 5, "FAST": 0, "TANK": 0 },
	{ "NORMAL": 5, "FAST": 2, "TANK": 0 },
	{ "NORMAL": 6, "FAST": 3, "TANK": 0 },
	{ "NORMAL": 5, "FAST": 3, "TANK": 1 },
	{ "NORMAL": 7, "FAST": 4, "TANK": 1 },
	{ "NORMAL": 6, "FAST": 4, "TANK": 2 },
	{ "NORMAL": 8, "FAST": 5, "TANK": 2 },
	{ "NORMAL": 8, "FAST": 6, "TANK": 3 },
	{ "NORMAL": 10, "FAST": 6, "TANK": 4 }
]

func create_deck() -> void:
	active_deck.clear()
	
	for n in deck.units:
		var units = CardDictionary.units;
		var size = units.size()
		var random_key = units.keys()[randi() % size]
		var card = {
			"name": units[random_key].name,
			"type": "unit"
		}
		active_deck.push_back(card)
	for n in deck.buff:
		var buff = CardDictionary.buff;
		var size = buff.size()
		var random_key = buff.keys()[randi() % size]
		var card = {
			"name": buff[random_key].name,
			"type": "unit"
		}
		active_deck.push_back(card)
	for n in deck.defense:
		var defense = CardDictionary.defense;
		var size = defense.size()
		var random_key = defense.keys()[randi() % size]
		var card = {
			"name": defense[random_key].name,
			"type": "unit"
		}
		active_deck.push_back(card)
	for n in deck.support:
		var support = CardDictionary.support;
		var size = support.size()
		var random_key = support.keys()[randi() % size]
		var card = {
			"name": support[random_key].name,
			"type": "unit"
		}
		active_deck.push_back(card)
		
func draw_card(i) -> void:
	var new_card = Card.instantiate()
	new_card.name = "Card_0" + str(i)
	new_card.title = active_deck[i]["name"]
	new_card.description = CardDictionary[active_deck[i].type][active_deck[i].name].description
	new_card.type = active_deck[i]["type"]
	# Add card to hand
	active_hand.append(new_card)
	active_deck.remove_at(i)
	# Add scene
	get_tree().root.add_child.call_deferred(new_card, true)
	
func draw_hand() -> void:
	for card in hand_size: 
		draw_card(card)
	
		
func fill_hand() -> void:
	var i = 0;
	while i <= active_hand.size():
		draw_card(i)
		i += 1
		
func lookup_card(card):
	var cardName = card.name
	var cardType = card.type
	
	if cardName in CardDictionary[cardType]:
		return CardDictionary[cardType][cardName]
	else:
		return null

func _ready():
	if not use_default_deck:
		create_deck()
		
	active_deck.shuffle()
	draw_hand()
	await AnimationController.move_cards("deck", 0, true)
	await AnimationController.move_cards("bottom", 0.25, false)
	
	
