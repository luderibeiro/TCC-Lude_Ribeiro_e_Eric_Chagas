TARGET = TCC_FGA.pdf

LATEXMK = latexmk
LATEXMK_FLAGS = -pdf -quiet

VERSION = 0.1.0

FIXOS_DIR = fixos
FIXOS_SOURCES = informacoes.tex fichaCatalografica.tex \
		folhaDeAprovacao.tex pacotes.tex comandos.tex setup.tex	\
		listasAutomaticas.tex indiceAutomatico.tex

FIXOS_FILES = $(addprefix $(FIXOS_DIR)/, $(FIXOS_SOURCES))

EDITAVEIS_DIR = editaveis
EDITAVEIS_SOURCES = informacoes.tex errata.tex dedicatoria.tex \
					agradecimentos.tex epigrafe.tex resumo.tex abstract.tex \
					abreviaturas.tex simbolos.tex introducao.tex \
					aspectosgerais.tex consideracoes.tex textoepostexto.tex \
					elementosdotexto.tex elementosdopostexto.tex \
					apendices.tex anexos.tex

EDITAVEIS_FILES = $(addprefix $(EDITAVEIS_DIR)/, $(EDITAVEIS_SOURCES))

MAIN_FILE = tcc.tex

.PHONY: all clean dist-clean

all: $(TARGET)

$(TARGET): $(MAIN_FILE) $(SOURCES) bibliografia.bib
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN_FILE)

clean:
	$(LATEXMK) -c
	rm -f *.backup

dist: clean
	tar vczf tcc-fga-latex-$(VERSION).tar.gz *

dist-clean: clean
	rm -f $(TARGET)
