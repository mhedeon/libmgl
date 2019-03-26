NAME = libmgl

#------------------------------- HEADERS ---------------------------------------
H_DIR = ./headers

H_LIST = libmgl.h \
			window.h \
			ttf.h \
			checkbox.h \
			color.h \
			color_picker.h \
			slider.h

HEADERS = $(addprefix $(H_DIR)/, $(H_LIST))
#-------------------------------------------------------------------------------

#------------------------------- TEST ------------------------------------------
TEST_DIR = ./test

TEST_SRC = main.c

TEST_SRC_LIST = $(addprefix $(TEST_DIR)/, TEST_SRC)
#-------------------------------------------------------------------------------

#------------------------------- WINDOW ----------------------------------------
WINDOW_DIR = ./window

WINDOW_SRC = window_create.c \
				window_update.c \
				error.c \
				pixel.c \
				window_draw.c

WINDOW_SRC_LIST = $(addprefix $(WINDOW_DIR)/, $(WINDOW_SRC))
#-------------------------------------------------------------------------------

#------------------------------- TTF -------------------------------------------
TTF_DIR = ./ttf

TTF_SRC = ttf.c

TTF_SRC_LIST = $(addprefix $(TTF_DIR)/, $(TTF_SRC))
#-------------------------------------------------------------------------------

#------------------------------- CHECKBOX --------------------------------------
CHECKBOX_DIR = ./checkbox

CHECKBOX_SRC = checkbox_create.c \
				checkbox_draw.c \
				checkbox_get_data.c \
				checkbox_set_data.c \
				checkbox_check.c

CHECKBOX_SRC_LIST = $(addprefix $(CHECKBOX_DIR)/, $(CHECKBOX_SRC_LIST))
#-------------------------------------------------------------------------------

#------------------------------- COLOR -----------------------------------------
COLOR_DIR = ./color

COLOR_SRC = convertion_hsv_rgb.c

COLOR_SRC_LIST = $(addprefix $(COLOR_DIR)/, $(COLOR_SRC_LIST))
#-------------------------------------------------------------------------------

#------------------------------- COLOR PICKER ----------------------------------
PICKER_DIR = ./color_picker

PICKER_SRC = picker_create.c \
				picker_draw.c \
				picker_set_data.c \
				picker_get_data_hsv.c \
				picker_get_data_pos.c

PICKER_SRC_LIST = $(addprefix $(PICKER_DIR)/, $(PICKER_SRC_LIST))
#-------------------------------------------------------------------------------

#------------------------------- in test ---------------------------------------
#------------------------------- SLIDER ----------------------------------------
SLIDER_DIR = ./slider

SLIDER_SRC = slider_create.c \
				slider_draw.c \
				slider_set_data.c

SLIDER_SRC_LIST = $(addprefix $(SLIDER_DIR)/, $(SLIDER_SRC_LIST))
#-------------------------------------------------------------------------------

#------------------------------- OBJECTS ---------------------------------------
OBJ_DIR = ./obj

OBJ_LIST = $(addprefix $(OBJ_DIR)/, $(TEST_SRC:.c=.o))
OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(WINDOW_SRC:.c=.o))
OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(TTF_SRC:.c=.o))
OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(CHECKBOX_SRC:.c=.o))
OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(COLOR_SRC:.c=.o))
OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(PICKER_SRC:.c=.o))

OBJ_LIST += $(addprefix $(OBJ_DIR)/, $(SLIDER_SRC:.c=.o))
#-------------------------------------------------------------------------------

#------------------------------- INCLUDES --------------------------------------
FLAGS = -Wall -Werror -Wextra

INCLUDES = -I $(H_DIR) \
 			-I./frameworks/SDL2.framework/Headers/ \
			-I./frameworks/SDL2_image.framework/Headers/ \
			-I./frameworks/SDL2_mixer.framework/Headers/ \
			-I./frameworks/SDL2_ttf.framework/Headers/ \
			-F./frameworks

FRAMEWORKS = -F./frameworks -rpath ./frameworks -framework SDL2 \
												-framework SDL2_image \
												-framework SDL2_mixer \
												-framework SDL2_ttf
#-------------------------------------------------------------------------------

#------------------------------- MAKE ------------------------------------------
all: $(NAME)

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)
#-------------------------------------------------------------------------------

#------------------------------- LINK ------------------------------------------
$(NAME): $(OBJ_DIR) $(OBJ_LIST) $(HEADERS)
	@gcc -o $(NAME) $(OBJ_LIST) $(FRAMEWORKS)
#-------------------------------------------------------------------------------

#------------------------------- COMPILE ---------------------------------------
#------------------------------- TEST
$(OBJ_DIR)/%.o : $(TEST_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- WINDOW
$(OBJ_DIR)/%.o : $(WINDOW_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- TTF
$(OBJ_DIR)/%.o : $(TTF_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- CHECKBOX
$(OBJ_DIR)/%.o : $(CHECKBOX_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- COLOR
$(OBJ_DIR)/%.o : $(COLOR_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- COLOR PICKER
$(OBJ_DIR)/%.o : $(PICKER_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)

#------------------------------- SLIDER in test
$(OBJ_DIR)/%.o : $(SLIDER_DIR)/%.c $(HEADERS)
	@gcc $(FLAGS) -c $< -o $@ $(INCLUDES)
#-------------------------------------------------------------------------------

#------------------------------- CLEAN -----------------------------------------
clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all
#-------------------------------------------------------------------------------

#------------------------------- DEBUG -----------------------------------------
pr: print-OBJ_LIST print-HEADERS print-QWE

print-%  : ; @echo $* = $($*)
#-------------------------------------------------------------------------------
