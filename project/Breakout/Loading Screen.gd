extends Control

var score = 0 setget set_score
export var score_brick = 5
    
signal finished

var _time_accum = 0
var _scene_switcher_finished = false
var _signal_sent = false
var _user_wants_to_continue = false

func set_score(value):
    score = value
    get_node("Score").set_text("Score: " + str(score))
    
func brick_hit():
    self.score += score_brick

func _ready():
    set_process(true)
    set_process_input(true)

func _ready_to_switch():
    return _time_accum >= 3.0 and _scene_switcher_finished

func _process(delta):
    _time_accum += delta

    if _ready_to_switch() and get_node("Loading Complete Text").visible == false:
        get_node("Loading Complete Text").visible = true

    if _ready_to_switch() and _signal_sent == false and _user_wants_to_continue:
        emit_signal("finished")
        _signal_sent = true

func _input(ev):
    if ev is InputEventKey and ev.pressed == false and _ready_to_switch():
        _user_wants_to_continue = true

func on_loading_finished():
    _scene_switcher_finished = true