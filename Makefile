.DEFAULT_GOAL := default

# default
default: pdf clean

# create pdf
resume:
	xelatex resume
	biber resume
	xelatex resume

# clean
clean:
	rm -rf resume.log resume.out resume.aux resume.blg resume.bbl resume.bcf resume.run.xml resume.pdf