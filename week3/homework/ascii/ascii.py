from PIL import Image

# setup chars list to replace pixels
ASCII_CHARS = ['@','o','c',',','.',' ']

img = Image.open("img.png")

# new size for the image
size=100

# resize the image so that it doesn't look so portrait when printed
def modify(img):
   new_dim = (size, size)
   new_img = img.resize(new_dim)
# return image as gray scale
   return new_img.convert('L')

# make a list of ascii characters from the pixel data
def ascii(img):

# there are 6 chars in the ascii list, and the gray scale is between 0-255
# so use 50 to map the data into 0,1,2,3,4,5
   color_range=50
   initial_pixels = list(img.getdata())

# use ascii chars to replace pixel data
   new_pixels = [ASCII_CHARS[pixel//color_range] for pixel in initial_pixels]
   return ''.join(new_pixels)

# print it out so it looks like an image
def printout(img):
    img=modify(img)
    chr=ascii(img)

# rearrge chars based on the size of image
    print_chr = [chr[index:index+size] for index in range(0, len(chr), size)]
    return '\n'.join(print_chr)

img = printout(img)
print(img)
