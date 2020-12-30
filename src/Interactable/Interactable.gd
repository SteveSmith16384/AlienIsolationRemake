class_name Interactable
extends Node


func get_interaction_text():
	return "Interact"

func interact():
	print("Interacted with %s" % name)
