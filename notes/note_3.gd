extends "res://notes/note_base.gd"

# The base script handles all the functionality
# We can add note-specific behavior here if needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Whalien":
		Global.notes_collected += 1
		print_debug("note type 3 collected")
		queue_free()
	
