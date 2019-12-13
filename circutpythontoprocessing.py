import time #pylint: disable-msg=import-error
import board #pylint: disable-msg=import-error
from analogio import AnalogIn #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import simpleio #pylint: disable-msg=import-error

potentiometer = AnalogIn(board.A0)

uart = busio.UART(board.TX, board.RX, baudrate=9600)

def get_voltage(pin):
    return(pin.value * 3.3) / 6553

while True:
    #print (get_voltage(potentiometer))
    myPotValue = simpleio.map_range(potentiometer.value, 0, 65000, 0, 180)
    print((myPotValue))
    uart.write(bytes([int(myPotValue)]))
    time.sleep(.1)
