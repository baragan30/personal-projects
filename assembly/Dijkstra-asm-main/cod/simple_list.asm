.model flat, stdcall
includelib msvcrt.lib
extern malloc :proc
extern printf :proc

.data 
format db "%d", 10,0

lista_simpla struct
	next dd 0
	nod dd -1
	distanta dd 0
	
lista_simpla ends

	
push_list macro n,dis,p                ;nod ,distanta,pointer la pointer
	    push EAX
		push EBX
		
		push dword ptr 12                    ;cream nodul nou
		call malloc
		add ESP,4
		
		mov EBX,dis
		mov [eax+8],ebx
		mov EBX ,n
		mov [EAX+4],EBX
		
		mov EBX,p
		mov EBX,[ebx]
		mov [EAX],EBX
		
		mov EBX,p
		mov [EBX],EAX
		
		pop EBX
		pop EAX
		
endm	

push_queue macro n,dis,p                ;nod ,distanta,pointer la pointer
		local loop1
	    push EAX
		push EBX
		
		mov EBX,p
		cmp EBX,0
		je assign
		
		loop1:
		
		cmp [EBX],0
		jne loop1
		assign:
		
		push dword ptr 12                    ;cream nodul nou
		call malloc
		add ESP,4
		
		mov EBX,dis
		mov [eax+8],ebx
		mov EBX ,n
		mov [EAX+4],EBX
		
		mov EBX,p
		mov EBX,[ebx]
		mov [EAX],EBX
		
		mov EBX,p
		mov [EBX],EAX
		
		pop EBX
		pop EAX
		
endm