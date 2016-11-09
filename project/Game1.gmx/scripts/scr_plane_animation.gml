if (step_index % 6 == 0)
{
    if (hspeed < 0) 
    {
        if (image_index > 0)
        {
            image_index--;
        }
    }
    else if (hspeed > 0) 
    {
        if (image_index < image_number -1 )
        {
            image_index++;
        }
    }
    else
    {
        if (image_index > 2)
        {
            image_index--;
        }
        if (image_index < 2 )
        {
            image_index++;
        }
    }
}

