extends Node2D

@export var K: float = 10000000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	var charged_stuff = get_tree().get_nodes_in_group("charged")
	for i in range(charged_stuff.size()):
		var item1:RigidBody2D = charged_stuff[i]
		if item1 is not ChargedParticle:
			continue
		for j in range(charged_stuff.size()):
			if i == j: continue
			var item2:RigidBody2D = charged_stuff[j]
			if item2 is not ChargedParticle:
				continue
			
			var pos1 = item1.global_position
			var pos2 = item2.global_position
			var diff = pos1 - pos2
			
			var length = diff.length()
			var force_mag = K * item1.charge * item2.charge / (length ** 3);
			var force = diff / length * force_mag;
			item1.apply_central_force(force);
			
			
	
