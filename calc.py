import ctypes

I = ctypes.c_int8
U = ctypes.c_uint8

_add = lambda x, y: I(I(x).value + I(y).value).value
_add_u = lambda x, y: U(U(x).value + U(y).value).value

def add(x, y):
    return _add(x, y), bin(_add_u(x, y))[2:].rjust(8, '0')

while True:
    x, y = map(int, input(': ').split())
    print(add(x, y))

