extends Node

var Level = preload("res://scenes/Level.tscn").instantiate()

var main_layer: int = 0
var main_source: int = 0
var path_taken_atlas_coords  = Vector2i(22, 4)
var stronghold_positions: Array[Vector2i] =[]
var tilemap_size: Vector2i
var astargrid: AStarGrid2D = AStarGrid2D.new()
var selected_grid_position
var occupied_spaces: Array = []

func load_level():
	Level.position = Vector2(14,14)
	get_tree().root.add_child.call_deferred(Level, true)
	setup_grid()
	#show_path()
	
func setup_grid():
	tilemap_size = Level.get_used_rect().size
	astargrid.region = Rect2i(0, 0, tilemap_size.x + 1, tilemap_size.y + 1)
	astargrid.cell_size = Vector2i(GameController.CELL_SIZE,GameController.CELL_SIZE)
	astargrid.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astargrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astargrid.update()
	for cell: Vector2i in Level.get_used_cells(main_layer):
		#if is_cell_solid(cell): astargrid.set_point_solid(cell, false)
		if is_cell_stronghold(cell):
			stronghold_positions.append(cell)

func is_cell_solid(cell: Vector2i):
	var is_solid = Level.get_cell_tile_data(main_layer, cell).get_custom_data("is_solid")
	return is_solid

func is_cell_stronghold(cell: Vector2i) -> bool:
	return Level.get_cell_tile_data(main_layer, cell).get_custom_data("is_stronghold")

func navigate_to(a: Vector2i, b: Vector2i, loc: Vector2i):
	astargrid.fill_solid_region(Rect2i(0,0,24,24), false)
	for i in occupied_spaces:
		#
		if i != loc: astargrid.set_point_solid(i, true)
	return astargrid.get_id_path(Vector2i(a.x,a.y), Vector2i(b.x,b.y))

#func _unhandled_input(event):
	#print(event)
	#if event is InputEventMouseMotion:
		#
func get_grid_position_from_mouse():
	var mouse_position = get_viewport().get_mouse_position()
	var grid_x = int(mouse_position.x / GameController.CELL_SIZE)
	var grid_y = int(mouse_position.y / GameController.CELL_SIZE)
	return Vector2i(grid_x, grid_y)

# Function to check if the mouse is hovering over a valid grid location
func is_mouse_hovering_over_grid():
	var grid_position = get_grid_position_from_mouse()
	if astargrid.is_in_boundsv(grid_position):
		return true
	return false

func _input(event):
	if event is InputEventMouseMotion and GameController.can_place_card() and is_mouse_hovering_over_grid() and self.selected_grid_position != get_grid_position_from_mouse():
		self.selected_grid_position = get_grid_position_from_mouse()
	elif !is_mouse_hovering_over_grid():
		selected_grid_position = null

	if Input.is_action_just_pressed("click") and GameController.can_place_card() and typeof(selected_grid_position) == TYPE_VECTOR2I:
		print(selected_grid_position)
		GameController.spawn_pawn(selected_grid_position)

