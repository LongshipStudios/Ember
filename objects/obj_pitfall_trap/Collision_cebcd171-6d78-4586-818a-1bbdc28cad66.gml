if(image_index == 1) //If the trap is open
{
	event_inherited(); //kill player
}
else
{
	if(!isOpening) //If we aren't already doing the open sequence
	{
		isOpening = true; //Start the open sequence
		alarm[0] = room_speed * 1.5; //constant is the amount of seconds to wait before opening the pitfall
	}
}