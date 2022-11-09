extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = get_parent()
	add_point(parent.get_node("Player3").position)
	add_point(parent.get_node("Player4").position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
