extends WindowDialog


func _ready():
	pass


func _on_Toggle_Logs_pressed():
	get_node("History").text = get_tree().root.get_child(0).call("get_message_history")
	popup_centered_ratio(0.5)
