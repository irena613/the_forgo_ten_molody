extends Node2D

var level_number: int = 1  # Override this in each level

func _ready() -> void:
	# Connect note collection signals
	if has_node("Notes"):
		for note in $Notes.get_children():
			note.note_collected.connect(_on_note_collected)
	
	# Update notes display
	update_notes_display()

func update_notes_display():
	if has_node("CanvasLayer/NotesLable"):
		$CanvasLayer/NotesLable.text = "Notes: " + str(Global.notes_collected) + "/13"

func _on_note_collected():
	Global.notes_collected += 1
	update_notes_display()
	print("Notes collected: ", Global.notes_collected)

func complete_level():
	print("Completing level ", level_number)
	# Update highest level reached if this level is higher
	Global.unlockedLevels = max(Global.unlockedLevels, level_number)
	Global.save_game()
	
	var anim_sprite = $Portal/AnimatedSprite2D
	if anim_sprite:
		anim_sprite.play("open")
		await anim_sprite.animation_finished
	get_tree().change_scene_to_file("res://level_screen.tscn")

func return_to_level_screen():
	print("Returning to level screen from level ", level_number)
	# Just return to level screen without changing any progress
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")

func _on_portal_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		complete_level()

func _on_border_body_entered(body: Node2D) -> void:
	if body == $Whalien:
		return_to_level_screen() 
