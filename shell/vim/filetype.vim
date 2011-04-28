" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.ihtml            setfiletype php
    au! BufRead,BufNewFile *.thtml            setfiletype php
    au! BufRead,BufNewFile *.ctp              setfiletype php
    au! BufRead,BufNewFile *.inc              setfiletype php
augroup END
