extends Area2D

signal note_collected

var float_height: float = 10.0  # How high the note floats
var float_speed: float = 2.0    # How fast the note floats
var start_position: Vector2     # Store the initial position
var note_number: int = 1        # Which note this is (1-91)

func _ready() -> void:
	start_position = position

func _process(delta: float) -> void:
	# Create a floating motion using sine wave
	var new_y = start_position.y + sin(Time.get_ticks_msec() * 0.001 * float_speed) * float_height
	position.y = new_y

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Whalien":
		Global.notes_collected += 1
		note_collected.emit()
		# Play the note's sound
		if AudioManager:
			AudioManager.play_note(note_number)
		print_debug("note collected: ", note_number)
		queue_free() 
