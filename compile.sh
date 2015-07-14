#/usr/bin/sh
for i in *.md
do
	pandoc -f markdown+pipe_tables+simple_tables+table_captions --latex-engine=xelatex -R -i "$i" -o "./latex/${i%%.*}.tex" --filter ./pandoc-xepersian/pandoc-xepersian.py
	FULL_PATH=$(readlink -f $i)
	ln -s "$FULL_PATH" "./booksite/content/"
done

cd latex
for i in *.tex
do
	sed -i.bak 's/\[<+->\]//' "$i"
	sed -i.bak 's/\\def\\labelenumi{\\arabic{enumi}.}//g' "$i"
	sed -i.bak 's/\\itemsep1pt\\parskip0pt\\parsep0pt//g' "$i"
	
done

xelatex -interaction=nonstopmode -synctex=-1 "doc.tex"

cd ..

pandoc -t epub3 -S -o pretotypeit.epub --epub-embed-font='./epub/IRANSans-Bold-web.ttf' --epub-embed-font='./epub/IRANSans-Light-web.ttf' --epub-embed-font='./epub/IRANSans-Medium-web.ttf' --epub-embed-font='./epub/IRANSans-UltraLight-web.ttf' --epub-embed-font='./epub/IRANSans-web.ttf' --epub-stylesheet=./epub/epub.css ./epub/title.txt this_is_embarrassing.md introduction.md translator_introduction.md the_right_it.md pretotyping.md it_will_fail.md pretotype_it.md test_it.md put_it_all_together.md now_go_make_it.md bonus_feature.md pretotyping_manifesto.md about_the_author.md acknowledgments.md follow_pretotyping.md 

