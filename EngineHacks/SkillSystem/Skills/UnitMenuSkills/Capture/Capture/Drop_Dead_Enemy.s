.thumb
.org 0x0

@set bit 0x1 of byte 1 if unit has 0 hp when being dropped
@jumped to from 183B0
@r2=char data of droppee

@r5 = dropper
@r6 = x coord (or 0 if giving/taking)
@r7 = y coord (or 0 if giving/taking)

strb	r0,[r5,#0x1B] @allegiance byte 
strb	r0,[r4,#0x1B] @allegiance byte 


strb	r6,[r4,#0x10]
strb	r7,[r4,#0x11]

ldrb	r0,[r4,#0x13]
cmp		r0,#0x0
bne		End

mov r0, #5
strb r0, [r4, #0x13] @give them 5 hp 

@str		r0,[r4]
@ldr		r0,[r4,#0xC]
@mov		r1,#0x9 @make them dead?
@orr		r0,r1
@str		r0,[r4,#0xC]
End:
pop		{r4-r7}
pop		{r0}
bx		r0
