# segv

Logs SIGSEGV to a file, with stack trace data provided by `libSigSegv.so` (which comes with glibc).  Segfaults are logged to `$TMPDIR/segfault-$NAME-$timestamp`.

It's effectively a re-implementation of the `catchsegv.sh` shell script included with eglibc.

## example

```sh
$ ./segv test/test
$ cat $TMPDIR/segfault-*
*** Segmentation fault
Register dump:

 RAX: 0000000000000000   RBX: 0000000000000000   RCX: 0000000000000000
 RDX: 00007fffe8c94288   RSI: 00007fffe8c94278   RDI: 0000000000000001
 RBP: 00007fffe8c94190   R8 : 00007f9179bfde80   R9 : 00007f9179e18560
 R10: 00007fffe8c94020   R11: 00007f917985fdd0   R12: 0000000000400400
 R13: 00007fffe8c94270   R14: 0000000000000000   R15: 0000000000000000
 RSP: 00007fffe8c94190

 RIP: 00000000004004fd   EFLAGS: 00010246

 CS: 0033   FS: 0000   GS: 0000

 Trap: 0000000e   Error: 00000006   OldMask: 00000000   CR2: 00000000

 FPUCW: 0000037f   FPUSW: 00000000   TAG: 00000000
 RIP: 00000000   RDP: 00000000

 ST(0) 0000 0000000000000000   ST(1) 0000 0000000000000000
 ST(2) 0000 0000000000000000   ST(3) 0000 0000000000000000
 ST(4) 0000 0000000000000000   ST(5) 0000 0000000000000000
 ST(6) 0000 0000000000000000   ST(7) 0000 0000000000000000
 mxcsr: 1f80
 XMM0:  00000000000000000000000000000000 XMM1:  00000000000000000000000000000000
 XMM2:  00000000000000000000000000000000 XMM3:  00000000000000000000000000000000
 XMM4:  00000000000000000000000000000000 XMM5:  00000000000000000000000000000000
 XMM6:  00000000000000000000000000000000 XMM7:  00000000000000000000000000000000
 XMM8:  00000000000000000000000000000000 XMM9:  00000000000000000000000000000000
 XMM10: 00000000000000000000000000000000 XMM11: 00000000000000000000000000000000
 XMM12: 00000000000000000000000000000000 XMM13: 00000000000000000000000000000000
 XMM14: 00000000000000000000000000000000 XMM15: 00000000000000000000000000000000

Backtrace:
test/test[0x4004fd]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf5)[0x7f917985fec5]
test/test[0x400429]

Memory map:

00400000-00401000 r-xp 00000000 fc:02 22818577                           /home/riggle/gatekeeper/segv/test/test
00600000-00601000 r--p 00000000 fc:02 22818577                           /home/riggle/gatekeeper/segv/test/test
00601000-00602000 rw-p 00001000 fc:02 22818577                           /home/riggle/gatekeeper/segv/test/test
00ffa000-0101f000 rw-p 00000000 00:00 0                                  [heap]
7f9179628000-7f917963e000 r-xp 00000000 fc:01 1705503                    /lib/x86_64-linux-gnu/libgcc_s.so.1
7f917963e000-7f917983d000 ---p 00016000 fc:01 1705503                    /lib/x86_64-linux-gnu/libgcc_s.so.1
7f917983d000-7f917983e000 rw-p 00015000 fc:01 1705503                    /lib/x86_64-linux-gnu/libgcc_s.so.1
7f917983e000-7f91799f9000 r-xp 00000000 fc:01 1707495                    /lib/x86_64-linux-gnu/libc-2.19.so
7f91799f9000-7f9179bf8000 ---p 001bb000 fc:01 1707495                    /lib/x86_64-linux-gnu/libc-2.19.so
7f9179bf8000-7f9179bfc000 r--p 001ba000 fc:01 1707495                    /lib/x86_64-linux-gnu/libc-2.19.so
7f9179bfc000-7f9179bfe000 rw-p 001be000 fc:01 1707495                    /lib/x86_64-linux-gnu/libc-2.19.so
7f9179bfe000-7f9179c03000 rw-p 00000000 00:00 0 
7f9179c03000-7f9179c07000 r-xp 00000000 fc:01 1707491                    /lib/x86_64-linux-gnu/libSegFault.so
7f9179c07000-7f9179e06000 ---p 00004000 fc:01 1707491                    /lib/x86_64-linux-gnu/libSegFault.so
7f9179e06000-7f9179e07000 r--p 00003000 fc:01 1707491                    /lib/x86_64-linux-gnu/libSegFault.so
7f9179e07000-7f9179e08000 rw-p 00004000 fc:01 1707491                    /lib/x86_64-linux-gnu/libSegFault.so
7f9179e08000-7f9179e2b000 r-xp 00000000 fc:01 1707489                    /lib/x86_64-linux-gnu/ld-2.19.so
7f9179ff8000-7f9179ffb000 rw-p 00000000 00:00 0 
7f917a028000-7f917a02a000 rw-p 00000000 00:00 0 
7f917a02a000-7f917a02b000 r--p 00022000 fc:01 1707489                    /lib/x86_64-linux-gnu/ld-2.19.so
7f917a02b000-7f917a02c000 rw-p 00023000 fc:01 1707489                    /lib/x86_64-linux-gnu/ld-2.19.so
7f917a02c000-7f917a02d000 rw-p 00000000 00:00 0 
7fffe8c75000-7fffe8c97000 rw-p 00000000 00:00 0                          [stack]
7fffe8dc1000-7fffe8dc3000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
```
