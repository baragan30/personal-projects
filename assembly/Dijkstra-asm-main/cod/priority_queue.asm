.model flat, stdcall
includelib msvcrt.lib
extern malloc :proc
extern printf :proc
extern free :proc

.data
	priority_queue struct
	pointer dd 0;
	nod dd 0;
	distanta dd 0;
	priority_queue ends

push_pqueue macro n,d,p  ;nod,distanta,pointer
	LOCAL repet,assign
	push ECX 
	push EBX 
	push EAX

	mov EBX,offset p
	
	repet:
	mov ECX ,[EBX]
	cmp ECX,dword ptr 0
	je assign                 
	mov ECX ,[ECX+8]
	mov EAX ,d
	cmp EAX ,ECX
	jle assign
	mov EBX,[EBX]
	jmp repet
	
	assign:
	push 12;
	call malloc
	add ESP,4
	mov ECX,n;     ;punem nodul
	mov [EAX+4],ECX
	mov ECX,d       ;punem distanta
	mov [EAX+8],ECX
	mov ECX ,[EBX]
	mov [EAX],ECX    ;punem nodul
	mov [EBX],EAX
	
	pop EAX 
	pop EBX 
	pop ECX
endm;

pop_pqueue macro p
	push p[4];salvam nodul
	push p;
	
	mov EAX,p
	mov EAX,[EAX] ;salvam in EAX poin
	mov p,EAX
	
	 call free;
	 add ESp,4
	
	pop EAX      ;nodul
	
endm
	