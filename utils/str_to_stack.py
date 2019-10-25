'''
Script to convert a string to opcodes to push it
onto the stack.
E.g. 'Hello world\n' ->
    push 0x0a646c72
    push 0x6f77206f
    push 0x6c6c6548
'''

import sys
import codecs

def f(s):
    cmds = []
    # pad string to be a multiple of 4
    pad_n = len(s) % 4
    l_s = s[::-1]
    for i in range(0, len(l_s), 4):
        cmd = 'push 0x{}'.format(codecs.encode(l_s[i:i+4], 'hex').decode('utf-8'))
        cmds.append(cmd)
    return cmds

def main():
    s = b'hello world\n'
    # s = b'//home//orw/flag'
    cmds = f(s)
    print('\n'.join(cmds))

main()
