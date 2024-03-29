extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.interpolate_property(
		self, 
		'scale',
		get_scale(), 
		Vector2(1.1, 1.1), 
		0.1,
		Tween.TRANS_QUAD, 
		Tween.EASE_OUT
	)
	
	$Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
