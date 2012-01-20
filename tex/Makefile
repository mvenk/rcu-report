OUT=rcu_report.pdf
TEX=$(patsubst %.pdf, %.tex, $(OUT))
TABLES=macro_vr_0w.tex
RCUDIR=/home/madhuri/click_rcu/race
RWLDIR=/home/madhuri/click_rcu_master_tests/race
MACROB=$(wildcard $(RCUDIR)/macrobenchmarks/out/testsummary* $(RWLDIR)/macrobenchmarks/out/testsummary*)
all: $(OUT)

$(OUT): $(TEX) $(TABLES)
	pdflatex $<
	bibtex rcu_report
	pdflatex $<
	pdflatex $<

macro_vr_0w.tex:
	python ../scripts/macrotable.py $(RCUDIR)/macrobenchmarks/out/testsummary_macro_rcu_vr_0w.out $(RWLDIR)/macrobenchmarks/out/testsummary_macro_rwl_vr_0w.out macro_vr_0w.tex

get:
	scp openat.seas.harvard.edu:click/click_rcu/race/macrobenchmarks/out/testsummary* graphs/results/
	scp openat.seas.harvard.edu:click/click_rcu_master_tests/race/macrobenchmarks/out/testsummary* graphs/results/
	scp openat.seas.harvard.edu:click/click_rcu/race/microbenchmarks/out/testsummary* graphs/results/
	scp openat.seas.harvard.edu:click/click_rcu_master_tests/race/microbenchmarks/out/testsummary* graphs/results/

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
