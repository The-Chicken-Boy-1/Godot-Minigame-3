extends RigidBody2D

@onready var _sprite = get_node("Sprite2D")

var _bounces = 0

func _ready() -> void:
	set_contact_monitor(true)
	set_max_contacts_reported(2)
	
	_playground()
 	
	_sprite.modulate = Color(0.0, 0.0, 1.0)
	
func _process(_delta: float) -> void:
	var x = global_transform.origin.x
	var y = global_transform.origin.y
	
	# minigame step 7
	if x > 0 && y > 0:
		%Tilemaps._highlightLowerRight()
	elif x < 0 and y > 0:
		%Tilemaps._highlightLowerLeft()
	elif x > 0 and y < 0:
		%Tilemaps._highlightUpperRight()
	elif x < 0 and y < 0:
		%Tilemaps._highlightUpperLeft()
	
	

func _on_body_entered(_body: Node) -> void:
	# minigame step 2
	_bounces += 1
	%UI._update_Bounces(_bounces)
	
	# minigame step 4 (uncomment)
	var c = _create_Color(_bounces)
	_sprite.modulate = c
	
	# minigame step 6 (uncomment)
	%UI._update_Color(c.r, c.g, c.b)
		
func _create_Color(bounces: int) -> Color:
	var r = 0.0
	var g = 0.0
	var b = 0.0
	
	# minigame step 3
	# write your if statments below this comment
	if bounces < 10:
		r = 1.0
		g = 0.0
		b = 0.0  # red
	elif bounces < 20:
		r = 0.0
		g = 1.0
		b = 0.0  # green
	elif bounces < 30:
		r = 0.0
		g = 0.0
		b = 1.0  # blue
	elif bounces < 40:
		r = 1.0
		g = 1.0
		b = 0.0  # yellow
	elif bounces < 50:
		r = 1.0
		g = 0.0
		b = 1.0  # purple
	else:
		r = 0.0
		g = 1.0
		b = 1.0  # cyan
		
	return Color(r, g, b)
	
# playground 5
func _add(a: int, b: int) -> int:
	var sum = a + b
	print("calling _add function")
	return sum
	
func _playground() -> void:
	# playground 1
	var message = "Hello world!"
	print(message)
	
	# playground 2 
	var seconds = 12.5
	message = "seconds = %f" % seconds
	print(message)
	
	# playground 3
	message = "seconds = %.1f" % seconds
	print(message)
	
	# playground 4 
	var x = 1.0
	var y = 3.4
	var z = 20.5
	message = "position = (%.if, %.if, %.if)" % [x,y,z]
	
	# playground 6 
	var v1 = 4
	var v2 = 3
	var sum_1_2 = _add(v1,v2)
	print("sum: %s" % sum_1_2)
	
	# playground 7 
	sum_1_2 = _add(10,2)
	print("second sum: %s" % sum_1_2)
	
	# playground 9
	_print_name("Logan")
	
	# playground 10
	var foo = true
	print(foo)
	
	# playground 12
	x = -1.0
	y = 19.1
	var xLarger = _checkIfXIsLarger(x,y)
	print("is x larger? %s" % xLarger)
	
	# playground 13
	x = 2
	y = 3
	var comparison = x >= y
	print("comparison result: %s" % comparison)
	
	# playground 14
	x = 4
	y = 3 
	var w = 10
	var u = 0
	comparison = x > y && w < u
	print("comparison result 2: %s" % comparison)
	
	# playground 15
	x = 6
	if x < 5:
		print("x is x-small")
	elif x < 6:
		print("x is small")
	elif x < 8:
		print("x is medium")
	elif x < 9:
		print("x is large")
	else:
		print("x is x-large")



# playground 8
func _print_name(n) -> void:
	print("your name is: %s" % n)


# playground 11
func _checkIfXIsLarger(x: float, y: float) -> bool:
	return x > y 
