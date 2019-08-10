extends Node

var bitmap
export var current_tile = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	bitmap = []
	
func new(width, height):
	var new_bitmap = []
	for x in range(width):
		new_bitmap.append([])
		for y in range(height):
			new_bitmap[x].append(0)
			
	self.bitmap = new_bitmap

func move_down(tile, amount):
	self.bitmap[tile.x][tile.y] = 0
	self.bitmap[tile.x][tile.y+amount] = 1  
	current_tile = Vector2(tile.x, tile.y+amount)

func update():
	move_down(current_tile, 1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
