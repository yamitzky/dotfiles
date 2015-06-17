python << EOF
import os
import sys

home = os.path.expanduser("~")
path = home + "/anaconda/lib/python2.7/site-packages"
if not path in sys.path:
  sys.path.insert(0, path)
EOF
