all: html docx rtf

html: resume.html
resume.html: print.css resume.md
	pandoc --standalone -H print.css \
        --from markdown --to html \
        -o resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

clean:
	rm resume.html
	rm resume.tex
	rm resume.log
	rm resume.docx
	rm resume.rtf
	rm resume.pdf
