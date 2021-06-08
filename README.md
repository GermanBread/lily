*Should've double-checked that script...*

# Huh, what's this?

A proof-of-concept rootkit(?) that fools the user into typing their password into a fake, localised, sudo prompt

I wanted to test my bash knowledge, so I created a rootkit!

Making this was really fun *if you count the occasional kernel panic here and there*

**You shouldn't run this on real hardware and I take no responsibility if you break your own Linux installation (you should be able to recover easily though)**

## How does this work?

This script is divided into 3 stages:

### STAGE 1

- Create a fake sudo binary
- Modify the users' rc-files to modify $PATH

### STAGE 2

- Abuse sudo pasword caching to hijack init

### STAGE 3

- Fun
- Restore init

# Important stuffs

**DO NOT RUN THIS OUTSIDE OF A VIRTUAL MACHINE UNLESS YOU KNOW WHAT YOU'RE DOING**

**DO NOT RUN THIS ON HARDWARE YOU DON'T OWN**

*Please don't do something stupid*

As of writing this I only tested this script on Arch Linux.