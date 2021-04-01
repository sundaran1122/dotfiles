"if snippets
ab if if() {<CR><++><CR>}<CR><++><Esc>kkki
ab ifelse if() {<CR><++><CR>} <++> else {<CR><++><CR>}<CR><++><Esc>kkkkki
ab elseif else if() {<CR><++><CR>} <++> <Esc>kkf(a

"functions
ab func (<++>) {<CR><++><CR>}<Esc>kki
ab main int main(int argc, char** argv) {<CR>return 0;<CR>}<Esc>kO

"switch statements
ab switch switch() {<CR>case <++>:<CR><++><CR>break;<CR>default:<CR><++><CR>break;<CR>}<CR><++><Esc>kkkkkkkkf(a
ab case case:<CR><++><CR>break;<Esc>kki

"preprocessors
ab incq #include ""<Left>
ab inc #include <><Left>

"loops
ab for for() {<CR><++><CR>}<CR><++><Esc>kkka
ab fori for(:<++>) {<CR><++><CR>}<CR><++><Esc>kkka

ab while while() {<CR><++><CR>}<CR><++><Esc>kkklla
