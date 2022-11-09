extends Control


export (NodePath) var recipient_dropdown_path
export (NodePath) var sender_dropdown_path
onready var recipient = get_node(recipient_dropdown_path)
onready var sender = get_node(sender_dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Add Items
	add_items()

func add_items():
	recipient.add_item("Client 1")
	recipient.add_item("Client 2")
	recipient.add_item("Client 3")
	recipient.add_item("Client 4")
	recipient.add_item("Client 5")
	
	
	# Add items to sender drop down.
	sender.add_item("Client 1")
	sender.add_item("Client 2")
	sender.add_item("Client 3")
	sender.add_item("Client 4")
	sender.add_item("Client 5")

