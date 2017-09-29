extends "res://scripts/classes/moves/naves.gd"

var movimento = Vector2()
var pos
var shooting = false

func _init():
	maxHealth = 5
	
func _ready():
	speed = 2
	alinhamento = 0
	set_process_input(true)
	autoMoves = false
	shootAuto = false
	shootCD = 0.5

func _input(event):
	shooting = Input.is_action_pressed("ui_accept")
	movimento = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		movimento += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		movimento += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		movimento += Vector2( 1, 0 )
	if Input.is_action_pressed("ui_left"):
		movimento += Vector2( -1, 0 )

func _process(delta):
	if shooting:
		shoot()

func _fixed_process(delta):
	#movendo
	pos = get_pos()
	pos += movimento * speed
	#mantendo dentro da tela
	var screen_size = Vector2(Globals.get("display/width"),Globals.get("display/height"))
	var margin = 9
	var a = margin
	var b = screen_size.x - margin
	var c = screen_size.y - margin
	
	if (pos.x < a):
		pos.x = a
	if (pos.x > b):
		pos.x = b
	if (pos.y < a):
		pos.y = a
	if (pos.y > c):
		pos.y = c
	
	
	set_pos(pos)