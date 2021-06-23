#!/bin/python

import os
import time
from pathlib import Path

ANNE_PRO_2_INPUT_ID_GLOB = 'usb-OBINS_OBINS_AnnePro2_SN*1-event-*'
SLEEP_TIMEOUT = 1 * 24 * 3600

class AnneProInput(object):
    def __init__(self, path: Path):
        self.fo = open(path)

    def close(self):
        fo.close()


def main():
    pid = os.fork()

    if pid == 0:
        input_by_id_path = Path('/dev/input/by-id/')

        anne_pro_inputs = []
        inputs = list(input_by_id_path.glob(ANNE_PRO_2_INPUT_ID_GLOB))
        if len(inputs) == 0:
            raise FileNotFoundError("can't find any Anne Pro 2 inputs")
        for anne_pro_input_path in inputs:
            i = AnneProInput(anne_pro_input_path)
            anne_pro_inputs.append(i)

        # Waits forever
        while (not time.sleep(SLEEP_TIMEOUT)):
            pass

if __name__ == '__main__':
    main()

