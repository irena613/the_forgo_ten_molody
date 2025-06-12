extends "res://level_base.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_number = 1
	super._ready()
	print_debug($Notes.get_children())
	
	# Set note numbers for level 1 (notes 1-13)
	var note_number = 1
	for note in $Notes.get_children():
		note.note_number = note_number
		note.note_collected.connect(_on_note_collected)
		note_number += 1

func _on_portal_body_entered(body: Node2D) -> void:
	if body == $Whalien:# and Global.notes_collected == 13:
		Global.notes_collected = 0
		Global.unlockedLevels += 1
		Global.save_game()
		var anim_sprite = $Portal/AnimatedSprite2D
		anim_sprite.play("open")
		await anim_sprite.animation_finished
		get_tree().change_scene_to_file("res://level_screen.tscn")
	else:
		Global.unlockedLevels = 0
		
		
func _on_note_collected():
	$CanvasLayer/NotesLable.text = "Notes: " + str(Global.notes_collected)  + "/13"
	print_debug("Notes: " + str(Global.notes_collected))

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


#func _on_border_body_entered(body: Node2D) -> void:
	#if body == $Whalien:
		#Global.notes_collected = 0
		#get_tree().change_scene_to_file("res://menu/main_menu.tscn")
