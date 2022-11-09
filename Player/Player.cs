using Godot;
using System;

public class Player : KinematicBody2D
{
	[Export] public int MoveSpeed = 250;
	public override void _PhysicsProcess(float delta)
	{
		Vector2 motion = new Vector2();
		motion.x = Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left");
		motion.y = Input.GetActionStrength("move_down") - Input.GetActionStrength("move_up");

		MoveAndCollide(motion.Normalized() * MoveSpeed * delta);
	}
}
