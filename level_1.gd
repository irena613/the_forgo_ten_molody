extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug($Notes.get_children())
	for note in $Notes.get_children():
		note.note_collected.connect(_on_note_collected) # Replace with function body.
		


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_portal_body_entered(body: Node2D) -> void:
	if body == $Whalien and Global.notes_collected == 13:
		Global.notes_collected = 0
		var anim_sprite = $Portal/AnimatedSprite2D
		anim_sprite.play("open")
		await anim_sprite.animation_finished
		get_tree().change_scene_to_file("res://level_2.tscn")
		
func _on_note_collected():
	$CanvasLayer/NotesLable.text = "Notes: " + str(Global.notes_collected)
	print_debug("Notes: " + str(Global.notes_collected))



#not perfect but it is what it is
#TODO fix thi so that it's a reausable function like with note instead of this
func _on_border_3_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		Global.notes_collected = 0
		get_tree().change_scene_to_file("res://menu/main_menu.tscn")


func _on_border_4_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		Global.notes_collected = 0
		get_tree().change_scene_to_file("res://menu/main_menu.tscn")


func _on_border_2_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		Global.notes_collected = 0
		get_tree().change_scene_to_file("res://menu/main_menu.tscn")


#func _on_border_body_entered(body: Node2D) -> void:
	#if body == $Whalien:
		#Global.notes_collected = 0
		#get_tree().change_scene_to_file("res://menu/main_menu.tscn")
