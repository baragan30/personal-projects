.386
.model flat, stdcall



includelib mylib.asm
extern exit: proc
extern printf:proc
extern malloc:proc
extern free :proc

include simple_list.asm




public start


.data
	format_afisare db "%p %p ",10,0
    pointer dd 0

.code
start:
	push_list dword ptr 1,pointer
	push_list dword ptr 2 ,pointer
	push_list dword ptr 3 ,pointer	
	
	
	mov EBX, pointer
	
	push [EBX+4]
	push [EBX]
	push offset format_afisare
	call printf
	add ESP ,12
	
	mov EBX,[EBX]
	push [EBX+4]
	push [EBX];
	push offset format_afisare
	call printf
	add ESP ,12
	
	mov EBX,[EBX]
	push [EBX+4]
	push [EBX];
	push offset format_afisare
	call printf
	add ESP ,12

	
	call exit
end start


