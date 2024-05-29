extends Node

var Level = preload("res://scenes/Level.tscn").instantiate()

var main_layer: int = 0
var main_source: int = 0
var path_taken_atlas_coords  = Vector2i(22, 4)
var stronghold_positions: Array[Vector2i] =[]
var tilemap_size: Vector2i
var astargrid: AStarGrid2D = AStarGrid2D.new()

func load_level():
	Level.position = Vector2(14,14)
	get_tree().root.add_child.call_deferred(Level, true)
	setup_grid()
	show_path()
	
func setup_grid():
	tilemap_size = Level.get_used_rect().size
	print("Map Size: ", tilemap_size)
	astargrid.region = Rect2i(0, 0, tilemap_size.x + 1, tilemap_size.y + 1)
	astargrid.cell_size = Vector2i(GameController.CELL_SIZE,GameController.CELL_SIZE)
	astargrid.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astargrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astargrid.update()
	for cell: Vector2i in Level.get_used_cells(main_layer):
		if is_cell_solid(cell): astargrid.set_point_solid(cell)
		if is_cell_stronghold(cell):
			stronghold_positions.append(cell)

func is_cell_solid(cell: Vector2i):
	var is_solid = Level.get_cell_tile_data(main_layer, cell).get_custom_data("is_solid")
	return is_solid

func is_cell_stronghold(cell: Vector2i) -> bool:
	return Level.get_cell_tile_data(main_layer, cell).get_custom_data("is_stronghold")

func navigate_to(a: Vector2i, b: Vector2i):
	var path: Array[Vector2i] = astargrid.get_id_path(a, b)
	return astargrid.get_id_path(a, b)
	
func show_path():
	var path_taken = astargrid.get_id_path(Vector2i(0,0), stronghold_positions[0])
	print("path", path_taken)
	for cell in path_taken:
		Level.set_cell(main_layer, cell, main_source, path_taken_atlas_coords)
		await get_tree().create_timer(.2).timeout
