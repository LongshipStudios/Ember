/// @description Movement
// You can write your code in this editor

// Keys

	//Move up key pressed?
	upKeyPressed = keyboard_check(ord("W"));
	
	//Move left key pressed?
	leftKeyPressed = keyboard_check(ord("A"));
	
	//Move down key pressed?
	downKeyPressed = keyboard_check(ord("S"));
	
	//Move right key pressed?
	rightKeyPressed = keyboard_check(ord("D"));
	

// Movement

	// Move up
	if upKeyPressed
		{
			//if (place_meeting(x, y - (spd+height), par_walkable) && 
			//	!place_meeting(x, y - spd, par_collidable))
				{
					y -= spd;
				}
		}
	
	// Move down
	if downKeyPressed
		{
		//	if (place_meeting(x, y + (spd+height), par_walkable) &&
		//		!place_meeting(x, y + spd, par_collidable))
			{
				y += spd;
			}
		}
		
	// Move left
	if leftKeyPressed
		{
		//	if (place_meeting(x - (spd+width), y, par_walkable) &&
		//		!place_meeting(x - spd, y, par_collidable))
				{
					x -= spd;
				}
		}
		
	// Move right	
	if rightKeyPressed
		{
		//	if (place_meeting(x + (spd+width), y, par_walkable) &&
		//		!place_meeting(x + spd, y, par_collidable))
				{
					x += spd;
				}
		}