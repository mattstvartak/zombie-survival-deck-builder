extends Node

const CELL_SIZE = 14

var Card = preload("res://scenes/Card.tscn")
var Zombie = preload("res://scenes/Zombie.tscn")
var active_deck: Array = CardDictionary.default_deck
var active_hand: Array = []
var turn_count: int = 0
var active_turn: bool = true # 0 Player, 1 AI
var hand_size: int = 7
var use_default_deck = true
var zombie_queue = []
var deck: Dictionary = {
	"size": 40,
	"unit": 15,
	"buff": 10,
	"defense": 7,
	"support": 8
}
var stronghold_hp: int = 40	

# Define the waves structure
var active_wave: int = 0
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

@onready var EndTurnButton = get_tree().root.get_node("Main/EndTurnButton")

signal turn_change
signal active_turn_change

func _ready():
	await LevelController.load_level()
	setup_deck()
	connect("turn_change", Callable(self, "_on_turn_change"))
	connect("active_turn_change", Callable(self, "_on_active_turn_change"))
	EndTurnButton.pressed.connect(self._on_end_turn_pressed)
	spawn_zombies()
	print(zombie_queue)

func setup_deck():
	if not use_default_deck:
		create_deck()
		
	active_deck.shuffle()
	draw_hand()
	await AnimationController.move_cards("deck", 0, true)
	await AnimationController.move_cards("bottom", 0.25, false)

# Create a new initial deck. Overwrites the default deck.
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

# Draws a single card and adds it to the player's hand	
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

# Draws a full hand
func draw_hand() -> void:
	for card in hand_size: 
		draw_card(card)
	
# Fills a partially full hand
func fill_hand() -> void:
	var i = 0;
	while i <= active_hand.size():
		draw_card(i)
		i += 1
		
# Gets the stats for a specific card
func lookup_card(card):
	var cardName = card.name
	var cardType = card.type
	
	if cardName in CardDictionary[cardType]:
		return CardDictionary[cardType][cardName]
	else:
		return null

# Ends the player turn
func end_turn() -> void:
	active_turn = 1
		
# Spawn a zombie on the outer edge and make it navigate
func spawn_zombie(i: int, type: String) -> void:
	var new_zombie = Zombie.instantiate()
	new_zombie.name = "Zombie_0" + str(i)
	new_zombie.stats = new_zombie.zombie_stats[new_zombie.ZombieType.get(type)]
	new_zombie.current_grid_position = get_random_edge_position()
	ZombieContainer.add_child(new_zombie)
	zombie_queue.append(new_zombie)
	#if zombie_queue.size() == 1:
		#zombie.start_movement()

# Get a random position on the outer edge of the grid
func get_random_edge_position():
	var edge_positions = []
	for x in range(LevelController.tilemap_size.x - 1):
		edge_positions.append(Vector2i(x, 0))
		edge_positions.append(Vector2i(x, LevelController.tilemap_size.y - 1))
	for y in range(LevelController.tilemap_size.y - 1):
		edge_positions.append(Vector2i(0, y))
		edge_positions.append(Vector2i(LevelController.tilemap_size.x - 1, y))
	return edge_positions[randi() % edge_positions.size()]

func spawn_zombies():
	for zombie_type in waves[active_wave]:
		for zombie in waves[active_wave][zombie_type]:
			for i in range(zombie):
				spawn_zombie(i, zombie_type)

func _on_end_turn_pressed():
	emit_signal("active_turn_change")	
	
func _on_active_turn_change():
	active_turn = !active_turn		
	turn_count+=1
