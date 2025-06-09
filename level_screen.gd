extends Control

@onready var worlds: Array = [$CanvasGroup/LevelIcon1, $CanvasGroup/LevelIcon2, $CanvasGroup/LevelIcon3, $CanvasGroup/LevelIcon4, $CanvasGroup/LevelIcon5, $CanvasGroup/LevelIcon6, $CanvasGroup/LevelIcon7]
var current_world: int = 0
var move_tween: Tween

@onready var whalien = $CanvasGroup/Whalien
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween_icon() # Replace with function body.
#		$CanvasGroup/PlayerIcon.position=worlds[current_world].global_position
	

func _input(event):
	if move_tween and move_tween.is_running():
		return
	if event.is_action_pressed("ui_left") and current_world > 0:
		current_world -= 1
		tween_icon()
	if event.is_action_pressed("ui_right") and current_world < worlds.size()-1:
		current_world += 1
		tween_icon()

func tween_icon():
	move_tween = get_tree().create_tween()
	move_tween.tween_property($CanvasGroup/PlayerIcon, "global_position", worlds[current_world].global_position + Vector2(0, -50), 0.5).set_trans(Tween.TRANS_SINE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
