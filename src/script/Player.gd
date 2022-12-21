# File : Player.gd
# Writter : Jeremia Edwin H
# References : https://docs.godotengine.org/en/3.2/tutorials/3d/fps_tutorial/part_one.html#making-the-fps-movement-logic
# Created At : 12/20/2022
# Updated At : 12/20/2022

extends KinematicBody

const GRAVITASI = -24.8
var vel = Vector3()
const MAX_SPEED = 10
const JUMP_SPEED = 18
const ACCEL = 1.5

var dir = Vector3()

const DEACCEL = 10
const MAX_SLOPE_ANGLE = 30

var camera
var rotation_helper

var MOUSE_SENSITIVITY = 0.02

func _ready():
	camera = $CameraPivot/Camera
	rotation_helper = $CameraPivot
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(delta):
	# Berjalan
	dir = Vector3()
	var cam_xform = camera.get_global_transform()
	
	var input_movement_vector = Vector2()
	
	if Input.is_action_pressed("maju"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("mundur"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("kiri"):
		input_movement_vector.x -= 1
	if Input.is_action_pressed("kanan"):
		input_movement_vector.x += 1
		
	input_movement_vector = input_movement_vector.normalized()
	
	# Setelah dinormalisasi vektornya 
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	
	
	# Menangkap atau melepas kursor
	if Input.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()
	
	
	var hvel = vel
	hvel.y = 0
	
	var target = dir
	target *= MAX_SPEED
	
	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL
	
	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0,1,0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))
	
func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
		
		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot
