extends CharacterBody3D

var health = 100

@onready var nav_agent = $NavigationAgent3D
@onready var hitbox = $Area3D
var time = 0
var SPEED=1.5

func _ready():
	pass

func _process(delta):
	if health <= 0:
		queue_free()

func _physics_process(delta):
	time+=1
	var current_location= global_transform.origin
	var next_location= nav_agent.get_next_path_position()
	var new_velocity = (next_location-current_location).normalized()*SPEED
	
	if (time % 30 == 0):
		for body in hitbox.get_overlapping_bodies():
			if !(body.is_in_group("Player")):
				velocity=new_velocity
	move_and_slide()
	

func update_target_location(target_location):
	nav_agent.set_target_position(target_location)
	

		
