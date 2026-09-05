extends RigidBody2D

var parent
var node2d
const G = 3000000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	node2d = get_parent()
	parent = node2d.get_parent()

func grav_force_mag(m1, m2, d):
	return G * m1 * m2 / (d**2)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	for child in parent.get_children():
		for child_child in child.get_children():
			if child_child is RigidBody2D:
				var own_pos = state.transform.origin
				var other_pos = child_child.global_position
				var diff = other_pos - own_pos
				var mag = diff.length()
				if mag == 0:
					continue
				
				
				var other_mass = child_child.mass
				var grav_force = grav_force_mag(mass, other_mass, mag) * diff / mag
				state.apply_central_force(grav_force)
	
