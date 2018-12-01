from PIL import Image

ASCII_CHARS = ['@','o','c',',','.',' ']

img = Image.open("img.png")
size=100

# resize the image so that it doesn't look so portrait when printed
def modify(img):
   new_dim = (size, size)
   new_img = img.resize(new_dim)
   return new_img.convert('L')

# make a list of ascii characters from the pixel data
def ascii(img):
   color_range=50
   initial_pixels = list(img.getdata())
   new_pixels = [ASCII_CHARS[pixel//color_range] for pixel in initial_pixels]
   return ''.join(new_pixels)

# print it out so it looks like an image
def printout(img):
    img=modify(img)
    chr=ascii(img)
    print_chr = [chr[index:index+size] for index in range(0, len(chr), size)]
    return '\n'.join(print_chr)

img = printout(img)
print(img)
