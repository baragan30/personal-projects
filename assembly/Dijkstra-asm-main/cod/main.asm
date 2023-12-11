.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

includelib msvcrt.lib
extern exit: proc
extern printf:proc
extern fscanf :proc
extern fopen :proc
extern malloc :proc

include citire.asm
include simple_list.asm
include format.asm
include dijkstra.asm


;declaram simbolul start ca public - de acolo incepe executia
public start
.data
	n dd 0
	m dd 0
	nods dd 0
	nodf dd 0
	numenoduri dd 0
	muchii dd 0
.code
start:
	citeste n,nods,nodf,m,numenoduri,muchii
	dijkstra n,m,nods,nodf,numenoduri,muchii
	
	; mov EAX,muchii
	; mov EAX,[EAX+8]
	; mov EAX,[EAX+4]
	; push EAX
	; push offset format_integer
	; call printf
	; add ESP,8
	
	
	push 0
	call exit
end start
