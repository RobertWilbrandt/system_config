" Setup as described in the vim faq 26.8

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufNewFile,BufRead *.launch setfiletype xml
  au! BufNewFile,BufRead *.xacro setfiletype xml
  au! BufNewFile,BufRead *.urdf setfiletype xml
  au! BufNewFile,BufRead *.sdf setfiletype xml
  au! BufNewFile,BufRead *.md     setfiletype markdown
augroup END
