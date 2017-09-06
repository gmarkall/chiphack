riscv32-unknown-elf-gcc blink.c -o blink -O2
riscv32-unknown-elf-objdump -dr blink

blink:     file format elf32-littleriscv


Disassembly of section .text:

00010094 <main>:
   10094:	ff010113          	addi	sp,sp,-16
   10098:	000187b7          	lui	a5,0x18
   1009c:	00912623          	sw	s1,12(sp)
   100a0:	6a078793          	addi	a5,a5,1696 # 186a0 <__global_pointer$+0x66b0>
   100a4:	00000493          	li	s1,0
   100a8:	00148493          	addi	s1,s1,1
   100ac:	fef49ee3          	bne	s1,a5,100a8 <main+0x14>
   100b0:	fff44413          	not	s0,s0
   100b4:	00000493          	li	s1,0
   100b8:	ff1ff06f          	j	100a8 <main+0x14>

000100bc <_start>:
   100bc:	00002197          	auipc	gp,0x2
   100c0:	f3418193          	addi	gp,gp,-204 # 11ff0 <__global_pointer$>
   100c4:	00400137          	lui	sp,0x400
   100c8:	ffc10113          	addi	sp,sp,-4 # 3ffffc <__global_pointer$+0x3ee00c>
   100cc:	00001517          	auipc	a0,0x1
   100d0:	73050513          	addi	a0,a0,1840 # 117fc <_edata>
   100d4:	00001617          	auipc	a2,0x1
   100d8:	74460613          	addi	a2,a2,1860 # 11818 <_end>
   100dc:	00c50863          	beq	a0,a2,100ec <_start+0x30>
   100e0:	00050023          	sb	zero,0(a0)
   100e4:	00150513          	addi	a0,a0,1
   100e8:	fea61ce3          	bne	a2,a0,100e0 <_start+0x24>
   100ec:	00000513          	li	a0,0
   100f0:	00000593          	li	a1,0
   100f4:	00000613          	li	a2,0
   100f8:	f9dff0ef          	jal	ra,10094 <main>
   100fc:	1000006f          	j	101fc <exit>

00010100 <_fini>:
   10100:	00008067          	ret

00010104 <deregister_tm_clones>:
   10104:	00011537          	lui	a0,0x11
   10108:	000117b7          	lui	a5,0x11
   1010c:	7f050713          	addi	a4,a0,2032 # 117f0 <__TMC_END__>
   10110:	7f078793          	addi	a5,a5,2032 # 117f0 <__TMC_END__>
   10114:	00e78c63          	beq	a5,a4,1012c <deregister_tm_clones+0x28>
   10118:	00000337          	lui	t1,0x0
   1011c:	00030313          	mv	t1,t1
   10120:	00030663          	beqz	t1,1012c <deregister_tm_clones+0x28>
   10124:	7f050513          	addi	a0,a0,2032
   10128:	00030067          	jr	t1
   1012c:	00008067          	ret

00010130 <register_tm_clones>:
   10130:	000117b7          	lui	a5,0x11
   10134:	00011537          	lui	a0,0x11
   10138:	7f078593          	addi	a1,a5,2032 # 117f0 <__TMC_END__>
   1013c:	7f050793          	addi	a5,a0,2032 # 117f0 <__TMC_END__>
   10140:	40f585b3          	sub	a1,a1,a5
   10144:	4025d593          	srai	a1,a1,0x2
   10148:	01f5d793          	srli	a5,a1,0x1f
   1014c:	00b785b3          	add	a1,a5,a1
   10150:	4015d593          	srai	a1,a1,0x1
   10154:	00058c63          	beqz	a1,1016c <register_tm_clones+0x3c>
   10158:	00000337          	lui	t1,0x0
   1015c:	00030313          	mv	t1,t1
   10160:	00030663          	beqz	t1,1016c <register_tm_clones+0x3c>
   10164:	7f050513          	addi	a0,a0,2032
   10168:	00030067          	jr	t1
   1016c:	00008067          	ret

