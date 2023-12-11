.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf:proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
v1 dd  1 ,2 ,3,4
v2 dd 5 ,6,7,8

cd db 'A'
  
  format_integer db "%d " ,0

.code
start:
	mov EAX,0
	mov EDX,0
	mov AL, 2
	mov DL, 2
	mul DL
	SHL EAX, CL
	LEA AL, [EDI]
	ds1:
		push EDX
		push offset format_integer
		call printf
		add ESP,8
		inc ESI
	cmp ESI,4
	jl ds1
	

	push 0
	call exit
end start
