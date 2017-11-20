all: html docx rtf

html: resume.html
resume.html: src/print.css src/resume.md
	pandoc --standalone -H src/print.css \
        --from markdown --to html \
        -o dist/resume.html src/resume.md

docx: resume.docx
resume.docx: src/resume.md
	pandoc -smart src/resume.md -o dist/resume.docx

rtf: resume.rtf
resume.rtf: src/resume.md
	pandoc -smart src/resume.md -o dist/resume.rtf

clean:
	rm dist/*

run:
	docker-compose up -d