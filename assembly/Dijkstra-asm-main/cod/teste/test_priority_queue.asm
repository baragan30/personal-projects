.386
.model flat, stdcall


include priority_queue.asm

includelib mylib.asm
extern exit: proc
extern printf:proc
extern malloc:proc

;include simple_list.asm




public start


.data
	format_afisare db "%p %p %p ",10,0
    pointer dd 0

.code
start:
	push_pqueue dword ptr 1,dword ptr 2,  pointer
	push_pqueue dword ptr 2,dword ptr 4 , pointer
	push_pqueue dword ptr 3,dword ptr 6 , pointer	
	;pop_pqueue pointer
	push_pqueue dword ptr 4,dword ptr 1 , pointer
	push_pqueue dword ptr 5,dword ptr 2 , pointer	
	
	
	mov EBX,pointer
	
	push [EBX+8]
	push [EBX+4]
	push [EBX]
	push offset format_afisare
	call printf
	add ESP ,16
	
	mov EBX,[EBX]
	push [EBX+8]
	push [EBX+4]
	push [EBX];
	push offset format_afisare
	call printf
	add ESP ,16
	
	mov EBX,[EBX]
	push [EBX+8]
	push [EBX+4]
	push [EBX];
	push offset format_afisare
	call printf
	add ESP ,16
	
	mov EBX,[EBX]
	push [EBX+8]
	push [EBX+4]
	push [EBX];
	push offset format_afisare
	call printf
	add ESP ,16

	
	call exit
end start

