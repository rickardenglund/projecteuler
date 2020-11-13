import matplotlib.pyplot as plt
import numpy

example_image = numpy.array([[0, 0, 0, 1],
                             [0, 0, 1, 0],
                             [1, 1, 0, 0],
                             [1, 1, 0, 0]])


def main():
    show()
    print('Result: ', compress(example_image))


def compress(img):
    (w, _) = img.shape
    # print(img)

    if is_unicolor(img):
        if img[0, 0] == 1:
            return "11"
        elif img[0, 0] == 0:
            return "10"
        else:
            raise Exception('invalid color')

    # print('splitting')
    a = compress(img[0:w // 2, 0:w // 2])
    b = compress(img[0:w // 2, w // 2:w])
    c = compress(img[w // 2:w, 0:w // 2])
    d = compress(img[w // 2:w, w // 2:w])
    return "0" + a + b + c + d


def show():
    plt.imshow(example_image[0:4, 0:4])
    plt.show()


def is_unicolor(img):
    clr = img[0][0]
    for y in range(len(img)):
        for x in range(len(img[y])):
            # print(x,y, img[y][x])
            if clr != img[y][x]:
                return False
    return True


if __name__ == '__main__':
    main()
