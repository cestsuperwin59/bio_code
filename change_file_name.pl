##chang file name in subdirectories

find ./* -type d -not -empty -exec mv \{\}/mobtyper_aggregate_report.txt \{\}_aggregate.txt \;

##add a column with its file name

for i in *; do nawk '{print FILENAME"\t"$0}' $i > $i.txt; mv $i.txt $i; done
