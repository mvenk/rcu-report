all: rcu_report.tex
	pdflatex $<
	bibtex rcu_report
	pdflatex $<
	pdflatex $<

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
