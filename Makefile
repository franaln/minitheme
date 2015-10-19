PACKAGE_STY = beamerthememini.sty
EXAMPLE_SRC    = example.tex
EXAMPLE_PDF    = example.pdf

TEXMFHOME   = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/minitheme

.PHONY: all install uninstall

install: $(PACKAGE_STY) $(DOC_PDF)
	@mkdir -p $(INSTALL_DIR)
	@cp $(PACKAGE_STY) $(INSTALL_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_STY))
	@rmdir $(INSTALL_DIR)
