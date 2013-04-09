import ystockquote
import time
import datetime
from datetime import date
import dao

from connecttion import db

def export(symbol):
  c = db.cursor()
  c.execute("select q.date, close from quote q where q.symbol = %s", (symbol,))
  rows = c.fetchall()
  print symbol
  print "Date,%s" % ('close',)
  for (date, close) in rows:
    print "%s,%s" % (date.strftime("%Y%m%d"), close)

#export('MIDW-B.ST')
export('SYSR.ST')
export('SCA-A.ST')
export('FPAR.ST')
#export('BEIJ-B.ST')
#export('REZT.ST')
