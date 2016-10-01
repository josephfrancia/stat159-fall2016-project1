#From .md to .html


.PHONY: clean

paper.html: paper.md 
	cd paper; pandoc $^ -s -o $@


paper.md: paper/sections/*.md
	pandoc $^ -s -o $@; mv $@ paper


clean: 
	cd paper; rm paper.html; rm paper.md