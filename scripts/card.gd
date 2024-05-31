extends Node2D

var title: String = ""
var description: String = ""
var type: String = ""
var prev_loc: Vector2 = self.global_position
var prev_scale: Vector2 = self.scale
var prev_rot: float = self.rotation
var flipped: bool = true
var can_hover: bool = true
var is_hovering: bool = false
var selected: bool = false
var target_position: Vector2 = self.position
var params = PhysicsPointQueryParameters2D.new()

@onready var title_node: Label = $CardFront/Title
@onready var description_node: Label = $CardFront/Description
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true
	title_node.text = title
	description_node.text = description
	pass # Replace with function body.

func _on_mouse_entered():
	is_hovering = true
	if !selected and can_hover:
		can_hover = false
		prev_loc = self.global_position
		prev_scale = self.scale
		AnimationController.card_hover("enter", self)
		pass # Replace with function body.

func _on_mouse_exited():
	is_hovering = false
	if !selected and !can_hover:
		AnimationController.card_hover("exit", self)
		#pass # Replace with function body.

func _on_input_event(_event):
	if Input.is_action_pressed("click") and is_hovering:
		can_hover = false
		if !selected:
			selected = true
			AnimationController.card_select(self)
		else:
			selected = false
			AnimationController.card_deselect(self)
	pass # Replace with function body.
