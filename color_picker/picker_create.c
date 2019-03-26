#include "libmgl.h"

t_picker		*picker_create(int height)
{
	t_picker	*new;

	if ((new = (t_picker*)malloc(sizeof(t_picker))) == NULL)
	{
		error_log("Could not allocate memory for color picker");
		return (NULL);
	}
	new->hsv = (t_hsv) { 0, 0, 1.0 };
	new->pos = (SDL_Rect) { 0, 0, height, height };
	new->hue = (SDL_Rect) { 0 + height + height / 18, 0, height / 18, height };
	if ((new->sl_hue = slider_create(new->hue.w, new->hue.w / 2)) == NULL)
	{
		error_log("Could not allocate memory for slider");
		free(new);
		return (NULL);
	}
	if ((new->sl_pal = slider_create(new->hue.w / 2, new->hue.w / 2)) == NULL)
	{
		error_log("Could not allocate memory for slider");
		free(new->sl_hue);
		free(new);
		return (NULL);
	}
	return (new);
}

void			picker_delete(t_picker **picker)
{
	if (*picker == NULL)
		return ;
	free(*picker);
	*picker = NULL;
}
