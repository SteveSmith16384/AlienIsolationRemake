extends KinematicBody

export var speed = 100
var space_state
var target
var rnd = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	space_state = get_world().direct_space_state

	var anim : AnimationPlayer = get_node("walk/AnimationPlayer")
	anim.current_animation = "Take 001"

	var main = get_tree().get_root().get_node("World")
	target = main.get_node("Player")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var anim : AnimationPlayer = get_node("walk/AnimationPlayer")
	anim.play()

	if target:
		var result : Dictionary = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.size() > 0:
			if result.collider.is_in_group("Player"):
				look_at(target.global_transform.origin, Vector3.UP)
				move_to_target(delta)
	pass

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)


func _on_Timer_timeout():
	$Timer.wait_time = rnd.randi_range(10, 15)
	
	var id = rnd.randi_range(1, 24)
	var sfx = load("res://Assets/sfx/zombies/zombie-" + str(id) + ".wav")
	$AudioStreamPlayer3D.stream = sfx
	$AudioStreamPlayer3D.play()
	pass # Replace with function body.
