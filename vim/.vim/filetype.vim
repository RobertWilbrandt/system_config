" Setup as described in the vim faq 26.8

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufNewFile,BufRead *.launch setfiletype xml
  au! BufNewFile,BufRead *.md     setfiletype markdown
  au! BufNewFile,BufRead *.txt    setfiletype text
augroup END
