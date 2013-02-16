import commands
import os
import time

def main():
  out = ""
  while out == "":   
    out = commands.getoutput("ps -A | grep awesome")
    #if out == "":
    time.sleep(1)
  os.system("echo 'awesome.restart()' | awesome-client")

if __name__ == '__main__':
  main()
