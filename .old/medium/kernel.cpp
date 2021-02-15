void printf(char* str) {
	// monitor will print anything at 0xb8000 mem loc
	static unsigned short* VideoMemory = (unsigned short*)0xb8000;

	for (int i = 0; str[i] != '\0'; ++i) {
		VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
	}
}

extern "C" void kernalMain(void* multiboot_structure, uint32_t magicnumber) {
	printf("Hello, World!");
	while(1);
}
