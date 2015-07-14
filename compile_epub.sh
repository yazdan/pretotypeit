#/usr/bin/sh

~/.cabal/bin/pandoc --template rtl.xml -t epub3 -S -o pretotypeit.epub --epub-embed-font='./epub/IRANSans-Bold-web.woff' --epub-embed-font='./epub/IRANSans-Light-web.woff' --epub-embed-font='./epub/IRANSans-Medium-web.woff' --epub-embed-font='./epub/IRANSans-UltraLight-web.woff' --epub-embed-font='./epub/IRANSans-web.woff' --epub-stylesheet=./epub/epub.css ./epub/title.txt this_is_embarrassing.md introduction.md translator_introduction.md the_right_it.md pretotyping.md it_will_fail.md pretotype_it.md test_it.md put_it_all_together.md now_go_make_it.md bonus_feature.md pretotyping_manifesto.md about_the_author.md acknowledgments.md follow_pretotyping.md 

