#From .md to .html

paper.html: paper.md 
	pandoc paper.md -s -o paper.html