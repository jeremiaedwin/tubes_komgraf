extends Spatial

var player_infront = false
var door_state = false

	
func _input(event):
	if Input.is_action_just_pressed("klik_kiri"):
		print(door_state);
		if player_infront and $AnimationPlayer.is_playing() == false:
			door_state = !door_state
			print(door_state)
			if door_state == true:
				$AnimationPlayer.play("door2")
				get_node("hinge/MeshInstance/StaticBody/CollisionShape").disabled = true
			else:
				$AnimationPlayer.play_backwards("door2")
				get_node("hinge/MeshInstance/StaticBody/CollisionShape").disabled = false

func set_player_infront(player_infront):
	self.player_infront = player_infront
