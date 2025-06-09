extends Area2D

signal note_collected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Whalien":
		Global.notes_collected += 1
		note_collected.emit()
		print_debug("note type 2 collected")
		queue_free()
	
