import sys

from colorama import init
init(strip=not sys.stdout.isatty())
from termcolor import cprint
from pyfiglet import figlet_format

cprint(figlet_format('8==D', font='doh'), 'green', attrs=['bold'])
