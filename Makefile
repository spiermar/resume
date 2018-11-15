.DEFAULT_GOAL := default

# default
default: pdf clean

# create resume
resume:
	xelatex resume
	biber resume
	xelatex resume

# create cv
cv:
	xelatex cv
	biber cv
	xelatex cv

# clean
clean:
	rm -rf resume.log resume.out resume.aux resume.blg resume.bbl resume.bcf resume.run.xml resume.pdf
	rm -rf cv.log cv.out cv.aux cv.blg cv.bbl cv.bcf cv.run.xml cv.pdf