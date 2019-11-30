import os

ITEMS = os.listdir(".")

def compile_ASM(fileName):
    # compile asm file using nasm
    commandOut = f'nasm -f bin {fileName}.asm -o {fileName}.bin'
    os.system(commandOut)

def boot_QEMU(fileName):
    # boot bin using qemu
    commandOut = f'qemu-system-x86_64 {fileName}.bin -boot c'
    os.system(commandOut)

def main():
    for filename in ITEMS:
        print(filename)
        if filename.endswith('.asm'):
            fileName = fileName.strip('.asm')
            
        #     # asmFile = input('File Name: ')
            compile_ASM(filename)
            boot_QEMU(filename)

if __name__ == "__main__":
    # file = input('File Name: ')
    # compile_ASM(file)
    # os.system('qemu-system-x86_64')
    # boot_QEMU(input('File Name: '))
    main()