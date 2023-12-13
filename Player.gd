extends Area2D

@export var speed=400


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$"../BGmusic".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	position += velocity * delta
	
	if Input.is_action_pressed("Move_right"):
		velocity.x += 1
	if Input.is_action_pressed("Move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("Move_down"):
		velocity.y += 1
	if Input.is_action_pressed("Move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta


func _on_body_entered(body):
	hide()
	$"../EnemyHit".play()
	$"../BGmusic".stop()
