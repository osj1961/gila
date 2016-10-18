all: images
pdfs := $(patsubst %.fig,%.pdf,$(wildcard *.fig))
svgs := $(patsubst %.fig,%.svg,$(wildcard *.fig))

images: $(pdfs) $(svgs) 

%.pdf : %.fig
	fig2dev -L pdf $< > $@
%.svg : %.fig
	fig2dev -L svg $< > $@

clean:
	rm -f $(pdfs) $(svgs)
