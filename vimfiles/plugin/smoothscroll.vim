function ScrollUp (isFullScroll)
  let s:ScrollVal = 0
  if a:isFullScroll == 1
    let s:ScrollVal = &lines
  else
    let s:ScrollVal = (&lines / 2)
  endif
  for s:i in range(1, s:ScrollVal)
    redraw
    normal 
  endfor

function! ScrollDown (isFullScroll)
  let s:ScrollVal = 0
  if a:isFullScroll == 1
    let s:ScrollVal = &lines
  else
    let s:ScrollVal = (&lines / 2)
  endif
  for s:i in range(1, s:ScrollVal)
    redraw
    normal 
  endfor
endfunction
endfunction

nnoremap <C-u> :call ScrollUp(0)<CR>
nnoremap <C-d> :call ScrollDown(0)<CR>
nnoremap <C-b> :call ScrollUp(1)<CR>
nnoremap <C-f> :call ScrollDown(1)<CR>
