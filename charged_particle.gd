extends RigidBody2D
class_name ChargedParticle

@export var charge:float = 1.0

var sprite
var parent

func get_all_nodes(parent_node: Node, accumulated_array: Array[Node] = []) -> Array[Node]:
	accumulated_array.append(parent_node)
	for child in parent_node.get_children():
		get_all_nodes(child, accumulated_array)
	return accumulated_array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $Sprite2D
	parent = get_parent()

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if charge > 0:
		sprite.modulate = Color.RED
	elif charge < 0:
		sprite.modulate = Color.BLUE
	else:
		sprite.modulate = Color.BISQUE
