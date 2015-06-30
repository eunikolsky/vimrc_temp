if exists("g:objc_test_loaded")
    "finish
endif

let g:objc_test_loaded = 1

silent! unmap <leader>t

function! XCTestFile()
    let [line, col] = searchpos('\(@implementation[[:space:]]\+\)\@<=\([[:alpha:]]\+\)', 'bn')
    echomsg "found? " line ":" col
    if (line == 0) && (col ==0)
        return
    endif

    let testClassName = getline(line)[(col - 1):]
    echomsg "test class " testClassName
endfunction

map <leader>t :call XCTestFile()<CR>
