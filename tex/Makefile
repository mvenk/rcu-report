OUT=rcu_report.pdf
TEX=$(patsubst %.pdf, %.tex, $(OUT))
TABLES=macro_vr_0w.tex macro_vr_1w.tex macro_0r_vw.tex macro_1r_vw.tex micro_vr_0w.tex micro_vr_1w.tex micro_0r_vw.tex micro_1r_vw.tex
RCUDIR=/home/madhuri/click_rcu/race
RWLDIR=/home/madhuri/click_rcu_master_tests/race
MACROB=$(wildcard $(RCUDIR)/macrobenchmarks/out/testsummary* $(RWLDIR)/macrobenchmarks/out/testsummary*)
all: $(OUT)

$(OUT): $(TEX) $(TABLES)
	pdflatex $<
	pdflatex $<
	bibtex rcu_report
	pdflatex $<
	pdflatex $<

macro_vr_0w.tex:
	python ../scripts/macrotable.py $(RCUDIR)/macrobenchmarks/out/testsummary_macro_rcu_vr_0w.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_rwl_vr_0w.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_non_vr_0w.out $@

macro_vr_1w.tex:
	python ../scripts/macrotable.py $(RCUDIR)/macrobenchmarks/out/testsummary_macro_rcu_vr_1w.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_rwl_vr_1w.out $@

macro_0r_vw.tex:
	python ../scripts/macrotable.py $(RCUDIR)/macrobenchmarks/out/testsummary_macro_rcu_0r_vw.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_rwl_0r_vw.out $@

macro_1r_vw.tex:
	python ../scripts/macrotable.py $(RCUDIR)/macrobenchmarks/out/testsummary_macro_rcu_1r_vw.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_rwl_1r_vw.out $@

micro_vr_0w.tex:
	python ../scripts/macrotable.py $(RCUDIR)/microbenchmarks/out/testsummary_micro_rcu_vr_0w.out $(RWLDIR)/microbenchmarks/out/testsummary_micro_rwl_vr_0w.out $(RWLDIR)/microbenchmarks/out/testsummary_micro_non_vr_0w.out $@

micro_vr_1w.tex:
	python ../scripts/macrotable.py $(RCUDIR)/microbenchmarks/out/testsummary_micro_rcu_vr_1w.out $(RWLDIR)/microbenchmarks/out/testsummary_micro_rwl_vr_1w.out $@

micro_0r_vw.tex:
	python ../scripts/macrotable.py $(RCUDIR)/microbenchmarks/out/testsummary_micro_rcu_0r_vw.out $(RWLDIR)/microbenchmarks/out/testsummary_micro_rwl_0r_vw.out $@

micro_1r_vw.tex:
	python ../scripts/macrotable.py $(RCUDIR)/microbenchmarks/out/testsummary_micro_rcu_1r_vw.out $(RWLDIR)/microbenchmarks/out/testsummary_micro_rwl_1r_vw.out $@

backup:
	cp -v rcu_report.tex ../Dropbox/cs597a/
	cp -v *.dia ../Dropbox/cs597a/
	cp -v *.eps ../Dropbox/cs597a/
	cp -v rcu_report.pdf ../Dropbox/cs597a/
	cp -r graphs/ ../Dropbox/cs597a/graphs

macro: macrobenchmark.pdf

macrobenchmark.pdf: macrobenchmark_section.tex 
	pdflatex $<
	pdflatex $<

macrobenchmark_section.tex: macrobenchmark.tex

view:
	evince rcu_report.pdf
clean:
	rm *.aux *.log *.pdf
	rm micro_*.tex
	rm macro_*.tex