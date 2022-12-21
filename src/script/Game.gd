extends Spatial

onready var door = $door_1
onready var door2 = $door_2
onready var door3 = $door_3
onready var door4 = $door4
onready var door5 = $door_5
onready var door6 = $door_6
onready var door7 = $door_7
var key = 1
var player_infront = false

func _ready():
	pass

func _on_area_door_1_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door.set_player_infront(player_infront)


func _on_area_door_1_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door.set_player_infront(player_infront)


func _on_area_door_2_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door2.set_player_infront(player_infront)


func _on_area_door_2_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door2.set_player_infront(player_infront)


func _on_area_door_3_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door3.set_player_infront(player_infront)


func _on_area_door_3_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door3.set_player_infront(player_infront)


func _on_area_door_4_body_entered(body):
	if body.name == "Player":
		player_infront = true
		print('test')
		door4.set_player_infront(player_infront)


func _on_area_door_4_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door4.set_player_infront(player_infront)


func _on_area_door_5_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door5.set_player_infront(player_infront)


func _on_area_door_5_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door5.set_player_infront(player_infront)


func _on_area_door_6_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door6.set_player_infront(player_infront)


func _on_area_door_6_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door6.set_player_infront(player_infront)


func _on_Area_body_entered(body):
	if body.name == "Player":
		player_infront = true
		door7.set_player_infront(player_infront)


func _on_Area_body_exited(body):
	if body.name == "Player":
		player_infront = false
		door7.set_player_infront(player_infront)
