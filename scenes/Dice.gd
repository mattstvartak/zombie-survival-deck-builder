extends Node2D

var dice: Dictionary = {
	"atk": Vector2i(529,129),
	"def": Vector2i(625,65),
	"sup": Vector2i(673,161)
}
const DIE_SIDES = ["sup", "atk", "def", "sup", "atk", "def"]

var active: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func roll() -> void:
	var rng = RandomNumberGenerator.new()
	
	for i in range(0,5):
		var val = rng.randi_range(0,5)
		add_die(i, val)
		
func add_die(count: int, val: int):
	var die = self.get_node("Dice_0" + str(count + 1))
	die.region_rect = Rect2(dice[DIE_SIDES[val]].x, dice[DIE_SIDES[val]].y, 14, 14)
	die.visible = true
	active.push_back(DIE_SIDES[val])
	#match val:
		#"atk":
				#
		#"def":
			#
		#"sup":
