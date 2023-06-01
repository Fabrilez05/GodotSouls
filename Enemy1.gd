extends CharacterBody3D

var path =[]
var path_node=0

var speed=10

func _ready():
	var nav=get_parent()
	var player=$"../../Player"

func _physics_process(delta):
	if  path_node<path.size():
		var direction= (path[path_node]-global_transform.origin)
		if direction.lenght()<1:
			path_node +=1
		else:
			move_and_slide(direction.normalized()*speed, Vector3.UP)
		
