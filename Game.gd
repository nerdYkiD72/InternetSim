extends Node


export (NodePath) var recipient_dropdown_path
export (NodePath) var sender_dropdown_path
export (NodePath) var message_text_path

onready var recipient = get_node(recipient_dropdown_path)
onready var sender = get_node(sender_dropdown_path)
onready var message_text = get_node(message_text_path)

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var on_color = Color( 0, 0.392157, 0, 1 )


func _process(delta):
	pass


func _on_Send_pressed():
	get_node("Main/Button").disabled = true

	# Reset all colors.
	reset_colors()

	# Find the path the message will take then select it.
	select_lines(find_lines(recipient.get_selected_id() + 1, sender.get_selected_id() + 1))
	
	
	get_node("Main/Button").disabled = false
	
	
func reset_colors():
	get_node("Ln1-2").default_color = Color(0.16, 0.16, 0.17, 1)
	get_node("Ln2-3").default_color = Color(0.16, 0.16, 0.17, 1)
	get_node("Ln3-4").default_color = Color(0.16, 0.16, 0.17, 1)
	get_node("Ln4-5").default_color = Color(0.16, 0.16, 0.17, 1)
	get_node("Ln1-5").default_color = Color(0.16, 0.16, 0.17, 1)
	
	
func rand_left_right():
	if (rng.randi_range(0, 10) % 2 == 0):
		print("Adding")
		return true
		
	else:
		print("Subtracting")
		return false


func find_lines(sender, recipient):
	var lines = [sender]
	var i = sender
	
	if (rand_left_right()):
		while (i != recipient):
			i += 1
			if (i > 5):
				i = 1

			lines.append(i)
	else:
		while (i != recipient):
			i -= 1
			if (i <= 0):
				i = 5

			lines.append(i)
	
	print(lines)
	return lines


func select_lines(lines):
	print("Selecting Lines:")
	for i in range(0, lines.size()):
		if (i <= lines.size() - 2):
			var format = "Ln%s-%s"
			var name_string = ""
			if (lines[i] < lines[i + 1]):
				name_string = format % [lines[i], lines[i + 1]]
			else:
				name_string = format % [lines[i + 1], lines[i]]


			var ln_node = get_node(name_string)

			print(name_string)
			print(ln_node)

			ln_node.default_color = Color( 0, 0.392157, 0, 1 )

