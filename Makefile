PACKAGE_STY_DEFAULT = beamerthememini.sty
PACKAGE_STY_CASUAL  = beamerthememinicasual.sty

PACKAGE_EXTRA = minicommon.tex physics.tex susy.tex atlas_logo.pdf iflp_logo.pdf

TEXMFHOME   = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR_DEFAULT = $(TEXMFHOME)/tex/latex/minitheme
INSTALL_DIR_CASUAL  = $(TEXMFHOME)/tex/latex/minicasualtheme

.PHONY: all install uninstall

install: default casual

default: $(PACKAGE_STY_DEFAULT) $(PACKAGE_EXTRA)
	mkdir -p $(INSTALL_DIR_DEFAULT)
	cp $(PACKAGE_STY_DEFAULT) $(INSTALL_DIR_DEFAULT)
	cp $(PACKAGE_EXTRA) $(INSTALL_DIR_DEFAULT)

casual: $(PACKAGE_STY_CASUAL) $(PACKAGE_EXTRA)
	mkdir -p $(INSTALL_DIR_CASUAL)
	cp $(PACKAGE_STY_CASUAL) $(INSTALL_DIR_CASUAL)
	cp $(PACKAGE_EXTRA) $(INSTALL_DIR_CASUAL)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR_DEFAULT)/, $(PACKAGE_STY_DEFAULT))
	@rm -f $(addprefix $(INSTALL_DIR_CASUAL)/, $(PACKAGE_STY_CASUAL))
	@rm -f $(addprefix $(INSTALL_DIR_DEFAULT)/, $(PACKAGE_EXTRA))
	@rm -f $(addprefix $(INSTALL_DIR_CASUAL)/, $(PACKAGE_EXTRA))
	@rmdir $(INSTALL_DIR_DEFAULT)
	@rmdir $(INSTALL_DIR_CASUAL)
