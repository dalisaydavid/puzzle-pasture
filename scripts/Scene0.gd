extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	set_process(true)
	
	$Timer.connect('timeout', $Grid, 'move_tile_down')

func _input(event):
	if event.is_action_pressed('ui_left'):
		$Grid.move_tile_left(1)
		
#	if event.is_action_pressed('choose'):
#		var mouse_pos = get_global_mouse_position()
#		if $Grid.get_cellv(
#		$Grid.set_cellv($Grid.world_to_map(mouse_pos), 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


