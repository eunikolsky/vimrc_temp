"http://stackoverflow.com/a/1691209/635603

"set verbose=9
if exists("b:gitcommit_loaded")
    finish
end

" don't load twice in one buffer
let b:gitcommit_loaded = 1

" automatically save the latest git commit message into the "g register
function GitCommitMsgReady()
    " copy the whole file in case no comment (^#) found later
    " if it is found, rewrite the register with lines from the beginning up to
    " the first comment (excluding it)
    1,$y g
    1;/^#/-1y g
endfunction

autocmd BufWritePre * if &ft ==# 'gitcommit' | call GitCommitMsgReady() | endif
