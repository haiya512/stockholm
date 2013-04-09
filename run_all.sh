#!/bin/bash
cd /home/robcos/src/stockholm
#mysql -u root stocks  -v -f <quotes.sql
#mysql -u root stocks  -v -f <indicators.sql
#mysql -u root stocks  -v -f <portfolios.sql
#mysql -u root stocks  -v -f <positions.sql
#mysql -u root stocks  -v -f <my_portfolios.sql
python etc.py
python otherstocks.py
python omx-large-cap.py
python omx-mid-cap.py
python omx30.py
python footsie-350.py

python indicators.py
mysqldump -u root stocks >dump.sql
#python portfolio.py | expand -t 12
python find_breakouts.py |expand -t 20 >/tmp/entries
mail -s entries robcos@robcos.com </tmp/entries
cat /tmp/entries
