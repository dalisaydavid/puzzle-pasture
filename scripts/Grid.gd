extends Node2D

export var current_tile_location = Vector2(0,0)
export var start_position = Vector2(0,0)
export var max_position = Vector2(15,15)

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_tile_location()
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset_tile_location():
	current_tile_location = start_position

func move_tile_down():
	current_tile_location.y += 1

func move_tile_left(amount):
#	$TileMap.set_cellv(Vector2(current_tile_location.x+1, current_tile_location.y), 0)
	current_tile_location.x -= 1
#	$TileMap.set_cellv(current_tile_location, 1)

func update():
	# Blank out last tile (tile right above).
	$TileMap.set_cellv(Vector2(current_tile_location.x, current_tile_location.y-1), 0)
	
	# Draw the current tile.
	$TileMap.set_cellv(current_tile_location, 1)
#	$Sprite.global_position = Vector2($TileMap.map_to_world(current_tile_location).x+32, $TileMap.map_to_world(current_tile_location).y+32)
	
	# Move the current tile down 1 if it can, else reset and start a new tile.
	if can_move_tile_down(Vector2(current_tile_location.x, current_tile_location.y+1)):
		move_tile_down()
	else:
		reset_tile_location()


func can_move_tile_down(v):
	return v.y <= max_position.y and not is_tile_occupied(v)

func is_tile_occupied(v):
	return $TileMap.get_cellv(v) != 0
