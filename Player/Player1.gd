extends Area2D

var message_history = []
export (int) var player_id = 1

onready var parent = get_parent()
onready var recipient = parent.get_node("Main/Recipient")
onready var sender = parent.get_node("Main/Sender")


func _ready():
	pass 





func _on_Send_pressed():
	if (recipient.get_selected_id() + 1 == player_id):
		get_node("Msg").text = parent.get_node("Main/Message").text
		message_history.append(get_node("Msg").text)
	else:
		get_node("Msg").text = ""
