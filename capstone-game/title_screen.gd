extends Control


	
	
	


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main scene.tscn")
	pass # Replace with function body.


func _on_rule_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/rule_page.tscn")
	pass # Replace with function body.
