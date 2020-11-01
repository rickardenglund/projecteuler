import time


def main():
    min = 100
    max = 1000
    max_palindrome = 0
    maxa= -1
    maxb = -1

    for x in range(min, max):
        for y in range(min, max):
            if x * y > max_palindrome and is_palindrome(x*y):
                max_palindrome = x*y
                maxa = x
                maxb = y
    print(maxa, maxb, maxa*maxb)


def is_palindrome(n):
    n = str(n)
    start = n[:len(n)//2]
    end = n[::-1][:len(n)//2]

    return start == end


if __name__ == '__main__':
    start = time.perf_counter()
    main()
    elapse = time.perf_counter() - start
    print("time:", elapse, "s")
