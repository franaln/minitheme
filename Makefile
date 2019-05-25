PACKAGE_STY = beamerthememini.sty

PACKAGE_EXTRA = physics.tex atlas_logo.pdf iflp_logo.pdf

TEXMFHOME   = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/minitheme

.PHONY: all install uninstall

install: default

default: $(PACKAGE_STY) $(PACKAGE_EXTRA)
	mkdir -p $(INSTALL_DIR)
	cp $(PACKAGE_STY) $(INSTALL_DIR)
	cp $(PACKAGE_EXTRA) $(INSTALL_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_STY))
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_EXTRA))
	@rmdir $(INSTALL_DIR)
