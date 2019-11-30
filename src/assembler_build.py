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
    # find all assembler files
    for filename in ITEMS:
        print(filename)
        if filename.endswith('.asm'):
            fileName = fileName.strip('.asm')
            
            # compile ASM file
            compile_ASM(filename)
            # boot ASM->bin file with qemu
            boot_QEMU(filename)

if __name__ == "__main__":
    main()