# Test comment
extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 15
const SPEED = 450
const JUMP_HEIGHT = -550

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else: 
		motion.x = 0
		$AnimatedSprite.play("stop")
		$AnimatedSprite.flip_h = false
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y < 0:
			$AnimatedSprite.play("Jump")
			
		else:
			$AnimatedSprite.play("fall")
			if motion.x < 0:
					$AnimatedSprite.flip_h = true
		
	motion = move_and_slide(motion, UP)
