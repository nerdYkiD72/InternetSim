extends Popup

func _ready():
	pass

func _on_Player_Sprite_clicked(player_id, history_message):
	get_node("History").text = history_message
	popup_centered_ratio(0.35)
