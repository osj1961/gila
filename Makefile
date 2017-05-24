all: pdf html
pdf: pdf/GILA.pdf
html: html/GILA.html

pdf/GILA.pdf: pdf/GILA.aux
	cd pdf; pdflatex GILA
pdf/GILA.aux: pdf/GILA.tex
	cd pdf; pdflatex GILA
pdf/GILA.tex: *.xml images
	cd pdf; test ! -e images && ln -s ../images; xsltproc --xinclude ../../mathbook/xsl/mathbook-latex.xsl ../GILA.xml

html/GILA.html: *.xml
	cd html;  test ! -e images && ln -s ../images; xsltproc --stringparam html.css.extra extra.css --stringparam html.knowl.example 'no' --xinclude ../../mathbook/xsl/mathbook-html.xsl ../GILA.xml
clean::
	rm *.aux *~ *.bak */*.aux */*~ */*.bak pdf/*.pdf html/*.html
check::
	xmllint --xinclude --postvalid --noout --dtdvalid ../mathbook/schema/dtd/mathbook.dtd ./GILA.xml 2> dtd-errors.txt
images::
	cd images; make
