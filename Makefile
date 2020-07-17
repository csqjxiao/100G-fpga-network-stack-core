SYNTHESIS_FOLDER_NOHBM = synthesis_results_noHBM
SYNTHESIS_FOLDER_HBM = synthesis_results_HBM

.PHONY:all
all: nohbm hbm

.PHONY:nohbm
nohbm:
	mkdir -p $(SYNTHESIS_FOLDER_NOHBM)
	cp Makefile.synthesis $(SYNTHESIS_FOLDER_NOHBM)/Makefile
	make -C $(SYNTHESIS_FOLDER_NOHBM) -j4

.PHONY: hbm
hbm:
	mkdir -p $(SYNTHESIS_FOLDER_HBM)
	cp Makefile.synthesis $(SYNTHESIS_FOLDER_HBM)/Makefile
	sed -i 's/xcvu9p-flga2104-2l-e/xcu280-fsvh2892-2L-e/g' $(SYNTHESIS_FOLDER_HBM)/Makefile
	make -C $(SYNTHESIS_FOLDER_HBM) -j4

clean:
	rm -rf *.log *.jou

distclean:
	rm -rf $(SYNTHESIS_FOLDER_NOHBM)
	rm -rf $(SYNTHESIS_FOLDER_HBM)