00010170 <__do_global_dtors_aux>:
   10170:	80c1c703          	lbu	a4,-2036(gp) # 117fc <_edata>
   10174:	04071663          	bnez	a4,101c0 <__do_global_dtors_aux+0x50>
   10178:	ff010113          	addi	sp,sp,-16
   1017c:	00812423          	sw	s0,8(sp)
   10180:	00112623          	sw	ra,12(sp)
   10184:	00078413          	mv	s0,a5
   10188:	f7dff0ef          	jal	ra,10104 <deregister_tm_clones>
   1018c:	000007b7          	lui	a5,0x0
   10190:	00078793          	mv	a5,a5
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x38>
   10198:	00010537          	lui	a0,0x10
   1019c:	3bc50513          	addi	a0,a0,956 # 103bc <__EH_FRAME_BEGIN__>
   101a0:	ffff0097          	auipc	ra,0xffff0
   101a4:	e60080e7          	jalr	-416(ra) # 0 <__ri5cy_interrupt_0>
   101a8:	00100793          	li	a5,1
   101ac:	80f18623          	sb	a5,-2036(gp) # 117fc <_edata>
   101b0:	00c12083          	lw	ra,12(sp)
   101b4:	00812403          	lw	s0,8(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret
   101c0:	00008067          	ret

000101c4 <frame_dummy>:
   101c4:	000007b7          	lui	a5,0x0
   101c8:	00078793          	mv	a5,a5
   101cc:	02078663          	beqz	a5,101f8 <frame_dummy+0x34>
   101d0:	000125b7          	lui	a1,0x12
   101d4:	00010537          	lui	a0,0x10
   101d8:	ff010113          	addi	sp,sp,-16
   101dc:	80058593          	addi	a1,a1,-2048 # 11800 <object.3063>
   101e0:	3bc50513          	addi	a0,a0,956 # 103bc <__EH_FRAME_BEGIN__>
   101e4:	00112623          	sw	ra,12(sp)
   101e8:	ffff0097          	auipc	ra,0xffff0
   101ec:	e18080e7          	jalr	-488(ra) # 0 <__ri5cy_interrupt_0>
   101f0:	00c12083          	lw	ra,12(sp)
   101f4:	01010113          	addi	sp,sp,16
   101f8:	f39ff06f          	j	10130 <register_tm_clones>

000101fc <exit>:
   101fc:	ff010113          	addi	sp,sp,-16
   10200:	00000593          	li	a1,0
   10204:	00812423          	sw	s0,8(sp)
   10208:	00112623          	sw	ra,12(sp)
   1020c:	00050413          	mv	s0,a0
   10210:	020000ef          	jal	ra,10230 <__call_exitprocs>
   10214:	000117b7          	lui	a5,0x11
   10218:	7f47a503          	lw	a0,2036(a5) # 117f4 <_global_impure_ptr>
   1021c:	03c52783          	lw	a5,60(a0)
   10220:	00078463          	beqz	a5,10228 <exit+0x2c>
   10224:	000780e7          	jalr	a5
   10228:	00040513          	mv	a0,s0
   1022c:	120000ef          	jal	ra,1034c <_exit>

00010230 <__call_exitprocs>:
   10230:	fd010113          	addi	sp,sp,-48
   10234:	000117b7          	lui	a5,0x11
   10238:	01812423          	sw	s8,8(sp)
   1023c:	7f47ac03          	lw	s8,2036(a5) # 117f4 <_global_impure_ptr>
   10240:	01312e23          	sw	s3,28(sp)
   10244:	01412c23          	sw	s4,24(sp)
   10248:	01512a23          	sw	s5,20(sp)
   1024c:	01612823          	sw	s6,16(sp)
   10250:	02112623          	sw	ra,44(sp)
   10254:	02812423          	sw	s0,40(sp)
   10258:	02912223          	sw	s1,36(sp)
   1025c:	03212023          	sw	s2,32(sp)
   10260:	01712623          	sw	s7,12(sp)
   10264:	00050a93          	mv	s5,a0
   10268:	00058b13          	mv	s6,a1
   1026c:	00100a13          	li	s4,1
   10270:	fff00993          	li	s3,-1
   10274:	148c2903          	lw	s2,328(s8)
   10278:	02090863          	beqz	s2,102a8 <__call_exitprocs+0x78>
   1027c:	00492483          	lw	s1,4(s2)
   10280:	fff48413          	addi	s0,s1,-1
   10284:	02044263          	bltz	s0,102a8 <__call_exitprocs+0x78>
   10288:	00249493          	slli	s1,s1,0x2
   1028c:	009904b3          	add	s1,s2,s1
   10290:	040b0463          	beqz	s6,102d8 <__call_exitprocs+0xa8>
   10294:	1044a783          	lw	a5,260(s1)
   10298:	05678063          	beq	a5,s6,102d8 <__call_exitprocs+0xa8>
   1029c:	fff40413          	addi	s0,s0,-1
   102a0:	ffc48493          	addi	s1,s1,-4
   102a4:	ff3416e3          	bne	s0,s3,10290 <__call_exitprocs+0x60>
   102a8:	02c12083          	lw	ra,44(sp)
   102ac:	02812403          	lw	s0,40(sp)
   102b0:	02412483          	lw	s1,36(sp)
   102b4:	02012903          	lw	s2,32(sp)
   102b8:	01c12983          	lw	s3,28(sp)
   102bc:	01812a03          	lw	s4,24(sp)
   102c0:	01412a83          	lw	s5,20(sp)
   102c4:	01012b03          	lw	s6,16(sp)
   102c8:	00c12b83          	lw	s7,12(sp)
   102cc:	00812c03          	lw	s8,8(sp)
   102d0:	03010113          	addi	sp,sp,48
   102d4:	00008067          	ret
   102d8:	00492783          	lw	a5,4(s2)
   102dc:	0044a703          	lw	a4,4(s1)
   102e0:	fff78793          	addi	a5,a5,-1
   102e4:	02878c63          	beq	a5,s0,1031c <__call_exitprocs+0xec>
   102e8:	0004a223          	sw	zero,4(s1)
   102ec:	fa0708e3          	beqz	a4,1029c <__call_exitprocs+0x6c>
   102f0:	18892783          	lw	a5,392(s2)
   102f4:	008a16b3          	sll	a3,s4,s0
   102f8:	00492b83          	lw	s7,4(s2)
   102fc:	00f6f7b3          	and	a5,a3,a5
   10300:	02079263          	bnez	a5,10324 <__call_exitprocs+0xf4>
   10304:	000700e7          	jalr	a4
   10308:	00492783          	lw	a5,4(s2)
   1030c:	f77794e3          	bne	a5,s7,10274 <__call_exitprocs+0x44>
   10310:	148c2783          	lw	a5,328(s8)
   10314:	f92784e3          	beq	a5,s2,1029c <__call_exitprocs+0x6c>
   10318:	f5dff06f          	j	10274 <__call_exitprocs+0x44>
   1031c:	00892223          	sw	s0,4(s2)
   10320:	fcdff06f          	j	102ec <__call_exitprocs+0xbc>
   10324:	18c92783          	lw	a5,396(s2)
   10328:	0844a583          	lw	a1,132(s1)
   1032c:	00f6f6b3          	and	a3,a3,a5
   10330:	00069863          	bnez	a3,10340 <__call_exitprocs+0x110>
   10334:	000a8513          	mv	a0,s5
   10338:	000700e7          	jalr	a4
   1033c:	fcdff06f          	j	10308 <__call_exitprocs+0xd8>
   10340:	00058513          	mv	a0,a1
   10344:	000700e7          	jalr	a4
   10348:	fc1ff06f          	j	10308 <__call_exitprocs+0xd8>

0001034c <_exit>:
   1034c:	00000593          	li	a1,0
   10350:	00000613          	li	a2,0
   10354:	00000693          	li	a3,0
   10358:	05d00893          	li	a7,93
   1035c:	00000013          	nop
   10360:	00100073          	ebreak
   10364:	00000013          	nop
   10368:	00054463          	bltz	a0,10370 <_exit+0x24>
   1036c:	0000006f          	j	1036c <_exit+0x20>
   10370:	ff010113          	addi	sp,sp,-16
   10374:	00112623          	sw	ra,12(sp)
   10378:	008000ef          	jal	ra,10380 <__syscall_error>
   1037c:	0000006f          	j	1037c <_exit+0x30>

00010380 <__syscall_error>:
   10380:	ff010113          	addi	sp,sp,-16
   10384:	00812423          	sw	s0,8(sp)
   10388:	00112623          	sw	ra,12(sp)
   1038c:	00050413          	mv	s0,a0
   10390:	020000ef          	jal	ra,103b0 <__errno>
   10394:	408007b3          	neg	a5,s0
   10398:	00c12083          	lw	ra,12(sp)
   1039c:	00812403          	lw	s0,8(sp)
   103a0:	00f52023          	sw	a5,0(a0)
   103a4:	fff00513          	li	a0,-1
   103a8:	01010113          	addi	sp,sp,16
   103ac:	00008067          	ret

000103b0 <__errno>:
   103b0:	8081a503          	lw	a0,-2040(gp) # 117f8 <_impure_ptr>
   103b4:	00008067          	ret

Disassembly of section .interrupts:

00000000 <__ri5cy_interrupt_0>:
   0:	0000006f          	j	0 <__ri5cy_interrupt_0>

00000004 <__ri5cy_interrupt_1>:
   4:	ffdff06f          	j	0 <__ri5cy_interrupt_0>

00000008 <__ri5cy_interrupt_2>:
   8:	ff9ff06f          	j	0 <__ri5cy_interrupt_0>

0000000c <__ri5cy_interrupt_3>:
   c:	ff5ff06f          	j	0 <__ri5cy_interrupt_0>

00000010 <__ri5cy_interrupt_4>:
  10:	ff1ff06f          	j	0 <__ri5cy_interrupt_0>

00000014 <__ri5cy_interrupt_5>:
  14:	fedff06f          	j	0 <__ri5cy_interrupt_0>

00000018 <__ri5cy_interrupt_6>:
  18:	fe9ff06f          	j	0 <__ri5cy_interrupt_0>

0000001c <__ri5cy_interrupt_7>:
  1c:	fe5ff06f          	j	0 <__ri5cy_interrupt_0>

00000020 <__ri5cy_interrupt_8>:
  20:	fe1ff06f          	j	0 <__ri5cy_interrupt_0>

00000024 <__ri5cy_interrupt_9>:
  24:	fddff06f          	j	0 <__ri5cy_interrupt_0>

00000028 <__ri5cy_interrupt_10>:
  28:	fd9ff06f          	j	0 <__ri5cy_interrupt_0>

0000002c <__ri5cy_interrupt_11>:
  2c:	fd5ff06f          	j	0 <__ri5cy_interrupt_0>

00000030 <__ri5cy_interrupt_12>:
  30:	fd1ff06f          	j	0 <__ri5cy_interrupt_0>

00000034 <__ri5cy_interrupt_13>:
  34:	fcdff06f          	j	0 <__ri5cy_interrupt_0>

00000038 <__ri5cy_interrupt_14>:
  38:	fc9ff06f          	j	0 <__ri5cy_interrupt_0>

0000003c <__ri5cy_interrupt_15>:
  3c:	fc5ff06f          	j	0 <__ri5cy_interrupt_0>

00000040 <__ri5cy_interrupt_16>:
  40:	fc1ff06f          	j	0 <__ri5cy_interrupt_0>

00000044 <__ri5cy_interrupt_17>:
  44:	fbdff06f          	j	0 <__ri5cy_interrupt_0>

00000048 <__ri5cy_interrupt_18>:
  48:	fb9ff06f          	j	0 <__ri5cy_interrupt_0>

0000004c <__ri5cy_interrupt_19>:
  4c:	fb5ff06f          	j	0 <__ri5cy_interrupt_0>

00000050 <__ri5cy_interrupt_20>:
  50:	fb1ff06f          	j	0 <__ri5cy_interrupt_0>

00000054 <__ri5cy_interrupt_21>:
  54:	fadff06f          	j	0 <__ri5cy_interrupt_0>

00000058 <__ri5cy_interrupt_22>:
  58:	fa9ff06f          	j	0 <__ri5cy_interrupt_0>

0000005c <__ri5cy_interrupt_23>:
  5c:	fa5ff06f          	j	0 <__ri5cy_interrupt_0>

00000060 <__ri5cy_interrupt_24>:
  60:	fa1ff06f          	j	0 <__ri5cy_interrupt_0>

00000064 <__ri5cy_interrupt_25>:
  64:	f9dff06f          	j	0 <__ri5cy_interrupt_0>

00000068 <__ri5cy_interrupt_26>:
  68:	f99ff06f          	j	0 <__ri5cy_interrupt_0>

0000006c <__ri5cy_interrupt_27>:
  6c:	f95ff06f          	j	0 <__ri5cy_interrupt_0>

00000070 <__ri5cy_interrupt_28>:
  70:	f91ff06f          	j	0 <__ri5cy_interrupt_0>

00000074 <__ri5cy_interrupt_29>:
  74:	f8dff06f          	j	0 <__ri5cy_interrupt_0>

00000078 <__ri5cy_interrupt_30>:
  78:	f89ff06f          	j	0 <__ri5cy_interrupt_0>

0000007c <__ri5cy_interrupt_31>:
  7c:	f85ff06f          	j	0 <__ri5cy_interrupt_0>

00000080 <__ri5cy_reset_handler>:
  80:	00c0006f          	j	8c <__ri5cy_jump_to_start>

00000084 <__ri5cy_illegal_handler>:
  84:	ffdff06f          	j	80 <__ri5cy_reset_handler>

00000088 <__ri5cy_ecall_handler>:
  88:	ff9ff06f          	j	80 <__ri5cy_reset_handler>

0000008c <__ri5cy_jump_to_start>:
  8c:	0301006f          	j	100bc <_start>
