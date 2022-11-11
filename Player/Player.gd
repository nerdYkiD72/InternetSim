extends Area2D

var message_history = []
export (int) var player_id = 1
export (NodePath) var parent

var recipient
var sender

signal sprite_clicked(player_id, messages)
signal log_message(player_id, history_message)



func _ready():
	parent = get_node(parent)
	recipient = parent.get_node("Main/Recipient")
	sender = parent.get_node("Main/Sender")
	
	get_node("Label").text = "Player " + str(player_id)


# Check when player is clicked.
func _input_event(viewport, event, _shapeidx):
	if event is InputEventMouseButton:
		if (event.button_index == BUTTON_LEFT and event.pressed):
			emit_signal("sprite_clicked", player_id, get_history_message())
			


func _on_Button_pressed():
	if (recipient.get_selected_id() + 1 == player_id):
		get_node("Msg").text = parent.get_node("Main/Message").text
		message_history.append(format_message(true))
		
		# Log the message in the global message history.
		emit_signal("log_message", player_id, format_message(true))
	else:
		get_node("Msg").text = ""

		
		
		
# Full decides wether or not to return both recipient and sender information.
func format_message(var full):
	var recipient_name = recipient.get_item_text(recipient.get_selected_id())
	var sender_name = sender.get_item_text(sender.get_selected_id())
	var message = parent.get_node("Main/Message").text

	if (full):
		return"[" + sender_name + " -> " + recipient_name + "]: " + message
	else:
		return"[" + sender_name + "]: " + message
		
		
func get_history_message():
	var message = ""
	
	for i in range(0, message_history.size()):
		message += "\n" + message_history[i]
		
	return message
