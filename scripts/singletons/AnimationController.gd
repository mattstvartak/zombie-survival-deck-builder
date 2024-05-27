extends Node

func move_cards(location: String, speed: float, flip: bool = false) -> void:
	var active_hand = GameController.active_hand
	
	for i in active_hand.size():
		var card: Node2D = active_hand[i]
		var collider: ReferenceRect = card.get_node("Collider")
		var loc: Node2D = get_tree().root.get_node("window/loc_" + location + "/" + str(i))
		var tween = get_tree().create_tween()
		collider.mouse_filter = collider.MOUSE_FILTER_IGNORE
		card.get_node("CardBack").visible = false
		tween.parallel().tween_property(card, "position", Vector2(loc.global_position.x, loc.global_position.y), speed)
		tween.parallel().tween_property(card, "rotation", loc.rotation, speed)
		
		if flip:
			tween.parallel().tween_property(card, "scale", Vector2(loc.scale.x * -1,loc.scale.y), speed)
			card.get_node("CardBack").visible = true
		else:
			tween.parallel().tween_property(card, "scale", Vector2(loc.scale.x,loc.scale.y), speed)
		await tween.finished
		collider.mouse_filter = collider.MOUSE_FILTER_STOP
		
func card_hover(direction, card):
	var tween = get_tree().create_tween()
	
	match direction:
		"enter":
			tween.parallel().tween_property(card, "scale", Vector2(card.scale.x + card.scale.x * 0.25, card.scale.y + card.scale.y * 0.25), 0.1)
			tween.parallel().tween_property(card, "position", Vector2(card.position.x, card.position.y - 80), 0.1)
			await tween.finished
			card.can_hover = false
		"exit":
			tween.parallel().tween_property(card, "scale", Vector2(card.prev_scale.x, card.prev_scale.y), 0.1)
			tween.parallel().tween_property(card, "position", Vector2(card.prev_loc.x, card.prev_loc.y), 0.1)
			await tween.finished
			card.can_hover = true

func card_select(card):
	var tween = get_tree().create_tween()
	var loc: Node2D = get_tree().root.get_node("window/loc_selected/0")
	tween.parallel().tween_property(card, "scale", loc.scale, 0.1)
	tween.parallel().tween_property(card, "position", Vector2(loc.global_position.x,loc.global_position.y), 0.1)
	await tween.finished
	
func card_deselect(card):
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(card, "scale", card.prev_scale, 0.1)
	tween.parallel().tween_property(card, "position", card.prev_loc, 0.1)
	await tween.finished
