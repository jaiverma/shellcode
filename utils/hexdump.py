import sys
import codecs

def f(fname):
    data = bytes()
    with open(fname, 'rb') as f:
        data = f.read()
    return data

def main():
    shellcode = f(sys.argv[1])
    print(shellcode)
    print(codecs.encode(shellcode, 'hex'))

main()
