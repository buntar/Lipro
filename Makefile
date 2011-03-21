NAME=app
SRC=article
SOURCE=${SRC}.lp
NWSRC=${SRC}.nw
MDSRC=${SRC}.md
PROGRAM= ${NAME}
DOC= ${NAME}.html
MD2HTML=md2html
LP2MD=./lp2md.pl
LP2NW=./lp2nw.pl
BROWSER=chromium-browser

.SILENT:retangle
.SILENT:lp2nw


all: tangle weave

md:
	$(LP2MD) ${SOURCE} > ${MDSRC}

nw:
	$(LP2NW) ${SOURCE} > ${NWSRC}

tangle: nw
	notangle -R${NAME} ${NWSRC} > ${PROGRAM}

	#syncweb -lang shell ${NWSRC} ${PROGRAM}

retangle: nw
	rm -f ${PROGRAM}
	syncweb -lang shell ${NWSRC} ${PROGRAM}

weave: md
	$(MD2HTML) ${MDSRC} > ${DOC}
