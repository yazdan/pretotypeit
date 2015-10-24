#/usr/bin/sh
rm -f ./booksite/content/*
for i in *.md
do
	pandoc -f markdown+pipe_tables+simple_tables+table_captions --latex-engine=xelatex -R -i "$i" -o "./latex/${i%%.*}.tex" --filter ./pandoc-xepersian/pandoc-xepersian.py
	FULL_PATH=$(readlink -f $i)
	cp "$FULL_PATH" "./booksite/content/"
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

