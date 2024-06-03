extends Node2D

enum ZombieType { NORMAL, FAST, TANK }

var zombie_stats = {
	ZombieType.NORMAL: { "health": 3, "attackDamage": 2, "movementSpeed": 2 },
	ZombieType.FAST: { "health": 2, "attackDamage": 1, "movementSpeed": 3 },
	ZombieType.TANK: { "health": 8, "attackDamage": 3, "movementSpeed": 1 }
}

var stats
var navigation_path = []
var target_position = Vector2i()
var active_turn = 0  # Set this to 1 to make the zombie move
var current_grid_position: Vector2i
# Timer for movement
#onready var movement_timer = $MovementTimer

func _ready():
	var spawn = LevelController.astargrid.get_point_position(current_grid_position)
	self.position = Vector2i(spawn.x, spawn.y)
	GameController.connect("active_turn_change", Callable(self, "_on_active_turn_change"))
	#movement_timer.connect("timeout", self, "_on_MovementTimer_timeout")

func get_threat_positions() -> Array[Vector2i]:
	return []  # Example threat positions
	
func get_nearest_threat() -> Vector2i:
	var threats: Array[Vector2i] = get_threat_positions()
	var cur_pos: Vector2 = current_grid_position
	threats.append_array(LevelController.stronghold_positions)
	var nearest_position = threats[0]
	var nearest_distance = cur_pos.distance_to(nearest_position)
	
	for threat in threats:
		var distance = cur_pos.distance_to(threat)
		if distance < nearest_distance:
			nearest_position = threat
			nearest_distance = distance
	return nearest_position
	
func move():
	var threat = get_nearest_threat()
	var path_taken = LevelController.navigate_to(current_grid_position, threat)
	path_taken = path_taken.slice(0, stats.movementSpeed + 1 if path_taken.size() >= stats.movementSpeed else path_taken.size() + 1)
	for cell in path_taken:
		var target = LevelController.astargrid.get_point_position(cell)
		#if path_taken.find(cell,0) != path_taken.size() - 1:
		self.position = target
		current_grid_position = cell
		await get_tree().create_timer(.2).timeout

func _on_active_turn_change():
	move()
#func _on_MovementTimer_timeout():
	#if active_turn == 1 and navigation_path.size() > 0:
		#var next_position = get_parent().astar_grid.map_to_world(navigation_path.pop_front())
		#position = next_position
		#if navigation_path.size() == 0:
			#movement_timer.stop()
			#active_turn = 0
			#get_parent().on_zombie_finished(self)
		#else:
			#movement_timer.start(0.5)

## Called when a zombie finishes its movement
#func on_zombie_finished(zombie):
	#zombie_queue.pop_front()
	#if zombie_queue.size() > 0:
		#zombie_queue[0].start_movement()
