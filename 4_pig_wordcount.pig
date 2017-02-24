lines = LOAD '/user/root/pig_demo.txt' USING PigStorage() AS (line:chararray);
filtered_lines = FILTER lines by $0 is not null;
words = FOREACH filtered_lines GENERATE FLATTEN(TOKENIZE(line)) AS word;
grouped_words = GROUP words by word;
word_count = FOREACH grouped_words GENERATE group,COUNT_STAR(words);
ordered_wc = ORDER word_count by $0;
STORE ordered_wc INTO '/user/root/pig/wordcount' USING PigStorage(':');
