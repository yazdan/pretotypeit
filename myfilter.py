#!/usr/bin/env python

"""
Pandoc filter to convert all level 2+ headers to paragraphs with
emphasized text.
"""

from pandocfilters import toJSONFilter, Str
import locale
import logging
import os

log = logging.getLogger(os.path.basename(__file__))

def configure_logging():
	format_string = "%(name)s: [%(levelname)s] %(message)s"
	logging.basicConfig(format=format_string, level=logging.DEBUG)
	log.debug("Debug logging enabled.")
	
def behead(key, value, format, meta):
	
	log.info('key = ')
	log.info(key)
	log.info('value = ')
	log.info(value)
	log.info('format = ')
	log.info(format)
	log.info('meta = ')
	log.info(meta)
	if format == 'latex':
		if key == 'Str':
			try:
				value.encode('ascii')
				return Str('\lr{'+value+'}')
			except UnicodeEncodeError:
				log.info( "string is UTF-8")
			
	

if __name__ == "__main__":
	configure_logging()
	toJSONFilter(behead)