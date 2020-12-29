extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var anim : AnimationPlayer = get_node("walk/AnimationPlayer")
	anim.current_animation = "Take 001"
	#anim.lo
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var anim : AnimationPlayer = get_node("walk/AnimationPlayer")
	anim.play()
	pass
