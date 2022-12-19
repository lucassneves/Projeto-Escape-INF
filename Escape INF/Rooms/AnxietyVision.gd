extends CanvasModulate

onready var animation = $AnimationPlayer

func _ready():
	var _a = ProgressManager.connect("anxiety_attack", self, "_play_animation")

func _play_animation():
	animation.play("Fade")
	
func reset_anxiety():
	yield(get_tree().create_timer(3),"timeout")
	ProgressManager.anxiety = 0
	color = Color(1,1,1)
