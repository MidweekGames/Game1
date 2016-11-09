step_index++;
if (step_index == 1000000)
{
    step_index = 0;
}

// Inputs
movement_h = 0;
movement_v = 0;
if keyboard_check(vk_left)
{
    movement_h -= 1;
}
if keyboard_check(vk_right)
{
    movement_h += 1;
}
if keyboard_check(vk_up)
{
    movement_v -= 1;
}
if keyboard_check(vk_down)
{
    movement_v += 1;
}
input_primary_gun = keyboard_check(vk_space);
input_secondary_gun = keyboard_check(vk_lcontrol);

// Calculate speed
if (movement_v == 0)
{
    if (vspeed > 0)
    {
        vspeed -= min(vspeed, deceleration_v);
    }
    else if (vspeed < 0)
    {
        vspeed += min(abs(vspeed), deceleration_v);
    }
}
else
{
    vspeed += movement_v * acceleration_v;
    if (vspeed > max_speed_v)
    {
        vspeed = max_speed_v;
    }
    else if (vspeed < -max_speed_v)
    {
        vspeed = -max_speed_v;
    }
}
if (movement_h == 0)
{
    if (hspeed > 0)
    {
        hspeed -= min(hspeed, deceleration_h);
    }
    else if (hspeed < 0)
    {
        hspeed += min(abs(hspeed), deceleration_h);
    }
}
else
{
    hspeed += movement_h * acceleration_h;
    if (hspeed > max_speed_h)
    {
        hspeed = max_speed_h;
    }
    else if (hspeed < -max_speed_h)
    {
        hspeed = -max_speed_h;
    }
}
if (speed > max_speed)
{
    hspeed = sign(hspeed) * sqrt(max_speed * max_speed - vspeed * vspeed);
}

// Room background speed
/*if (vspeed > 0)
{
    background_vspeed[0] = vspeed + (1 / (max_speed_h - vspeed));
}
else
{
    background_vspeed[0] = 3 - vspeed/max_speed_h;
}*/

// Boundaries
if (x + hspeed < 0)
{
    x = 0;
    hspeed = 0;
}
else if (x + hspeed > room_width - sprite_width)
{
    x = room_width - sprite_width;
    hspeed = 0;
}
if (y + vspeed < 0)
{
    y = 0;
    vspeed = 0;
}
else if (y + vspeed > room_height - sprite_height)
{
    y = room_height - sprite_height;
    vspeed = 0;
}

//  Fire!!!
if (input_primary_gun)
{
    var time = current_time;
    if (time - primary_last_fired > 1000/primary_fire_rate)
    {
        primary_last_fired = time;
        instance_create(x + sprite_width * 0.5, y, obj_bullet);
    }
}
if (input_secondary_gun && bomb_count > 0)
{
    var time = current_time;
    if (time - secondary_last_fired > 1000/secondary_fire_rate)
    {
        secondary_last_fired = time;
        var bomb = instance_create(x + sprite_width * 0.5, y, obj_bomb);
        bomb.vspeed = vspeed;
        bomb.hspeed = hspeed;
        bomb_count--;
    }
}

// Fuel Consumption
if (step_index % room_speed == 0)
{
    fuel--;
}
