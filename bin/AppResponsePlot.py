#! /usr/bin/env python
# 
# Author: Soo Hwan Park 
# 
import sys
from numpy import *
import Gnuplot, Gnuplot.funcutils

def main(argv):
  terminal_format = "png"
  if len(argv) < 3:
    print "usage: ./AppReponsePlot.py root_dir [all|first] > file.png "
    sys.exit(0)
  elif len(argv) == 4 and argv[3] == "eps":
    terminal_format = "eps"

  root_dir = argv[1]

  g = Gnuplot.Gnuplot(debug=1)
  g.reset()
  if terminal_format == "eps":
    filename = root_dir + "/response.eps" 
    #g('set terminal epslatex size 800,600') # eps ..
    g('set term postscript eps enhanced')
    g("set output \"%s\"" % filename)
  else:
    g('set terminal png size 800,600') # png ..
  g('set data style linespoints') # give gnuplot an arbitrary command

  g.title("response time") # (optional)
  g.xlabel("time (s)")
  g.ylabel("response time (ms)")
  g.set_range('xrange', '[0:180]')

  filename = root_dir + "/" + "response.dat"

  if argv[2] == "all" :
    g.plot(Gnuplot.File(filename, using=(1,2,3), title="WRITE, READ", with_='yerrorbars'),
      Gnuplot.File(filename, using=(1,4,5), title="WRITE", with_='yerrorbars'),
      Gnuplot.File(filename, using=(1,6,7), title="READ", with_='yerrorbars'))
  else:
    g.plot(Gnuplot.File(filename, using=(1,2,3), title="WRITE, READ", with_='yerrorbars'))
    

if __name__=="__main__":
  try:
    main(sys.argv)
  except:
    raise

