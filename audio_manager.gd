extends Node

# Dictionary to store audio players for each note
var note_players = {}

func _ready():
	# Create audio players for all 91 notes
	for i in range(1, 92):
		var player = AudioStreamPlayer.new()
		add_child(player)
		note_players[i] = player
		
		# Load the audio stream
		var audio_path = "res://Assets/Audio/part_%03d.wav" % i
		var audio_stream = load(audio_path)
		if audio_stream:
			player.stream = audio_stream
		else:
			print("Failed to load audio file: ", audio_path)

func play_note(note_number: int):
	if note_number in note_players:
		var player = note_players[note_number]
		if player.stream:
			player.play()
		else:
			print("No audio stream loaded for note ", note_number)
	else:
		print("Invalid note number: ", note_number)

func load_note_sound(note_number: int, audio_stream: AudioStream) -> void:
	if note_number in note_players:
		note_players[note_number].stream = audio_stream 
