;structure for locking
;struct {
;	uint64_t : 1 witeLock
;	uint64_t : 63 readLock	
;}

global ReadLock.unlock
global WriteLock.unlock
global ReadLock.tryLock
global WriteLock.tryLock


ReadLock:
	.unlock:
		dec rdi
		ret
	.tryLock:
		;TODO: timer interrupt
		test rdi, 1
		jnz .tryLock
	.lock:
		inc rdi
		ret

WriteLock:
	.unlock:
		xor rdi, rdi
		ret
	.tryLock:
		;TODO: timer interrupt
		cmp rdi, 0
		jne .tryLock
	.lock:
		mov rdi, 1
		ret