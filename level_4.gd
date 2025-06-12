extends "res://level_base.gd"

func _ready() -> void:
	level_number = 4
	super._ready()
	
	# Set note numbers for level 4 (notes 40-52)
	var note_number = 40
	for note in $Notes.get_children():
		note.note_number = note_number
		note.note_collected.connect(_on_note_collected)
		note_number += 1

# Override border handlers to use the base return_to_level_screen function
func _on_border_2_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		return_to_level_screen()

func _on_border_3_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		return_to_level_screen()

func _on_border_4_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		return_to_level_screen()

func _on_portal_body_entered(body: Node2D) -> void:
	if body == $Whalien:# and Global.notes_collected == 13:
		Global.notes_collected = 0
		Global.unlockedLevels += 4
		Global.save_game()
		var anim_sprite = $Portal/AnimatedSprite2D
		anim_sprite.play("open")
		await anim_sprite.animation_finished
		get_tree().change_scene_to_file("res://level_screen.tscn")
		complete_level()
	else:
		Global.unlockedLevels = 0
		
func _on_note_collected():
	$CanvasLayer/NotesLable.text = "Notes: " + str(Global.notes_collected) + "/13"
	print_debug("Notes: " + str(Global.notes_collected))



#not perfect but it is what it is
#TODO fix thi so that it's a reausable function like with note instead of this
func _on_border_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		Global.notes_collected = 0
		get_tree().change_scene_to_file("res://menu/main_menu.tscn")


#func _on_border_body_entered(body: Node2D) -> void:
	#if body == $Whalien:
		#Global.notes_collected = 0
		#get_tree().change_scene_to_file("res://menu/main_menu.tscn")
